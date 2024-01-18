import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/data/model/user_model.dart';

class DisplayUsers extends StatefulWidget {
  const DisplayUsers({super.key});

  @override
  _DisplayUsersState createState() => _DisplayUsersState();
}

class _DisplayUsersState extends State<DisplayUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Text("Liste des utilisateurs"),
      FutureBuilder(
          future: MongoDatabase.getAllUsers(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                var usersCount = snapshot.data.length;
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return UserCard(UserModel.fromJson(snapshot.data[i]));
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text("Aucun utilisateur à afficher"),
                );
              }
            }
          })
    ])));
  }

  Widget UserCard(UserModel user) {
    return ListTile(
      leading: const Icon(Icons.person),
      title: Text("${user.lastname} ${user.firstname}"),
      subtitle: Text(user.email),
      trailing: const Icon(Icons.more_vert),
    );
  }
}
