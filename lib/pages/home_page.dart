import 'package:flutter/material.dart';
import 'package:todo/component/dialog_box.dart';
import 'package:todo/component/to_do_tile.dart';
import 'package:todo/model/to_do_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  late ToDoModel toDoModel;

  @override
  void initState() {
    super.initState();
    // Initialize ToDoModel and load data
    toDoModel = ToDoModel();
    toDoModel.loadData();

    // Create initial data if the list is empty
    if (toDoModel.toDoList.isEmpty) {
      toDoModel.createInitialData();
    }
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      toDoModel.toDoList.add([_controller.text, false]);
      toDoModel.updateData();  // Save the new task to Hive
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      toDoModel.toDoList.removeAt(index);  // Remove task by index
      toDoModel.updateData();  // Update the Hive box after deletion
    });
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          Controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  // Toggle checkbox state
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoModel.toDoList[index][1] = !toDoModel.toDoList[index][1];
      toDoModel.updateData();  // Update the Hive box with the new checkbox state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(child: Text('ToDo')),
      ),
      body: ListView.builder(
        itemCount: toDoModel.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            value: toDoModel.toDoList[index][1],
            taskName: toDoModel.toDoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
