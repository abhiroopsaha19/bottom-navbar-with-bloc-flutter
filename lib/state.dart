abstract class NavbarState {}

class Home extends NavbarState {
  final String title = "Home";
  final int itemIndex = 0;
}

class visit extends NavbarState {
  final String title = "Visits";
  final int itemIndex = 1;
}

class prescription extends NavbarState {
  final String title = "prescriptions";
  final int itemIndex = 2;
}
class  questionnaire extends NavbarState {
  final String title = "Questionnare";
  final int itemIndex = 3;
}
