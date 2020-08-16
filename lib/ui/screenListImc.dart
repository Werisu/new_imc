import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenListImc extends StatefulWidget {
  @override
  _ScreenListImcState createState() => _ScreenListImcState();
}

class _ScreenListImcState extends State<ScreenListImc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de IMC"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("imcs").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              return Text("Vazio");
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return LinearProgressIndicator();
                break;
              default:
                return Center(
                  child: ListView(
                    children: snapshot.data.documents
                        .map<Widget>((DocumentSnapshot doc) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(doc.data['nome']),
                        subtitle: doc.data['status'] == ""
                            ? Text("Não Informado")
                            : Text(doc.data['status']),
                        onTap: () {},
                      );
                    }).toList(),
                  ),
                );
            }
          }),
    );
  }
}
