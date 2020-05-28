import 'package:flutter/material.dart';

class EditPrescrCard extends StatefulWidget {
  @override
  _EditPrescrCardState createState() => _EditPrescrCardState();
}

class _EditPrescrCardState extends State<EditPrescrCard> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      //margin: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Name of medicine"),
            subtitle: Text("Scheduled for: time\nHave you taken?"),
            leading: Icon(Icons.note,size: 30,),
            isThreeLine: true,
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xFF2B276D),
                  child: MaterialButton(
                    minWidth: 100,//MediaQuery.of(context).size.width,
                    height: 40,
                    padding: EdgeInsets.all(10),
                    onPressed: (){
                    },
                    child: Text("Change to Yes/No",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}