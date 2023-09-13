import 'package:calculater/models/model_names.dart';
import 'package:calculater/modules/x_o/o_o_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';

  var nam1Controller = TextEditingController();
  var nam2Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nam1Controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'must be fill it';
                    }
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'mohammed',
                    fillColor: Colors.greenAccent,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          32,
                        ),
                      ),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nam2Controller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'must be fill it';
                    }
                  },
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        XoScreen.routeName,
                        arguments:
                            ModelName(nam1Controller.text, nam2Controller.text),
                      );
                    }
                  },
                  child: Text('Let\'s go'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
