import 'package:dmsn26/database/cast_db.dart';
import 'package:flutter/material.dart';

class ListCastScreen extends StatefulWidget {
  const ListCastScreen({super.key});

  @override
  State<ListCastScreen> createState() => _ListCastScreenState();
}

class _ListCastScreenState extends State<ListCastScreen> {
  CastDB? castDB; //posibilidades de ser nulo ?

  @override
  void initState() {
    super.initState();
    castDB = CastDB();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de actores'),
        actions: [
          IconButton(
            onPressed: ShowAlert, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: FutureBuilder(
        future: castDB!.SELECT(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Text('Si hubo datos');
          }else{
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
        },
      ),
    );
  }
  void ShowAlert(){
    var alertDialog = AlertDialog(
      title: Text('Agregar actor'),
    );

    showDialog(
      context: context, 
      builder: (context) => alertDialog,
    );
  }

}