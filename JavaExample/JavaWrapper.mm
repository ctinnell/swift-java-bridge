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


JNIEnv* create_vm(JavaVM ** jvm) {
    JavaVMInitArgs vm_args;
    JavaVMOption options;
    //options.optionString = "-D."; //Path to
    options.optionString = "-Djava.class.path=/Users/ctinnell/Development/osx/JavaExample/JavaExample"; //Path to the java source code
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

jclass get_bridge_class() {
    jclass bridgeClass = NULL;
        JavaVM *jvm;
    //bridgeClass = env->FindClass("com/objcbridge/ObjCBridge");
    
        if (jvm->AttachCurrentThread((void**) &env, NULL) == JNI_OK)
        {
            //
            bridgeClass = env->FindClass("com/objcbridge/ObjCBridge");
            if (env->ExceptionCheck()) {
                printf("\nError Finding Class\n");
                env->ExceptionDescribe();
            }

            if (bridgeClass != nil)
            {
               printf("\nFound class\n");

                //(*env)->DeleteLocalRef(env, javaTestCls);
            }
            else
            {
                printf("\nDidn't Find class\n"); }

            //jvm->DetachCurrentThread();
        }
        else
        {
             printf("\nJVM Not Created\n");
        }
    return bridgeClass;

}

void initialize_vm() {
    JNIEnv *env;
    JavaVM * jvm;
    env = create_vm(&jvm);
}

-(void)initialize {
    initialize_vm();
    jclass javaBridge = get_bridge_class();
}
//
//- (void) accessJavaClass
//{
//    JavaVM* jvm;     JNIEnv* env;
//    
//    JavaVMOption options[1];
//    
//    options[0].optionString = "-Djava.class.path=.";
//    
//    JavaVMInitArgs args;
//    args.version = JNI_VERSION_1_6;
//    
//    args.options = options;
//    
//    args.nOptions = 1;
//    
//    int envError = JNI_CreateJavaVM(&jvm, (void**) &env, &args);
//    
//    if (envError == JNI_OK)
//        
//    {
//        if ((*jvm)->AttachCurrentThread(jvm, (void**) &env, NULL) == JNI_OK)
//        {
//            jclass javaTestCls = (*env)->FindClass(env, "JavaTest");
//            
//            if (javaTestCls != nil)
//            {
//                NSLog(@”Accessed”);
//                
//                (*env)->DeleteLocalRef(env, javaTestCls);
//            }
//            else
//            {
//                NSLog(@”Not Accessed”); }
//            
//            (jvm[0])->DetachCurrentThread(jvm);
//        }
//    }
//    else
//    {
//        NSLog(@”JVM has not created”);
//    }
//}


@end
