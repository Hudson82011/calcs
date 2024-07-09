import 'package:flutter/material.dart';
import '../Utils/Size.dart';


class Modals{

  ScreenSize _size=ScreenSize();

  Widget msg(BuildContext context,String text){
    return Container(
      width: _size.getWidth(context)*0.75,
      height: _size.getHeight(context)*0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(  width: _size.getWidth(context)*0.75),
          Text(
              text,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )
          ),
          Padding(padding: EdgeInsets.only(top: _size.getHeight(context)*0.075)),
          ElevatedButton(onPressed: (){Navigator.pop(context);},style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff7e0000)
          ), child:Container(
            height: _size.getHeight(context)*0.08,
            width: _size.getWidth(context)*0.125,
            child: Center(
              child: Text("Continuar",style: TextStyle(
                color: Colors.white,fontSize: 26
              ),),
            ),
          ) )
        ],
      )
    );

  }



  Widget confirmCancel(BuildContext context,String text,Function confirm,Function cancel){
    return Container(
        width: _size.getWidth(context)*0.75,
        height: _size.getHeight(context)*0.25,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(  width: _size.getWidth(context)*0.75),
            Container(
              width:  _size.getWidth(context)*0.75,
              height: _size.getHeight(context)*0.1,
              child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: _size.getHeight(context)*0.055)),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               ElevatedButton(onPressed:
                   () {
                 cancel();
               },
                   style: ElevatedButton.styleFrom(
                       backgroundColor: Color(0xffc8c3c3)
                   ), child:Container(
                     height: _size.getHeight(context)*0.08,
                     width: _size.getWidth(context)*0.125,
                     child: Center(
                       child: Text("Cancelar",style: TextStyle(
                           color: Colors.white,fontSize: 26
                       ),),
                     ),
                   ) ),
               ElevatedButton(onPressed: (){confirm();},style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xff7e0000)
               ), child:Container(
                 height: _size.getHeight(context)*0.08,
                 width: _size.getWidth(context)*0.125,
                 child: Center(
                   child: Text("Confirmar",style: TextStyle(
                       color: Colors.white,fontSize: 26
                   ),),
                 ),
               ) )
             ],
           )
          ],
        )
    );

  }

 static TextEditingController cpfCtr=TextEditingController();
  static TextEditingController nameCtr=TextEditingController();
  static TextEditingController emailCtr=TextEditingController();




  Widget _textField(BuildContext context,TextEditingController _ctr,String text,TextInputType type){
    return  TextFormField(
        controller: _ctr,
        keyboardType: type,
        decoration:InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10),
            fillColor:  Color(0xfff7f5f5),
            border:InputBorder.none,
            filled: true,

            labelText: text,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,
              //color: Color.fromRGBO(233, 233, 255, 1)
            )));

  }






}