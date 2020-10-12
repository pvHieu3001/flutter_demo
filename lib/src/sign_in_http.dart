// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_http.g.dart';

@JsonSerializable()
class FormData {
  String username;
  String password;

  FormData({
    this.username,
    this.password,
  });

  factory FormData.fromJson(Map<String, dynamic> json) =>
      _$FormDataFromJson(json);

  Map<String, dynamic> toJson() => _$FormDataToJson(this);
}

class SignInHttpDemo extends StatefulWidget {
  final http.Client httpClient;

  SignInHttpDemo({
    this.httpClient,
  });

  @override
  _SignInHttpDemoState createState() => _SignInHttpDemoState();
}

class _SignInHttpDemoState extends State<SignInHttpDemo> {
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in Form'),
      ),
      body: Form(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ...[
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'user name',
                      labelText: 'User Name',
                    ),
                    onChanged: (value) {
                      formData.username = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      formData.password = value;
                    },
                  ),
                  FlatButton(
                    child: Text('Sign in'),
                    onPressed: () async {
                      // Use a JSON encoded string to send
                      var result = await http.post(
                          'http://192.90.51.167:8383/api/users/authenticate',
                          body: json.encode(formData.toJson()),
                          headers: {'content-type': 'application/json','Accept': 'application/json'});
                      if (result.statusCode == 200) {
                        _showDialog('Succesfully signed in.');
                      } else if (result.statusCode == 401) {
                        _showDialog('Unable to sign in.');
                      } else {
                        _showDialog('Something went wrong. Please try again.');
                      }
                    },
                  ),
                ].expand(
                  (widget) => [
                    widget,
                    SizedBox(
                      height: 24,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
