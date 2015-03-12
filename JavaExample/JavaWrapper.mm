//
//  JavaWrapper.m
//  JavaExample
//
//  Created by Clay Tinnell on 2/28/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//
#import "JavaWrapper.h"
#include "JavaVM/jni.h"
#include "stdio.h"
#include <string>
#include <iostream>

@implementation JavaWrapper

JNIEnv *env;
jobject jdbcInstance;
jclass jdbcClass;

JNIEnv* create_vm(JavaVM ** jvm) {

    JavaVMInitArgs vm_args;
    JavaVMOption options;
    //options.optionString = "-D."; //Path to
    options.optionString = "-Djava.class.path=/Users/ctinnell/Development/osx/JavaExample/JavaExample:/Users/ctinnell/Development/osx/JavaExample/JavaExample/db2jcc4.jar"; //Path to the java source code
    vm_args.version = JNI_VERSION_1_6; //JDK version. This indicates version 1.6
    vm_args.nOptions = 1;
    vm_args.options = &options;
    vm_args.ignoreUnrecognized = 0;
    
    int ret = JNI_CreateJavaVM(jvm, (void**)&env, &vm_args);
    if(ret < 0)
        printf("\nUnable to Launch JVM\n");
    else
        printf("\nLaunched The JVM\n");
    return env;
}

jclass get_the_class() {
        jclass bridgeClass = NULL;
        JavaVM *jvm;
    
        if (jvm->AttachCurrentThread((void**) &env, NULL) == JNI_OK)
        {
            bridgeClass = env->FindClass("com/objcbridge/ObjCBridge");
            if (env->ExceptionCheck()) {
                printf("\nError Finding Class\n");
                env->ExceptionDescribe();
            }

            if (bridgeClass != nil)
            {
               printf("\nFound class\n");

            }
            else
            {
                printf("\nDidn't Find class\n"); }

        }
        else
        {
             printf("\nJVM Not Created\n");
        }
    return bridgeClass;

}

jclass get_connection_class() {
    jclass connectionClass = NULL;
    JavaVM * jvm;

    connectionClass = env->FindClass("com/objcbridge/JDBCWrapper");
    if (env->ExceptionCheck()) {
        printf("\nError Finding Class\n");
        env->ExceptionDescribe();
    }
    
    if (connectionClass != nil)
    {
        printf("\nFound class\n");
        
    }
    else
    {
        printf("\nDidn't Find class\n"); }
    
    return connectionClass;
}


void initialize_vm() {
    JNIEnv *env;
    JavaVM * jvm;
    env = create_vm(&jvm);
}

void get_db_connection(const char * name, const char * url, const char * userid, const char * password) {
    jdbcClass = get_connection_class();
    if (env->ExceptionCheck()) {
        printf("\nError Getting Connection Class\n");
        env->ExceptionDescribe();
    }

    //Constructor
    jmethodID constructorMethodID = env->GetMethodID(jdbcClass, "<init>", "()V");
    if (env->ExceptionCheck()) {
        printf("\nError Getting Method ID for Connection Class Constructor\n");
        env->ExceptionDescribe();
    }

    jdbcInstance = env->NewObject(jdbcClass, constructorMethodID);
    if (env->ExceptionCheck()) {
        printf("\nError Instantiating JDBC Object\n");
        env->ExceptionDescribe();
    }
    
    //Takes Standard Java Signature - ()-takes no parms   Ljava/lang/String; - returns string
    jmethodID javaMethodId = env->GetMethodID(jdbcClass, "connect",
                                              "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V");
    if (env->ExceptionCheck()) {
        printf("\nError Finding Connect Method ID\n");
        env->ExceptionDescribe();
    }
    
    // Call connect method
    
    jstring name_jstr = env->NewStringUTF(name);
    jstring url_jstr = env->NewStringUTF(url);
    jstring userid_jstr = env->NewStringUTF(userid);
    jstring pwd_jstr = env->NewStringUTF(password);

    
    env->CallVoidMethod(jdbcInstance, javaMethodId, url_jstr, name_jstr, userid_jstr, pwd_jstr);
    if (env->ExceptionCheck()) {
        printf("\nError Calling Connect Method");
        env->ExceptionDescribe();
        //http://stackoverflow.com/questions/10408972/how-to-obtain-a-description-of-a-java-exception-in-c-when-using-jni
    }
}

void execute_query(const char * sql) {
    jmethodID javaMethodId = env->GetMethodID(jdbcClass, "executeQuery",
                                              "(Ljava/lang/String;)V");
    if (env->ExceptionCheck()) {
        printf("\nError Finding Query Method ID\n");
        env->ExceptionDescribe();
    }
    
    jstring sql_jstr = env->NewStringUTF(sql);

    env->CallVoidMethod(jdbcInstance, javaMethodId, sql_jstr);
    
    if (env->ExceptionCheck()) {
        printf("\nError Calling Query Method");
        env->ExceptionDescribe();
    }
}

NSString *convertJavaString(jstring javaString) {
    NSString	*string;
    const char	*nativeString;
    
    nativeString = env->GetStringUTFChars(javaString, JNI_FALSE);
    string = [NSString stringWithUTF8String:nativeString];

    return string;
}

-(void)initialize {
    initialize_vm();
}

-(void) connect:(NSString *)name url:(NSString *)url userid:(NSString *)userid password:(NSString *)password {
    const char *nm = [name UTF8String];
    const char *ul = [url UTF8String];
    const char *ud = [userid UTF8String];
    const char *pw = [password UTF8String];
    get_db_connection(nm, ul, ud, pw);
}

-(void) executeQuery:(NSString *)queryText {
    const char *q = [queryText UTF8String];
    execute_query(q);
}

@end
