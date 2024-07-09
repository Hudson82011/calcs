import 'package:calculator/Utils/Size.dart';
import 'package:calculator/services/HistoryService.dart';
import 'package:calculator/widgets/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  final ScreenSize _size = ScreenSize();



  bool remark=false;

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {

      if(result.recognizedWords.contains("=")){

        values= _countCtr.text;
        _stopListening();
        setState(() {

          try {
            Parser p = Parser();
            Expression exp = p.parse( _countCtr.text);
            ContextModel cm = ContextModel();
            double eval = exp.evaluate(EvaluationType.REAL, cm);

            values= _countCtr.text;
            if(eval % 1 != 0){
              _countCtr.text= eval.toString();
            }else{
              _countCtr.text= eval.toStringAsFixed(0);
            }



          } catch (e) {
            print(e);
          }





        });

      }else{
        _countCtr.text = result.recognizedWords;
      }



    });
  }





  TextEditingController _countCtr=TextEditingController();


  String values="";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
        builder: (BuildContext context) {
      return IconButton( onPressed: () => Scaffold.of(context).openDrawer(),icon: Image.asset("assets/icons/drawer.png"),);}
      )),
      drawer:  DrawerBody().drawer(context),
      body: Column(
        children: [
          SizedBox(
            height: _size.getHeight(context) * 0.2,
            width:  _size.getWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Text(values,style: Theme.of(context).textTheme.displaySmall,)

                  ],
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   IconButton(onPressed: (){

                     _startListening();
                     Future.delayed(Duration(seconds: 6)).then((value){
                       _stopListening();
                     });



                   }, icon: Image.asset("assets/icons/mic.png",scale: _size.getWidth(context)*0.05,),),
                  Expanded(child: TextFormField(
                    controller: _countCtr,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.end,
                  ))
                 ],
               )
              ],
            ),
          ),
          Expanded(child:
          Container(
            decoration: BoxDecoration(
              color:Theme.of(context).colorScheme.primaryContainer
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("C",Color.fromRGBO(147,179,237,1)),
                    _button("+/-",Color.fromRGBO(147,179,237,1)),
                    _button("%",Color.fromRGBO(147,179,237,1)),
                    _button("/",Color.fromRGBO(255,67,0,1))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("7",Theme.of(context).primaryColor),
                    _button("8",Theme.of(context).primaryColor),
                    _button("9",Theme.of(context).primaryColor),
                    _button("*",Color.fromRGBO(255,67,0,1))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("4",Theme.of(context).primaryColor),
                    _button("5",Theme.of(context).primaryColor),
                    _button("6",Theme.of(context).primaryColor),
                    _button("-",Color.fromRGBO(255,67,0,1))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("1",Theme.of(context).primaryColor),
                    _button("2",Theme.of(context).primaryColor),
                    _button("3",Theme.of(context).primaryColor),
                    _button("+",Color.fromRGBO(255,67,0,1))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _button("0",Theme.of(context).primaryColor),
                    _button(".",Theme.of(context).primaryColor),
                    _button("=",Color.fromRGBO(255,67,0,1))
                  ],
                )
              ],
            )))

        ],
      ),
    );
  }


  Widget _button(String text,Color colorBack){
    return SizedBox(
        height: _size.getHeight(context)*0.125,
        width: text=="0"?_size.getWidth(context)*0.48:_size.getWidth(context)*0.235,
        child:
        ElevatedButton(
          onPressed: () {


            if(remark){

              if(![".","+/-","%","+","/","-","*","="].contains(text)){

               setState(() {
                 _countCtr.clear();
                 values="";
               });
                remark=false;
              }else{
                remark=false;
              }



            }

           if(text=="="){
           setState(() {

             remark=true;
             try {
               Parser p = Parser();
               Expression exp = p.parse( _countCtr.text);
               ContextModel cm = ContextModel();
               double eval = exp.evaluate(EvaluationType.REAL, cm);



               values= _countCtr.text;
             if(eval % 1 != 0){
               _countCtr.text= eval.toString();
             }else{
               _countCtr.text= eval.toStringAsFixed(0);
             }
               HistoryService.saveOperation(values+"="+_countCtr.text);
             

             } catch (e) {
               print(e);
             }





           });
           }else if(text=="C"){
           setState(() {
             values="";
           });
             _countCtr.clear();
           }
           else{
             _countCtr.text=_countCtr.text+text;
           }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            //change background color of button
            backgroundColor: colorBack,
            //change text color of button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child:  Center(
              child: Text(text,style: Theme.of(context).textTheme.displayMedium,),
            ),
        ));
  }




}
