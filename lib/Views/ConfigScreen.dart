import 'package:calculator/Utils/Size.dart';
import 'package:calculator/services/ConfigService.dart';
import 'package:calculator/services/HistoryService.dart';
import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {

  final ScreenSize _size=ScreenSize();

  List<String>history=[];


  @override
  void initState() {

    HistoryService.getHistory().then((value){
      setState(() {
        history.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text("Configurações",style:Theme.of(context).textTheme.displaySmall),centerTitle: true),
        body:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                SizedBox(
                  width: _size.getWidth(context)*0.5,
                  child:   Text("Dark Mode",style:TextStyle(color: Colors.white) ,),
                ),
                  Switch(value: false, onChanged: (a){

                  })
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: _size.getWidth(context)*0.085)),
                Text("Por padrão, o sistema utiliza a escolha do sistema.",style:TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 12) ,),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: _size.getHeight(context)*0.05)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: _size.getWidth(context)*0.5,
                  child:   Text("Historico de calculo",style:TextStyle(color: Colors.white) ,),
                ),
                Switch(value: false, onChanged: (a){

                })
              ],
            ),




          ],
        ),
      bottomNavigationBar: Container(
        height: _size.getHeight(context)*0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: Theme.of(context).primaryColor,
        ),

        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left:_size.getWidth(context)*0.05)),
            Text("Calcs ${ConfigServices.appVersion}",style: Theme.of(context).textTheme.displaySmall,)
          ],
        ),
      ),
    );
  }




}
