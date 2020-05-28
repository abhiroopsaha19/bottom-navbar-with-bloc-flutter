import 'package:flutter/material.dart';
import 'EditPrescrCard.dart';

class EditPrescriptionHistory extends StatefulWidget {
  final DateTime dateTime;
  EditPrescriptionHistory(this.dateTime);

  @override
  _EditPrescriptionHistoryState createState() =>
      _EditPrescriptionHistoryState();
}

enum ConfirmAction { CANCEL, ACCEPT }

class _EditPrescriptionHistoryState extends State<EditPrescriptionHistory> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Response?'),
          content: const Text('ARE YOU SURE YOU WANT TO CHANGE YOUR RESPONSE?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Coding Club"),
              decoration: new BoxDecoration(color: Color(0xFF2B276D)),
              accountEmail: new Text("abc@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Prescription History"),
              trailing: new Icon(
                Icons.note,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/prescription");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Visit History"),
              trailing: new Icon(
                Icons.place,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/vhistory");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Questionaire History"),
              trailing: new Icon(
                Icons.question_answer,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/questionnaire");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(
                Icons.arrow_right,
                size: 30,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text(
          "Prescription",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          color: Color(0xFF2B276D),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        elevation: 1.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.account_box,
                size: 30,
              ),
              color: Color(0xFF2B276D),
              iconSize: 40.0,
              onPressed: () {
                Navigator.of(context).pushNamed("/myaccount");
              },
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(3.0),
            title: Text(
              "DD-MM-YY",
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
            ),
          ),
          EditPrescrCard(),
          EditPrescrCard(),
          EditPrescrCard(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                  icon: Icon(Icons.home, color: Color(0xFF2B276D)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/home");
                  }),
              new IconButton(
                  icon: Icon(Icons.local_hospital, color: Color(0xFF2B276D)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/visit");
                  }),
              new IconButton(
                  icon: Icon(Icons.assignment, color: Color(0xFF2B276D)),
                  onPressed: null),
              new IconButton(
                  icon: Icon(Icons.question_answer, color: Color(0xFF2B276D)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/questionnaire");
                  })
            ],
          ),
        ),
      ),
    );
  }
}