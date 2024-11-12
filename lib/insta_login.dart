import 'package:flutter/material.dart';
import 'package:insta_login/insta_login.dart';
import 'package:insta_login/insta_view.dart';

class InstaLoginAPp extends StatefulWidget {


  @override
  State<InstaLoginAPp> createState() => _InstaLoginAPpState();
}

class _InstaLoginAPpState extends State<InstaLoginAPp> {
InstaLogin instaLogin=InstaLogin();
String token = '', userid = '', username = '';

Future<void> _loginWithInstagram() async {


  InstaView(
    instaAppId: '2261321010897395',
    instaAppSecret:'764348004fbda2b31a9d3a1815af7a32',
    redirectUrl: 'www.google.com/',
    onComplete: (_token, _userid, _username) {
      WidgetsBinding.instance.addPostFrameCallback(
              (timeStamp) {
            setState(() {
              token = _token;
              userid = _userid;
              username = _username;
            });
          });
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ElevatedButton(
                onPressed: (){
                  _loginWithInstagram();

                },
                child: Text("SignIn With Instagram"))
          ],
        ),
      ),
    );
  }
}
