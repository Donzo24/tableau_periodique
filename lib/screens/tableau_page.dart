import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TableauPage extends StatefulWidget {
    const TableauPage({super.key});

    @override
    State<TableauPage> createState() => _TableauPageState();
}

class _TableauPageState extends State<TableauPage>
    with SingleTickerProviderStateMixin {
    late AnimationController _controller;

    List<dynamic> elements = [];

    @override
    void initState() {
      super.initState();
      _controller = AnimationController(vsync: this);

      redJsonFile();
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    Future<void> redJsonFile() async {
      dynamic data = await rootBundle.loadString("assets/data/element.json");
      data = jsonDecode(data);

      setState(() {
        elements = data;
      });

    }

    @override
    Widget build(BuildContext context) {

      
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
          child: OrientationBuilder(
            builder: (context, orientation) {
                
                return Column(
                  children: List.generate(8, (index) {

                    int y = index+1;
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: List.generate(18, (index) {

                          int x = index+1;

                          var element = elements.firstWhereOrNull((item) {
                            return item['x'] == x && item['y'] == y;
                          });

                          return Padding(
                            padding: EdgeInsets.all(2),
                            child: Container(
                              height: 35,
                              width: 35,
                              child: element != null ? Center(
                                child: Text(element['symbol']),
                              ):SizedBox(),
                              color: element == null ? Colors.white:Colors.green,
                            ),
                          );
                        }),
                      ),
                    );
                  }),
                );
            },
          ),
        ),
        )
      );
    }
}