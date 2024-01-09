import 'dart:async';
import 'package:flutter/material.dart';
import 'package:police/common/app_colors.dart';
import 'package:police/views/login/widgets/loading.dart';
import 'package:police/views/login/widgets/logo_conatiner.dart';
import 'package:police/views/login/widgets/submit_button.dart';
import '../../common/constants.dart';
import '../../common/local_data_storage.dart';
import '../../services/navigation/navigation_service.dart';
import 'login_service/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isVisible = false;
  bool isLoading = false;
  bool isScreenLoading = true;

  void decide(){
    String ok = getAuthToken();
    Timer(const Duration(seconds: 2), () {
      if(ok.isNotEmpty){
        NavigationService().replace('/dashboard');
        return;
      }
      else{
        setState(() {
          isScreenLoading = false;
        });
      }
    });
  }

@override
  void initState() {
    decide();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: isScreenLoading ? const CircularProgressIndicator() :
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding * 2),
              child: Column(
                children: [
                  logo(),
                  const SizedBox(height: 30),
                  const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (val) {
                            if (val == "") {
                              return "Please Enter some valid email.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                child: isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          onChanged: (val) {
                            password = val;
                          },
                          validator: (val) {
                            if (val == "") {
                              return "Please Enter a valid password.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        Material(
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                await login(email, password).then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (value.isEmpty) {
                                    NavigationService()
                                        .navigateTo('/dashboard');
                                  }
                                });
                              }
                            },
                            child: isLoading ? showLoading() : loginButton(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
