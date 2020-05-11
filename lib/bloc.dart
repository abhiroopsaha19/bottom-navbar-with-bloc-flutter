import 'package:bloc/bloc.dart';
import 'package:bottom_navbar_with_bloc_flutter/state.dart';

enum NavbarItems { home,visit,prescription,questionnaire }

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  @override
  NavbarState get initialState => Home();

  @override
  Stream<NavbarState> mapEventToState(
      NavbarState state, NavbarItems event) async* {
    switch (event) {
      case NavbarItems.visit:
        yield visit();
        break;
      case NavbarItems.prescription:
        yield prescription();
        break;
      case NavbarItems.questionnaire:
        yield questionnaire();
        break;
      default:
        yield Home();
        break;
    }
  }
}
