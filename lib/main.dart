import 'package:fleetime/adddatawidget.dart';
import 'package:flutter/material.dart';

import 'package:fleetime/models/Nasabah.dart';
import 'package:fleetime/services/api_services.dart';
import 'package:fleetime/nasabahlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/home': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/adddatawidget': (context) => AddDataWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  List<Nasabah> nasabahList = [];

  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment, unnecessary_null_comparison
    if (nasabahList == null) {
      // ignore: deprecated_member_use, prefer_collection_literals
      nasabahList = <Nasabah>[];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: loadList(),
            builder: (context, snapshot) {
              return nasabahList.length > 0
                  ? NasabahList(nasabah: nasabahList)
                  : Text('No Data');
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Add Nasabah',
        child: Icon(Icons.add),
      ),
    );
  }

  Future loadList() {
    Future<List<Nasabah>> futureNasabah = api.getNasabah();
    futureNasabah.then((nasabahList) {
      setState(() {
        this.nasabahList = nasabahList;
      });
    });
    return futureNasabah;
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddDataWidget()));
  }
}
