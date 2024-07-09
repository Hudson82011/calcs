import 'package:calculator/Utils/Size.dart';
import 'package:calculator/services/HistoryService.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final ScreenSize _size = ScreenSize();

  List<String> history = [];

  @override
  void initState() {
    HistoryService.getHistory().then((value) {
      setState(() {
        history.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Tem certeza que deseja limpar o historico?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Limpar'),
                            onPressed: () {
                              HistoryService.clearHistory().then((value){
                                Navigator.pop(context);
                              });

                            },
                          ),
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ).then((value){
                    setState(() {
                      history.clear();
                    });
                  });
                },
                icon: const Icon(Icons.delete_outline_rounded,color: Colors.white,))
          ],
          centerTitle: true,
          title: Text("Historico da calculadora",
              style: Theme.of(context).textTheme.displaySmall),
        ),
        body: SizedBox(
          width: _size.getWidth(context),
          height: _size.getHeight(context),
          child: ListView.builder(
              padding: EdgeInsets.only(top: _size.getHeight(context) * 0.03),
              itemCount: history.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _size.getWidth(context) * 0.05,
                      vertical: _size.getHeight(context) * 0.01),
                  child: calcHistoryTile(i),
                );
              }),
        ));
  }

  Widget calcHistoryTile(int index) {
    return Container(
      padding: EdgeInsets.all(_size.getHeight(context) * 0.02),
      decoration: BoxDecoration(
          color: Color.fromRGBO(44, 44, 44, 0.8),
          borderRadius: BorderRadius.circular(8)),
      height: _size.getHeight(context) * 0.08,
      child: Text(
        history[index],
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
