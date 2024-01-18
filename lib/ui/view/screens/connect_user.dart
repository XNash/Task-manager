import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/user_model.dart';
import 'package:test0/data/temp/temp.dart';
import 'package:test0/ui/view/screens/home.dart';

class ConnectUser extends StatefulWidget {
  final List data;

  const ConnectUser({super.key, required this.data});

  @override
  _ConnectUserState createState() =>
      _ConnectUserState(email: data[0], passwd: data[1]);
}

class _ConnectUserState extends State<ConnectUser> {
  final String email;
  final String passwd;
  UserModel? user;

  _ConnectUserState({required this.email, required this.passwd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262C34),
      body: SafeArea(
          child: Center(
        child: Card(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 4,
            child: FutureBuilder(
                future: MongoDatabase.getUser('email', email, 'passwd', passwd),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Text(
                              "Se connecter en tant que",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Spacer(),
                            Card(
                                color: const Color(0xFFC5DBE9),
                                elevation: 2,
                                child: ListTile(
                                  leading: const Icon(Icons.person),
                                  title: Text(
                                    snapshot.data['firstname'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(snapshot.data['phone']),
                                  trailing: Card(
                                    elevation: 2,
                                    color: const Color(0xFF28A745),
                                    child: GestureDetector(
                                      onTap: () {
                                        Temp.currentUser =
                                            UserModel.fromJson(snapshot.data);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Home(
                                                    UserModel.fromJson(
                                                        snapshot.data))));
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                10,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                15,
                                        child: const Center(
                                            child: Text(
                                          "Se connecter",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            const Spacer()
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                            "Aucun utilisateur ne correspond aux informations"),
                      );
                    }
                  }
                }),
          ),
        ),
      )),
    );
  }
}
