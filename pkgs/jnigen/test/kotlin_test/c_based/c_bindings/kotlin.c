// Copyright (c) 2023, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Autogenerated by jnigen. DO NOT EDIT!

#include <stdint.h>
#include "dartjni.h"
#include "jni.h"

thread_local JNIEnv* jniEnv;
JniContext* jni;

JniContext* (*context_getter)(void);
JNIEnv* (*env_getter)(void);

void setJniGetters(JniContext* (*cg)(void), JNIEnv* (*eg)(void)) {
  context_getter = cg;
  env_getter = eg;
}

// com.github.dart_lang.jnigen.SuspendFun
jclass _c_SuspendFun = NULL;

jmethodID _m_SuspendFun__new0 = NULL;
FFI_PLUGIN_EXPORT
JniResult SuspendFun__new0() {
  load_env();
  load_class_global_ref(&_c_SuspendFun,
                        "com/github/dart_lang/jnigen/SuspendFun");
  if (_c_SuspendFun == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  load_method(_c_SuspendFun, &_m_SuspendFun__new0, "<init>", "()V");
  if (_m_SuspendFun__new0 == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  jobject _result =
      (*jniEnv)->NewObject(jniEnv, _c_SuspendFun, _m_SuspendFun__new0);
  return to_global_ref_result(_result);
}

jmethodID _m_SuspendFun__sayHello = NULL;
FFI_PLUGIN_EXPORT
JniResult SuspendFun__sayHello(jobject self_, jobject continuation) {
  load_env();
  load_class_global_ref(&_c_SuspendFun,
                        "com/github/dart_lang/jnigen/SuspendFun");
  if (_c_SuspendFun == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  load_method(_c_SuspendFun, &_m_SuspendFun__sayHello, "sayHello",
              "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
  if (_m_SuspendFun__sayHello == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  jobject _result = (*jniEnv)->CallObjectMethod(
      jniEnv, self_, _m_SuspendFun__sayHello, continuation);
  return to_global_ref_result(_result);
}

jmethodID _m_SuspendFun__sayHello1 = NULL;
FFI_PLUGIN_EXPORT
JniResult SuspendFun__sayHello1(jobject self_,
                                jobject string,
                                jobject continuation) {
  load_env();
  load_class_global_ref(&_c_SuspendFun,
                        "com/github/dart_lang/jnigen/SuspendFun");
  if (_c_SuspendFun == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  load_method(
      _c_SuspendFun, &_m_SuspendFun__sayHello1, "sayHello",
      "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;");
  if (_m_SuspendFun__sayHello1 == NULL)
    return (JniResult){.value = {.j = 0}, .exception = check_exception()};
  jobject _result = (*jniEnv)->CallObjectMethod(
      jniEnv, self_, _m_SuspendFun__sayHello1, string, continuation);
  return to_global_ref_result(_result);
}
