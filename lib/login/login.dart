import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yuma_test/api_service/apis.dart';

import '../utils/screen_size.dart';
import 'login_provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(context),
      child: Consumer<LoginProvider>(builder: (context, provider, _) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: getHeight(context),
              width: getWidth(context),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: getHeight(context) * 0.14,
                    ),
                    Center(
                      child: Text("Sign In",
                          style: TextStyle(
                              fontSize: getHeight(context) * 0.05,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
                    ),
                    TextField(
                      controller: provider.userController,
                      //keyboardType: TextInputType.phone,
                      //inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "User Name",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          labelStyle: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: provider.passwordController,
                      //keyboardType: TextInputType.number,
                      obscureText: !provider.passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 16),
                        suffixIcon: IconButton(
                          icon: Icon(
                            provider.passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            provider.changeVisibility();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * (0.08),
                    ),
                    Container(
                      height: getHeight(context) * 0.05,
                      width: getWidth(context) * 0.6,
                      child: ElevatedButton(
                        child: Text('Sign In'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          provider.login(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * (0.08),
                    ),
                    Row(
                      children: [
                        Text("Don't have Account?",
                            style: TextStyle(
                                fontSize: getHeight(context) * 0.02,
                                )),
                        SizedBox(
                          width: getWidth(context) * (0.02),
                        ),
                        InkWell(
                          onTap: (){
                            provider.toRegistration(context);
                          },
                          child: Text("Sign Up ",
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
