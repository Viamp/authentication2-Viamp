import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _pass;
  @override
  Widget build(BuildContext context) {
    AuthenticationController _authentication = Get.find();
    return Scaffold(
        key: Key('signUpScaffold'),
        body: Center(
            child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("App SignUp"),
            Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 23, 0, 0),
                      child: Text('Email')),
                  TextFormField(
                      key: Key('signUpEmail'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email required!';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Enter a valid email!';
                        }
                        setState(() {
                          _email = value;
                        });
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Enter your password',
                          border: OutlineInputBorder())),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                      child: Text("Password")),
                  TextFormField(
                    key: Key('signUpPassword'),
                    validator: (value) {
                      setState(() {
                        _pass = value;
                      });
                      if (value == null || value.isEmpty) {
                        return 'Password required!';
                      }
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: 'Enter your password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    key: Key('signUpSubmit'),
                    onPressed: () {
                      final form = _formkey.currentState;
                      form!.save();
                      if (form.validate()) {
                        _authentication.createUser(_email, _pass).then((value) {
                          if (value) {
                            final snack = SnackBar(
                                content: Text('User ok - Successufully'));
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                            Get.back();
                          } else {
                            final snack =
                                SnackBar(content: Text('User problem ocurred'));
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                            Get.back();
                          }
                        });
                      } else {
                        final snack = SnackBar(content: Text('Validation nok'));
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                        Get.back();
                      }
                    },
                    child: Text(
                      "Create user",
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
