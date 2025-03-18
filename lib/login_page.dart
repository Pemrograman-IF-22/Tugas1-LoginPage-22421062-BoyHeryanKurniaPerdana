import 'package:flutter/material.dart';
import 'package:login/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0
                  ),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Masukkan Email Anda';
                      }
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10.0
                  ),
                  child: TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Masukkan Password Anda';
                      }
                        return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      debugPrint('Email: ${emailcontroller}');
                      debugPrint('Password: ${passwordcontroller}');

                      if (_formkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => DashboardPage(
                            email: emailcontroller.text,
                            password: passwordcontroller.text
                            )
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Silahkan Lengkapi Form'),
                          ),
                        );
                      }
                  },
                  child: Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          )
          )
      );
  }
}