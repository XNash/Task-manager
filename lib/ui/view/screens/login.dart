import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/user_model.dart';
import 'package:test0/data/temp/temp.dart';
import 'package:test0/ui/view/screens/connect_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  UserModel? user;

  Future<UserModel?> _setCurrentUser() async {
    var userData = await MongoDatabase.getUser(
        'email', emailController.text, 'passwd', passwdController.text);
    user = UserModel.fromJson(userData!);
    if (Temp.currentUser != null) {
      return user;
    }

    return user;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Stack(children: [
              Image.asset(
                "assets/images/bg1.jpg",
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Nasshu's Task Manager™",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 1,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Adresse e-mail",
                    border: UnderlineInputBorder(),
                  ),
                  maxLines: 1,
                  controller: emailController,
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Mot de passe", border: UnderlineInputBorder()),
                  maxLines: 1,
                  controller: passwdController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF28a745)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  var isSet = _setCurrentUser().then((user) {
                    if (user != null) {
                      var email = emailController.text;
                      var passwd = passwdController.text;
                      var data = [email, passwd];
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnectUser(data: data)));
                    }
                  });
                },
                child: const Text("Se connecter"),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
