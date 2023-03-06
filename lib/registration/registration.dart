import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuma_test/registration/registration_provider.dart';

import '../utils/screen_size.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(context),
      child: Consumer<SignUpProvider>(builder: (context, provider, _) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: getHeight(context),
              width: getWidth(context),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: getHeight(context) * 0.14,
                    ),
                    Center(
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontSize: getHeight(context) * 0.05,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
                    ),
                    TextField(
                      controller: provider.firstNameController,
                      //keyboardType: TextInputType.phone,
                      //inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: "First Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: provider.lastNameController,
                      //keyboardType: TextInputType.phone,
                      //inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: "Last Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: provider.emailController,
                      //keyboardType: TextInputType.phone,
                      //inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: "Email",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: provider.userController,
                      //keyboardType: TextInputType.phone,
                      //inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          labelText: "User Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      //keyboardType: TextInputType.number,
                      //obscureText: !provider.passwordVisible,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 16),
                        // suffixIcon: IconButton(
                        //   icon: Icon(
                        //     provider.passwordVisible
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //   ),
                        //   onPressed: () {
                        //     provider.changeVisibility();
                        //   },
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * (0.08),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.05,
                      width: getWidth(context) * 0.6,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                           provider.register(context);
                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * (0.08),
                    ),
                    Row(
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: getHeight(context) * 0.02,
                          ),
                        ),
                        SizedBox(
                          width: getWidth(context) * (0.02),
                        ),
                        InkWell(
                          onTap: () {
                            provider.toLogin(context);
                          },
                          child: Text("Sign In ",
                              style: TextStyle(
                                  fontSize: getHeight(context) * 0.02,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text("Instead",
                            style: TextStyle(
                              fontSize: getHeight(context) * 0.02,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
