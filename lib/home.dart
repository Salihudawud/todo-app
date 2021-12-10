import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ourtodo1/create_todo.dart';
import 'package:ourtodo1/sharetodotile/todo_tile_widget.dart';
import 'package:ourtodo1/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skeleton_text/skeleton_text.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, dynamic>> completed = [];
  List<Map<String, dynamic>> uncompleted = [];
  List<Map<String, dynamic>> data = [
    {
      'title': 'Trip to space',
      'description':
          'This trip will last a week, and I intend going with you guys',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'Trip to Dubai',
      'description':
          'This trip will last a month, and I intend going with you the holigans',
      'date_time': '24/12/2021',
      'status': false,
    },
    {
      'title': 'buy a car',
      'description': 'After the trip I intend to buy a car for the wedding',
      'date_time': '01/01/2022',
      'status': false,
    },
    {
      'title': 'Lunch Kenkey',
      'description': 'I want to eat Kenkey as lunch today at Ivalley Ghana',
      'date_time': 'Today',
      'status': true,
    },
  ];
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (element['status']) {
        completed.add(element);
      } else {
        uncompleted.add(element);
      }
      Timer(const Duration(seconds: 10), () => callback());
    }

    String isloaded = 'Todo';

    int count = 0;
    bool is_complete = false;

    void callback() {
      setState(() {
        count = count + 1;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: customColor(date: 'appbarcolor'),
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/child.jpg'),
                radius: 25,
                backgroundColor: Colors.amber,
              ),
            ),
            title: const Text('My Task'),
            actions: const [
              Icon(Icons.menu),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.search),
              )
            ],
          ),
          body: ListView.separated(
              itemBuilder: (context, index) {
                return count == 0
                    ? SkeletonAnimation(
                        shimmerColor: customColor(date: 'appbarcolor'),
                        borderRadius: BorderRadius.circular(20),
                        shimmerDuration: 1000,
                        child: todotilewidget(
                            title: '',
                            description: '',
                            dateTime: '',
                            status: false),
                      )
                    : todotilewidget(
                        title: isloaded == 'Todo'
                            ? uncompleted[index]['title']
                            : completed[index]['title'],
                        description: isloaded == 'Todo'
                            ? uncompleted[index]['description']
                            : completed[index]['description'],
                        dateTime: isloaded == 'Todo'
                            ? uncompleted[index]['date_time']
                            : completed[index]['date_time'],
                        status: isloaded == 'Todo'
                            ? uncompleted[index]['status']
                            : completed[index]['status'],
                      );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 5,
                );
              },
              itemCount: completed.length),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Create_Todo();
              }));
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 60,
              decoration: const BoxDecoration(color: Colors.blue),
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                    child:
                        Icon(Icons.check_circle_outline, color: Colors.yellow),
                  ),
                  const Text(
                    'complete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '2$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
    }
  }

  value(String fname, String sname) {
    return Card(
      child: Row(),
    );
  }
}
