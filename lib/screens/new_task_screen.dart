import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masterui/dummy_data.dart';
import 'package:masterui/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function refresh;
  AddTaskScreen(
    this.refresh,
  );

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _subTitleController = TextEditingController();

  TextEditingController waktu = TextEditingController();

  @override
  void initState() {
    super.initState();
    waktu.text = DateFormat.yMMMEd().format(DateTime.now());
  }

  String get tipeTask {
    if (TypeTask.values == TypeTask.High) {
      return 'High';
    }

    return tipeTask;
  }

  DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.99),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'New task',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              size: 30.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What are you planning ?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.start,
                ),
                TextField(
                  controller: _titleController,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
                    hoverColor: Colors.grey,
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                  ),
                  maxLines: 6,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: waktu,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      if (value != null) {
                        waktu.text = DateFormat.yMMMEd().format(value);
                      }
                      return;
                    });
                    // if (pickedDate == null) {
                    //   setState(() {
                    //     waktu.text = DateTime.now().toString();
                    //   });
                    // } else {
                    //   setState(() {
                    //     waktu.text = DateTime.now().toString();
                    //   });
                    // }
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.notifications_active_outlined,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButtonFormField(
                  onChanged: null,
                  items: [
                    DropdownMenuItem(
                        child: Text(
                      tipeTask,
                    ))
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.label_outline,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              height: 50,
              minWidth: double.infinity,
              color: Color.fromRGBO(87, 134, 255, 1),
              onPressed: () {
                DATA_AWAL.add(
                  Task(
                    id: DateTime.now().toIso8601String(),
                    title: _titleController.text.toString(),
                    date: pickedDate,
                    status: 1,
                  ),
                );
                widget.refresh();
                Navigator.of(context).pop();
              },
              child: Text(
                'Create',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
