import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
              height: mediaHeight * 0.35,
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

            //Signup
            Positioned(
              top: mediaHeight * 0.26,
              child: Container(
                height: mediaHeight * 0.74,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: mediaHeight * 0.03,
                  ),
                  Text(
                    "Signup",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.01,
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        //color: Colors.red,
                        height: mediaHeight * 0.49,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom /
                                  1.4),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Name'),
                                      hintText: "Enter name"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //email
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Email'),
                                      hintText: "Enter email"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //username
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Username'),
                                      hintText: "Enter username"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //password
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('password'),
                                      hintText: "Enter password"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //confirmPassword
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Confirm password'),
                                      hintText: "Enter password again"),
                                ),
                                SizedBox(
                                  height: mediaHeight * 0.01,
                                ),
                                //date of birth
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text('Date of birth'),
                                      hintText: "Enter dob"),
                                ),
                                //Forgot your password
                              ],
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: mediaHeight * 0.02,
                  ),
                  //Next
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.67,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {},
                        child: Text("Next")),
                  ),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
