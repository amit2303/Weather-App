import 'dart:io';

void main() {
  performTasks();
}

void performTasks() {
  task1();
  String inputTask3 = task2();
  task3(inputTask3);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

String task2() {
  
  String result = " 'takes 3 second to generate' ";
  Duration waitfortime = Duration(seconds: 2);

  //this is an asynchronous method
  Future.delayed(waitfortime,(){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
  
}

void task3(String input) {
  String result = 'task 3 data';
  print('Task 3 complete with $input');
}
