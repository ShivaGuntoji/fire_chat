import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/welcome_buttton.dart';
class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    controller.forward();
    controller.addStatusListener((status) {});
    controller.addListener(() {
      setState(() {});
    });
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                SizedBox(
                  width: 220,
                  child: TextLiquidFill(
                    boxBackgroundColor: Colors.white,
                    boxHeight: 100,
                    text: 'Flash Chat',
                    loadDuration: Duration(seconds: 5),
                    waveDuration: Duration(seconds: 10),
                    waveColor: animation.value,
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      //color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelComeButton( color: Colors.lightBlueAccent,
              label: 'Login',
              onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            WelComeButton(
                color: Colors.blueAccent,
                label: 'Register',
              onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWelcome extends StatelessWidget {
  ButtonWelcome({this.color, this.label, this.id});
  final Color color;
  final String label;
  final id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            Navigator.pushNamed(context, id);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
