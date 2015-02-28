//
//  JavaCWrapper.c
//  JavaExample
//
//  Created by Clay Tinnell on 2/28/15.
//  Copyright (c) 2015 Clay Tinnell. All rights reserved.
//

#include "JavaCWrapper.h"
#include "JavaVM/jni.h"
#include "stdio.h"
#include <string>
#include <iostream>

// cached refs for later callbacks
JavaVM * g_vm;
jobject g_obj;
jmethodID g_mid;

JNIEXPORT jboolean JNICALL Java_com_adamish_Foo_register
(JNIEnv * env, jobject obj, jlong hwnd) {
    bool returnValue = true;
    // convert local to global reference
    // (local will die after this method call)
    g_obj = env->NewGlobalRef(obj);
    
    // save refs for callback
    jclass g_clazz = env->GetObjectClass(g_obj);
    if (g_clazz == NULL) {
        std::cout << "Failed to find class" << std::endl;
    }
    
    g_mid = env->GetMethodID(g_clazz, "callback", "(I)V");
    if (g_mid == NULL) {
        std::cout << "Unable to get method ref" << std::endl;
    }
    
    return (jboolean)returnValue;
}

void callback(int val) {
    JNIEnv * g_env;
    // double check it's all ok
    int getEnvStat = g_vm->GetEnv((void **)&g_env, JNI_VERSION_1_6);
    if (getEnvStat == JNI_EDETACHED) {
        std::cout << "GetEnv: not attached" << std::endl;
        if (g_vm->AttachCurrentThread((void **) &g_env, NULL) != 0) {
            std::cout << "Failed to attach" << std::endl;
        }
    } else if (getEnvStat == JNI_OK) {
        //
    } else if (getEnvStat == JNI_EVERSION) {
        std::cout << "GetEnv: version not supported" << std::endl;
    }
    
    g_env->CallVoidMethod(g_obj, g_mid, val);
    
    if (g_env->ExceptionCheck()) {
        g_env->ExceptionDescribe();
    }
    
    g_vm->DetachCurrentThread();
}
