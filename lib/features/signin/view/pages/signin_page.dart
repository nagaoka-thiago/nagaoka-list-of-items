import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/signin_page_controller.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _controller = Modular.get<SigninPageController>();

  @override
  void initState() {
    super.initState();

    _controller.isSignedIn().then((isSigned) {
      if(isSigned) {
        Modular.to.navigate('/home', arguments: _controller.displayName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) => Scaffold(appBar: AppBar(title: const Text('Login')),
                    body: Container(alignment: Alignment.center, child: TextButton.icon(label: const Text('Login with Google Account'), icon: const ImageIcon(AssetImage('assets/google_icon.png'), color: Colors.red), onPressed: () async{
                      final signedin = await _controller.signin();

                      if(signedin) {
                        await _controller.isSignedIn();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged in!')));
                        Modular.to.navigate('/home', arguments: _controller.displayName);
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('It is not logged in!')));
                      }
                    },),),
                  ));
  }
}