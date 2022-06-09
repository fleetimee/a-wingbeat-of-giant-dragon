import 'package:fleetime/editdatawidget.dart';
import 'package:flutter/material.dart';
import 'package:fleetime/models/Nasabah.dart';
import 'package:fleetime/services/api_services.dart';

class DetailWidget extends StatefulWidget {
  final Nasabah nasabah;
  DetailWidget({Key? key, required this.nasabah}) : super(key: key);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Nasabah'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: 440,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Nama Nasabah',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(
                      widget.nasabah.nama_debitur,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Alamat',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(
                      widget.nasabah.alamat,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'No Telp',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(
                      widget.nasabah.no_telp,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'No Selular',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(
                      widget.nasabah.no_selular,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'No KTP',
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(
                      widget.nasabah.no_ktp,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        _navigateToEditNasabah(context);
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    ),
                    RaisedButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        _confirmDialog();
                      },
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _navigateToEditNasabah(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataWidget(widget.nasabah),
      ),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Warning'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Are you sure want to delete this data?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  api.deleteNasabah(widget.nasabah.id);
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
