import 'package:flutter/material.dart';
import 'package:demo/Screen/home_screen.dart';

void main() {
  runApp(DashBoard());
}

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DashBoardBar());
  }
}

class DashBoardBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashBoardBarState();
}

class DashBoardBarState extends State<DashBoardBar> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), title: Text("Trang chủ")),
        BottomNavigationBarItem(
            icon: Icon(Icons.fact_check), title: Text("Sân đã đặt")),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), title: Text("Ví tiền")),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), title: Text("Thông báo")),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded), title: Text("Tài khoản"))
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
      selectedItemColor: Colors.green,
    );
  }

  void _onTap(int index) {
    switch (index) {
      case 0:
        _navigatorKey.currentState?.pushReplacementNamed("Trang chủ");
        break;
      case 1:
        _navigatorKey.currentState?.pushReplacementNamed("Sân đã đặt");
        break;
      case 2:
        _navigatorKey.currentState?.pushReplacementNamed("Ví tiền");
        break;
      case 3:
        _navigatorKey.currentState?.pushReplacementNamed("Thông báo");
        break;
      case 4:
        _navigatorKey.currentState?.pushReplacementNamed("Tài khoản");
        break;
    }
    setState(() {
      _currentTabIndex = index;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Sân đã đặt":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.blue,
                child: Center(
                    child:
                        Text("Sân đã đặt", style: TextStyle(fontSize: 30)))));
      case "Ví tiền":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.red,
                child: Center(
                    child: Text("Ví tiền", style: TextStyle(fontSize: 30)))));
      case "Thông báo":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.green,
                child: Center(
                    child: Text("Thông báo", style: TextStyle(fontSize: 30)))));
      case "Tài khoản":
        return MaterialPageRoute(
            builder: (context) => Container(
                color: Colors.amberAccent,
                child: Center(
                    child: Text("Tài khoản", style: TextStyle(fontSize: 30)))));
      default:
        //mấy cái ở trên thay screen vô như cái này
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0x7d7d7d),
        bottomNavigationBar: bottomNavigationBar(),
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute));
  }
}
