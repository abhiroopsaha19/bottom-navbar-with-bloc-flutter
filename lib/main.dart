import 'package:bottom_navbar_with_bloc_flutter/bloc.dart';
import 'package:bottom_navbar_with_bloc_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavbarBloc _navbarBloc;

  @override
  void initState() {
    super.initState();
    _navbarBloc = NavbarBloc();
  }

  @override
  void dispose() {
    _navbarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is visit)
          return buildHomepage(state.title, Colors.white, state.itemIndex);
        if (state is prescription)
          return buildHomepage(state.title, Colors.white, state.itemIndex);
        if (state is questionnaire)
          return buildHomepage(state.title, Colors.white, state.itemIndex);
        if (state is Home)
          return buildHomepage(state.title, Colors.white, state.itemIndex);
      },
    );
  }

  Scaffold buildHomepage(String title, Color color, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:Color(0xFF2B276D),
      ),
      body: Container(
        color: color,
        child: Center(
          child: Text(title),
        ),
      ),


    bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
    canvasColor: Color(0xFF2B276D),
    primaryColor: Colors.white,
    textTheme: Theme.of(context).textTheme.copyWith(
    caption: TextStyle(color: Colors.grey)
    )
    ),
    child: BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: (index) {
    if (index == 0) _navbarBloc.dispatch(NavbarItems.home);
    if (index == 1) _navbarBloc.dispatch(NavbarItems.visit);
    if (index == 2) _navbarBloc.dispatch(NavbarItems.prescription);
    if (index == 3) _navbarBloc.dispatch(NavbarItems.questionnaire);
    },
    type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            title: Text("Visit"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text("Prescriptions"),
          ),
    BottomNavigationBarItem(
    icon: Icon(Icons.chat_bubble),
    title: Text("Questionnaire"),
          )
        ],
        fixedColor: Colors.blue,
      ),
    )
    );
  }
}
