// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fleetime/models/Nasabah.dart';

import 'package:fleetime/services/api_services.dart';

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();

  final _iddebiturController = TextEditingController();
  final _namadebiturController = TextEditingController();
  final _alamatController = TextEditingController();
  final _notelpController = TextEditingController();
  final _noktpController = TextEditingController();
  final _noselularController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Nasabah'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                width: 440,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Nama Debitur'),
                          TextFormField(
                            controller: _namadebiturController,
                            decoration: InputDecoration(
                              hintText: 'Nama Debitur',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama Debitur tidak boleh kosong';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('Alamat'),
                          TextFormField(
                            controller: _alamatController,
                            decoration: InputDecoration(
                              hintText: 'Alamat',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Alamat tidak boleh kosong';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('No Ktp'),
                          TextFormField(
                            controller: _noktpController,
                            decoration: InputDecoration(
                              hintText: 'No Ktp',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'No Ktp tidak boleh kosong';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('No Telp'),
                          TextFormField(
                            controller: _notelpController,
                            decoration: InputDecoration(
                              hintText: 'No Telp',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'No Telp tidak boleh kosong';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          Text('No Selular'),
                          TextFormField(
                            controller: _noselularController,
                            decoration: InputDecoration(
                              hintText: 'No Selular',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'No Selular tidak boleh kosong';
                              }
                              return null;
                            },
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                            ),
                            child: Text('Tambah Data'),
                            onPressed: () {
                              if (_addFormKey.currentState!.validate()) {
                                _addFormKey.currentState?.save();
                                api.createNasabah(
                                  Nasabah(
                                    nama_debitur: _namadebiturController.text,
                                    alamat: _alamatController.text,
                                    no_telp: _notelpController.text,
                                    no_ktp: _noktpController.text,
                                    no_selular: _noselularController.text,
                                  ),
                                );
                              }
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
