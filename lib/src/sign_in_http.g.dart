// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$FormDataFromJson(Map<String, dynamic> json) {
  return FormData(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$FormDataToJson(FormData instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
