import 'package:flutter/material.dart';
import './EditPrescriptionHistory.dart';
import './PrescrCard.dart';

class Prescription extends StatefulWidget {

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  TextEditingController editingController = TextEditingController();

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  var items = List<String>();

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

//DateTime _selectedDate=DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime _selectedDate = await showDatePicker( //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2021),
    );
    if (_selectedDate != null) //if the user has selected a date
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditPrescriptionHistory(_selectedDate)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(

        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
              accountName: new Text("Harish S P"),
              decoration: new BoxDecoration(
                  color: Color(0xFF2B276D)
              ),
              accountEmail: new Text("harish.s.pukale123@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
              ),

            ),

            new Divider(),
            new ListTile(
              title: new Text("Prescription History"),
              trailing: new Icon(Icons.note,size: 30,),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/prescription");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Visit History"),
              trailing: new Icon(Icons.place,size: 30,),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Questionaire History"),
              trailing: new Icon(Icons.question_answer,size: 30,),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.arrow_right,size: 30,),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: new Text("Prescription",style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.menu,size: 30,),
          color: Color(0xFF2B276D),
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        elevation: 1.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(Icons.account_box,size: 30,),
              color: Color(0xFF2B276D),
              iconSize: 40.0,
              onPressed: (){
                Navigator.of(context).pushNamed("/myaccount");
              },
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search,size: 30,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)))),
                ),
              ),
              IconButton(
                icon: Icon(Icons.history,size: 30,),
                onPressed: (){
                  _selectDate(context);
                },
              ),

            ],
          ),
          PrescrCard(),
          PrescrCard(),
          PrescrCard(),
          PrescrCard(),
        ],
      ),


      floatingActionButton: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFFBEBDD2),
        child: MaterialButton(
          minWidth: 328,//MediaQuery.of(context).size.width,
          height: 40,
          padding: EdgeInsets.all(10),
          onPressed: (){
          },
          child: Text("You have a pending Questionnaire",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Color(0xFF2B276D),
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}