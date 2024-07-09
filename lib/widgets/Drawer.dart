

import 'package:calculator/Views/ConfigScreen.dart';
import 'package:calculator/Views/HistoryScreen.dart';
import 'package:flutter/material.dart';

class DrawerBody{



  drawer(BuildContext context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Calcs',
              style: Theme.of(context).textTheme.displayLarge
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {

            },
          ),
    ListTile(
    leading: Icon(Icons.contacts),
    title: Text('Historico'),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const HistoryScreen()));

    },
    ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfigScreen()));

            },
          ),

        ],
      ),
    );


  }




}


