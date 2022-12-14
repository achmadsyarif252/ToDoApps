import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:masterui/dummy_data.dart';
import 'package:masterui/screens/new_task_screen.dart';

class TaskItem extends StatefulWidget {
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  void _refreshData() {
    setState(() {});
  }

  @override
  bool _checked = false;

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
                builder: (ctx) => AddTaskScreen(
                  _refreshData,
                ),
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
      backgroundColor: Color.fromRGBO(87, 134, 255, 1),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 30.0,
                ),
                onPressed: () {}),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
          ),
          child: IconButton(
            splashColor: Color.fromRGBO(87, 134, 255, 1),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50.0, top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.blue,
                    size: 30.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '23 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 0.0, bottom: 100.0),
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                        },
                        child: ListView.builder(
                          itemBuilder: (ctx, index) {
                            if (index == 0) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 30.0),
                                child: Text(
                                  'You Must ToDo',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.0,
                                  ),
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    _checked = !_checked;
                                  });
                                },
                                title: Text(
                                  DATA_AWAL[index].title,
                                ),
                                // subtitle: Text(
                                //   DATA_AWAL[index].subTitle,
                                // ),
                                trailing: CircularCheckBox(
                                  key: ValueKey(index),
                                  value: _checked,
                                  onChanged: (bool newVal) {
                                    setState(() {
                                      _checked = !_checked;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          itemCount: DATA_AWAL.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
