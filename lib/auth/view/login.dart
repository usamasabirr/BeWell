import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: mediaHeight,
        width: mediaWidth,
        child: Stack(
          children: [
            //Icon
            Container(
              width: mediaWidth,
              height: mediaHeight * 0.45,
              decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.png'),
                ),
              ),
              child: FittedBox(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: mediaHeight * 0.32,
                  width: mediaWidth * 0.904,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //Login
            Positioned(
              top: mediaHeight * 0.36,
              child: Container(
                height: mediaHeight * 0.63,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(
                        height: mediaHeight * 0.03,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: mediaHeight * 0.04,
                      ),
                      Form(
                          key: _formKey,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                //username
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('username'),
                                      hintText: "Enter username"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.04,
                                ),
                                //password
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('password'),
                                      hintText: "Enter password"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.05,
                                ),
                                //Forgot your password
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                        fontSize: 15,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue),
                                  ),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.08,
                                ),
                                //Login button
                                SizedBox(
                                  height: mediaHeight * 0.06,
                                  width: mediaWidth * 0.67,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: Color(0xff7FD958)),
                                      onPressed: () {},
                                      child: Text("LOGIN")),
                                ),
                              ],
                            ),
                          )),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
