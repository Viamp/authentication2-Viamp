import 'package:f_authentication_template/domain/controllers/authentication_controller.dart';
import 'package:f_authentication_template/ui/pages/authentication/login_page.dart';
import 'package:f_authentication_template/ui/pages/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _pass;
  @override
  Widget build(BuildContext context) {
    AuthenticationController _authentication = Get.find();
    return Scaffold(
      key: Key('loginScaffold'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("App Login"),
            Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(16, 23, 0, 0),
                        child: Text("Email")),
                    TextFormField(
                        key: Key('loginEmail'),
                        validator: (value) {
                          setState(() {
                            _email = value;
                          });
                          if (value == null || value.isEmpty) {
                            return 'Email required!';
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
                            border: OutlineInputBorder())),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(15, 23, 0, 0),
                        child: Text("Password")),
                    TextFormField(
                      key: Key('loginPassword'),
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
                  ],
                )),
            ElevatedButton(
                key: Key('loginSubmit'),
                onPressed: () {
                  final form = _formkey.currentState;
                  form!.save();
                  if (form.validate()) {
                    _authentication.login(_email, _pass).then((value) {
                      if (value) {
                        final snackbar = SnackBar(
                          content: Text('User ok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        final snackbar = SnackBar(
                          content: Text('User problem ocurred'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    });
                  } else {
                    final snackbar = SnackBar(
                      content: Text('Validation nok'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                child: Text("Login")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("Create user"))
          ],
        ),
      ),
    );
  }
}
