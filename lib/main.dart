import 'package:calculator/Utils/Theme.dart';
import 'package:flutter/material.dart';

import 'Views/MainScreen.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> with WidgetsBindingObserver{

  @override
  void initState() {
   WidgetsBinding.instance.addObserver(this);
   ThemeApp.setTheme();

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePltaformBrightness(){
    ThemeApp.setTheme();
  }


  @override
  Widget build(BuildContext context) {
     return ValueListenableBuilder(
       valueListenable: ThemeApp.theme,
       builder: (BuildContext context,Brightness theme,_)=>
        MaterialApp(
        title: 'Calculadora retro',
       /* theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary:  const Color.fromRGBO(5, 12, 38, 1),
            background: const Color.fromRGBO(5, 12, 38, 1),
            brightness: theme

          ),
          useMaterial3: true,
        ),*/
          theme: ThemeApp().lightTheme,
          darkTheme:  ThemeApp().darkTheme,
        home:  const MainScreen(),
    ),
     );
  }
}

