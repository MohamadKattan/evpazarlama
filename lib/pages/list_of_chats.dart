import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evpazarlama/custom-widgets/custom_drawer.dart';
import 'package:evpazarlama/helper/config.dart';
import 'package:evpazarlama/helper/custom_icon.dart';
import 'package:evpazarlama/helper/custom_text.dart';
import 'package:evpazarlama/pages/chat_owner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListOfChats extends StatefulWidget {
  const ListOfChats({super.key});

  @override
  State<ListOfChats> createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(242, 196, 233, 247),
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0.0,
          centerTitle: false,
          title: customText(text: AppLocalizations.of(context)!.myMessages),
        ),
        drawer: customDrawer(context),
        body: FutureBuilder<QuerySnapshot>(
          future: messagesCol.get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                  children: snapshot.data!.docs.map(
                (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: ListTile(
                      onTap: () {
                        navToChat(context, data);
                      },
                      leading: cutomImageIcon(
                          imagePath: 'user.png', height: 90.0, width: 30),
                      trailing: data["count"] == 1
                          ? Stack(
                              children: [
                                customIcon(
                                    iconData: Icons.notifications,
                                    size: 38,
                                    color: secondColor),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: secondColor,
                                    radius: 10,
                                    child: customText(
                                        text: data["count"].toString()),
                                  ),
                                ),
                              ],
                            )
                          : customIcon(
                              iconData: Icons.arrow_forward_ios,
                              color: mainColor,
                              size: 35.0),
                      title: customText(
                          text: data['name'],
                          textColor: mainColor,
                          textAlign: TextAlign.justify,
                          textFontSize: 24.0),
                      subtitle: customText(
                          text: data['lastMessage'],
                          textColor: Colors.black,
                          textAlign: TextAlign.justify),
                      shape: Border.all(color: mainColor, width: 1.0),
                    ),
                  );
                },
              ).toList());
            }

            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          },
        ),
      ),
    );
  }

  // this method for set count message to zero and nav to chatScrren
  Future<void> navToChat(
      BuildContext context, Map<String, dynamic> data) async {
    await messagesCol.doc(data["id"]).update({"count": 0}).whenComplete(() {
      setState(() {});
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return ChatOwner(
              reciverId: data['id'],
              adsNumber: data['adNo'],
              isCanPop: false,
              token: data['token'],
            );
          },
        ),
      );
    });
  }
}
