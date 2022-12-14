import 'package:be_well/auth/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
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
              height: mediaHeight * 0.65,
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
                  height: mediaHeight * 0.47,
                  width: mediaWidth * 0.904,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //Welcome
            Positioned(
              top: mediaHeight * 0.57,
              child: Container(
                height: mediaHeight * 0.42,
                width: mediaWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(children: [
                  SizedBox(
                    height: mediaHeight * 0.03,
                  ),
                  Text(
                    "Welcome to BeWell",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.02,
                  ),
                  Text(
                    "We hope you find what you're looking for",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.08,
                  ),
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.67,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                        },
                        child: Text("LOGIN")),
                  ),
                  SizedBox(
                    height: mediaHeight * 0.02,
                  ),
                  SizedBox(
                    height: mediaHeight * 0.06,
                    width: mediaWidth * 0.67,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Color(0xff7FD958)),
                        onPressed: () {},
                        child: Text("SIGNUP")),
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
