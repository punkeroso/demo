import 'package:flutter/material.dart';
import 'package:demo/user_detail.dart';
import 'package:demo/bottombar.dart';
import 'package:demo/wallet_tab.dart';

class HomePage extends StatefulWidget {

  HomePage(
      {Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _actualTab;

  @override
  void initState() {
    super.initState();
    setState(() {
      _actualTab = 0;
    });
  }

  void _selectedTab(int index) {
    setState(() {
      _actualTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('DemoApp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: "Account settings",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail('test')));
              },
            )
          ],
        ),
        body: WalletTab(),
        bottomNavigationBar: FABBottomAppBar(
          color: Theme.of(context).primaryColorLight,
          onTabSelected: _selectedTab,
          selectedColor: Theme.of(context).primaryColor,
          notchedShape: CircularNotchedRectangle(),
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Wallet'),
            FABBottomAppBarItem(iconData: Icons.location_on, text: 'Store')
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Show qr-code',
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomPadding: false);
  }
}
