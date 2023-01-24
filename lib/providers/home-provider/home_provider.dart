import 'package:flutter/cupertino.dart';
import 'package:traceebee_admin_app/repo/beekeepers-repo/beekeepers_entity.dart';

enum MenuState { opened, closed }

class HomeProvider extends ChangeNotifier {
  MenuState menuState = MenuState.closed;

  setMenuState() {
    if (menuState == MenuState.closed) {
      menuState = MenuState.opened;
      notifyListeners();
    } else {
      menuState = MenuState.closed;
      notifyListeners();
    }
  }
  setMenuStatetoClosed() {
    menuState = MenuState.closed;
    notifyListeners();
  }

  List<BeeKeepersEnitity> beeKeepersList = [
    BeeKeepersEnitity(
      name: "1",
      numberOfHives: "04",
      date: "04/09/2022",
      size: "700(ml)",
      image: "assets/images/user1.png",
      graphImage: "assets/images/graph1.png",
    ),
    BeeKeepersEnitity(
      name: "2",
      numberOfHives: "04",
      date: "15/09/2022",
      size: "400(ml)",
      image: "assets/images/user2.png",
      graphImage: "assets/images/graph2.png",
    ),
    BeeKeepersEnitity(
      name: "3",
      numberOfHives: "04",
      date: "22/09/2022",
      size: "900(ml)",
      image: "assets/images/user3.png",
      graphImage: "assets/images/graph1.png",
    ),
    BeeKeepersEnitity(
      name: "4",
      numberOfHives: "04",
      date: "02/10/2022",
      size: "700(ml)",
      image: "assets/images/user4.png",
      graphImage: "assets/images/graph2.png",
    ),
  ];
}
