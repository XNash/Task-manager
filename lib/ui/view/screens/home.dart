import 'package:flutter/material.dart';
import 'package:test0/data/model/user_model.dart';
import 'package:test0/data/temp/temp.dart';
import 'package:test0/ui/view/screens/pages/home_page.dart';
import 'package:test0/ui/view/screens/pages/tickets_page.dart';
import 'package:test0/ui/view/screens/pages/users_page.dart';

class Home extends StatefulWidget {
  Home(UserModel user, {super.key}) {
    _currentUser = user;
  }

  UserModel? _currentUser;

  @override
  _HomeState createState() => _HomeState(_currentUser);
}

class _HomeState extends State<Home> {
  int _pageId = 0;
  UserModel? currentUser;

  _HomeState(user) {
    currentUser = user;
    initState();
  }

  @override
  void initState() {
    super.initState();
  }

  void _setPageIndex(index) {
    setState(() {
      _pageId = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262C34),
      appBar: AppBar(
          leading: null,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nasshu's Project Manager",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              Card(
                color: const Color(0xFF090A13),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/profile.JPG",
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            Temp.currentUser!.firstname,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF8F8F8F),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(24),
        child: Align(child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            _setPageIndex(0);
                          },
                          icon: const Icon(Icons.home),
                          label: const Text("Accueil"),
                          style: const ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                  Size.fromWidth(200))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            _setPageIndex(1);
                          },
                          icon: const Icon(Icons.task),
                          label: const Text("Tickets"),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF090A13)),
                              fixedSize: MaterialStatePropertyAll(
                                  Size.fromWidth(200))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            _setPageIndex(2);
                          },
                          icon: const Icon(Icons.task),
                          label: const Text("Utilisateurs"),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xFF090A13)),
                              fixedSize: MaterialStatePropertyAll(
                                  Size.fromWidth(200))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const VerticalDivider(
                      color: Color(0xFF191D22),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: [
                        const HomePage(),
                        const TicketsPage(),
                        const UsersPage(),
                      ][_pageId],
                    )
                  ],
                );
              },
            );
          },
        )),
      ),
    );
  }
}
