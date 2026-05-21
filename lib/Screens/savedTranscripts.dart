import 'package:flutter/material.dart';
import 'package:mesmat_yetesanachew_application/blocs/DataModel.dart';
import 'package:mesmat_yetesanachew_application/blocs/transcriptionDetail.dart';
import 'package:mesmat_yetesanachew_application/Components/color.dart';


class SavedTranscription extends StatefulWidget {
  const SavedTranscription({Key? key}) : super(key: key);

  @override
  _SavedTranscriptionState createState() => _SavedTranscriptionState();
}

class _SavedTranscriptionState extends State<SavedTranscription> {

  static List<String> name =['audio1', 'audio2'];


  final List<DataModel> data = List.generate(
      name.length,
          (index)
      => DataModel('${name[index]}','${name[index]} Description...'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: bgColor,
          elevation: 0.0,
          title: const Text(
            "Hearing aid",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(data[index].name),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>transcriptionDetail(dataModel: data[index],)));
                  },
                ),
              );
            }
        )
    );
  }
}