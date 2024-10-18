import 'package:hive/hive.dart';

class ToDoModel {
  List toDoList = [];
  late Box _myBox;

  // Constructor to load the data
  ToDoModel() {
    _myBox = Hive.box('myBox');
  }

  // Method to create initial data
  void createInitialData() {
    toDoList = [
      ['Make tutorial', false],
      ['Do exercise', false]
    ];
    _myBox.put('kk', toDoList);  // Save the initial data to Hive
  }

  // Method to load data from the box
  void loadData() {
    toDoList = _myBox.get('kk', defaultValue: []);
  }

  // Method to update the data in the box
  void updateData() {
    _myBox.put('kk', toDoList);
  }
}
