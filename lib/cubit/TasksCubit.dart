import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled37/cubit/TasksState.dart';
import 'package:flutter/material.dart';
import 'package:untitled37/taskModel.dart';

class TasksCubit extends Cubit<TasksState>{
  TasksCubit():super(InitState());

  static TasksCubit get(context)=> BlocProvider.of<TasksCubit>(context);
  TextEditingController titleController=TextEditingController();
  TextEditingController subTitleController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  List <TaskModel> tasks =[
    TaskModel("Breakfast", "You should drink your coffee", "7:30 AM"),
    TaskModel("work", "You should go to your work", "9:00 AM"),
    TaskModel("meeting", "You have meeting today", "12:00 PM"),
  ];
  TaskModel? taskModel;
  deleteTask (index){
    tasks.removeAt(index);
    emit(DeleteStateSuccess());
  }

  addTask (){
    tasks.add(TaskModel(titleController.text, subTitleController.text, timeController.text));
    emit(AddStateSuccess());
  }

  void clearText() {
   timeController.clear();
    titleController.clear();
    subTitleController.clear();
    emit(ClearStateSuccess());
  }

}
