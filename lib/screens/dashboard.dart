import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/models/read%20data/get_user_name.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_proj/screens/my_drawer_header.dart';
import 'package:flutter_proj/screens/settings.dart';
import 'package:flutter_proj/screens/signin_screen.dart';
//import 'package:flutter_proj/screens/signup_screen.dart';

import '../utils/color_utils.dart';
import 'Leaderboard.dart';
import 'dashboard.dart';
import 'Games.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final user = FirebaseAuth.instance.currentUser;

  List<String> docIDs = [];

  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  // void initState(){
  @override
  //final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  //final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300, // Adjust the height as needed
                    width: double.infinity,
                    child: Expanded(
                      child: FutureBuilder(
                        future: getDocID(),
                        builder: (context, snapshot) {
                          return ListView.builder(
                            itemCount: docIDs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: GetUserName(documentID: docIDs[index]),
                                  tileColor:
                                      const Color.fromARGB(255, 17, 51, 79),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}/* Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
              // ignore: prefer_interpolation_to_compose_strings
              ' ${user?.email ?? "Value is null"}',
              style: TextStyle(fontSize: 20),
            ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocID(),
                builder: (context,snapshot) {
                  return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(documentID: docIDs[index]),
                          tileColor: const Color.fromARGB(255, 17, 51, 79),
                        ),
                      );
                    },

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(5, 5))
                      ]),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Mr. Donald Trump',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.blue,
                                      tiles: [
                                        const ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Date of Birth"),
                                          subtitle: Text("17-06-2000"),
                                        ),
                                        const ListTile(
                                          leading:
                                              Icon(Icons.medical_information),
                                          title: Text("Medical Condition"),
                                          subtitle: Text("Cerebral Palsy"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle:
                                              Text("donaldtrump@gmail.com"),
                                        ),
                                        const ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("99--99876-56"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ]))
        ],
      ),
    ));
  }
}*/
