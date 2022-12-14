import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:masterui/screens/task_item.dart';

class CategoryTask extends StatelessWidget {
  final List<Map<String, dynamic>> category = [
    {
      'icon': Icon(
        Icons.notifications_active_outlined,
        color: Colors.blue,
        size: 40.0,
      ),
      'label': 'Notification',
      'totalTask': '23',
    },
    {
      'icon': Icon(
        Icons.email_outlined,
        size: 40.0,
        color: Colors.orange,
      ),
      'label': 'Work',
      'totalTask': '14',
    },
    {
      'icon': Icon(
        Icons.headset_outlined,
        color: Colors.deepOrange,
        size: 40.0,
      ),
      'label': 'Music',
      'totalTask': '6',
    },
    {
      'icon': Icon(
        Icons.flight_takeoff_outlined,
        color: Colors.green,
        size: 40.0,
      ),
      'label': 'Travel',
      'totalTask': '11',
    },
    {
      'icon': Icon(
        Icons.book_outlined,
        color: Colors.purple,
        size: 40.0,
      ),
      'label': 'Stydy',
      'totalTask': '2',
    },
    {
      'icon': Icon(
        Icons.home_outlined,
        color: Colors.brown,
        size: 40.0,
      ),
      'label': 'Home',
      'totalTask': '2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(87, 134, 255, 1),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TaskItem(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.99),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.sort,
                size: 50.0,
              ),
              onPressed: () {},
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Lists',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.1 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  children: category.map((catTask) {
                    return Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => TaskItem(),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              catTask['icon'],
                              Spacer(),
                              Text(
                                catTask['label'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${catTask['totalTask']} Tasks',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
