import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/user_model.dart';

class MongoDBInsertUser extends StatefulWidget {
  const MongoDBInsertUser({super.key});

  @override
  State<MongoDBInsertUser> createState() => _MongoDBInsertUserState();
}

class _MongoDBInsertUserState extends State<MongoDBInsertUser> {
  final firstnameCtrl = TextEditingController();
  final lastnameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Insertion de données",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Prénoms..."),
                controller: firstnameCtrl,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Nom..."),
                controller: lastnameCtrl,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: "N° de téléphone... (ex: 03X XX XXX XX)"),
                controller: phoneCtrl,
                maxLength: 10,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Adresse e-mail"),
                controller: emailCtrl,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Mot de passe",
                ),
                controller: passwdCtrl,
              ),
              Center(
                child: ElevatedButton(
                  child: const Text("inserer"),
                  onPressed: () {
                    _insert(firstnameCtrl.text, lastnameCtrl.text,
                        phoneCtrl.text, emailCtrl.text, passwdCtrl.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insert(String fName, String lName, String phone, String email,
      String passwd) async {
    var id = M.ObjectId();

    var data = UserModel(
        id: id,
        firstname: fName,
        lastname: lName,
        phone: phone,
        email: email,
        passwd: passwd);

    var result = await MongoDatabase.insertUser(data);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
  }
}
