// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './models/Nasabah.dart';
import 'package:fleetime/services/api_services.dart';

class EditDataWidget extends StatefulWidget {
  final Nasabah nasabah;

  EditDataWidget(this.nasabah, {Key? key}) : super(key: key);

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();
  final ApiService api = ApiService();

  final _editFormKey = GlobalKey<FormState>();
  final _iddebiturController = TextEditingController();
  final _namadebiturController = TextEditingController();
  final _alamatController = TextEditingController();
  final _notelpController = TextEditingController();
  final _noktpController = TextEditingController();
  final _noselularController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namadebiturController.text = widget.nasabah.nama_debitur;
    _alamatController.text = widget.nasabah.alamat;
    _notelpController.text = widget.nasabah.no_telp;
    _noktpController.text = widget.nasabah.no_ktp;
    _noselularController.text = widget.nasabah.no_selular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Nasabah'),
      ),
      body: Form(
        key: _editFormKey,
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
                              primary: Colors.blue,
                            ),
                            child: Text('Tambah Data'),
                            onPressed: () {
                              if (_editFormKey.currentState!.validate()) {
                                _editFormKey.currentState?.save();

                                api.updateNasabah(
                                    widget.nasabah.id,
                                    Nasabah(
                                      nama_debitur: _namadebiturController.text,
                                      alamat: _alamatController.text,
                                      no_telp: _notelpController.text,
                                      no_ktp: _noktpController.text,
                                      no_selular: _noselularController.text,
                                    ));
                              }
                              Navigator.of(context).pushNamed('/');
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
