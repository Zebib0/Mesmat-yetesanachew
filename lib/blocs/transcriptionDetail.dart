import 'package:flutter/material.dart';
import 'package:mesmat_yetesanachew_application/blocs/DataModel.dart';

class transcriptionDetail extends StatelessWidget {
  final DataModel dataModel;

  const transcriptionDetail({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dataModel.name),),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(dataModel.desc,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
        ],
      ),
    );
  }
}