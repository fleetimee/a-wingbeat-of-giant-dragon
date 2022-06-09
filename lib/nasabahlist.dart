import 'package:fleetime/nasabahdetail.dart';
import 'package:flutter/material.dart';

import './models/Nasabah.dart';

class NasabahList extends StatelessWidget {
  final List<Nasabah> nasabah;
  NasabahList({Key? key, required this.nasabah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: nasabah == null ? 0 : nasabah.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailWidget(nasabah: nasabah[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(nasabah[index].nama_debitur),
              subtitle: Text(nasabah[index].alamat),
            ),
          ));
        });
  }
}
