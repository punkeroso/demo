import 'dart:async';

import 'package:flutter/material.dart';

enum WalletTabState { Busy, DataRetrieved, NoData }

class WalletTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WalletTabState();
  }
}

class _WalletTabState extends State<WalletTab> {
  final StreamController<WalletTabState> stateController =
      StreamController<WalletTabState>();
  List<String> restList = [];

  @override
  void initState() {
    super.initState();
    getUserRests();
  }

  Future getUserRests() async {
    stateController.add(WalletTabState.Busy);

    restList.clear();
    restList.add('ciao');
    restList.add('ciao1');
    restList.add('ciao2');
    restList.add('ciao3');
    restList.add('ciao4');

    stateController.add(WalletTabState.DataRetrieved);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stateController.stream,
      builder: (builderContext, snapshot) {
        if (snapshot.hasError) {
          return RefreshIndicator(
              onRefresh: getUserRests,
              child: Center(child: Text(snapshot.error)));
        }
        if (!snapshot.hasData || snapshot.data == WalletTabState.Busy) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == WalletTabState.NoData) {
          return RefreshIndicator(
              onRefresh: getUserRests,
              child: Center(
                  child: Text(
                "Sembra che non ti sia stato caricato alcun resto; mostra il QR code al tuo ristorante preferito ed evita tutti quei noiosi scontrini!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              )));
        }

        return RefreshIndicator(
            onRefresh: getUserRests,
            child: GridView.builder(
              itemCount: restList.length,
              itemBuilder: (BuildContext context, int index) {
                String store = restList[index];
                String balance = restList[index];

                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(store, style: TextStyle(fontSize: 16.0)),
                        Expanded(
                          child: Center(
                            child: Text(
                              "€ " + balance.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30.0),
                            ),
                          ),
                        ),
                        Text('last update today',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 10.0))
                      ],
                    ),
                  ),
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ));
      },
    );
  }
}
