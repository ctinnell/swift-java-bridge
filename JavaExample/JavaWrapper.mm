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



JNIEnv* create_vm(JavaVM ** jvm) {
    JNIEnv *env;
    JavaVMInitArgs vm_args;
    JavaVMOption options;
    options.optionString = "-Djava.class.path=D:\\Java Src\\TestStruct"; //Path to the java source code
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

void initialize_vm() {
    JNIEnv *env;
    JavaVM * jvm;
    env = create_vm(&jvm);
}

-(void)initialize {
    initialize_vm();
}


@end
