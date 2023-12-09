import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled37/cubit/TasksCubit.dart';
import 'package:untitled37/cubit/TasksState.dart';
import 'package:untitled37/taskModel.dart';

class TaskContainer extends StatelessWidget {
  final int index;
  TaskModel taskModel;
 TaskContainer({required this.taskModel,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit,TasksState>(builder:(context,state){
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 6,
        shadowColor: Colors.orange.shade900,
        child: Container(height: 150, width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.centerRight,
            colors: [
              Colors.amber.shade50,
               Colors.amber.shade50,
              Color.fromRGBO(52, 118, 79, 0.8),
              Color.fromRGBO(52, 118, 79, 0.8),
            ],
        ),),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.orange.shade900,
                    radius: 3,),
                  SizedBox(width: 5,),
                  Text(taskModel.title ?? "",style: GoogleFonts
                  .acme(textStyle:
                            TextStyle(
                              color: Colors.orange.shade900,
                              fontSize: 25,),),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.orange.shade900,
                    radius: 3,),
                  SizedBox(width: 5,),
                  Text(
                    taskModel.subTitle ?? "",style: GoogleFonts
                      .acme(textStyle:
                  TextStyle(
                    color:  Color.fromRGBO(52, 118, 79, 0.8),
                    fontSize: 15,),),),
                ],
              )
            ],),
            Spacer(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Time :",style: GoogleFonts
                //     .acme(textStyle:
                // TextStyle(
                //     fontSize: 20,color: Colors.orange.shade900),),),
                Text(taskModel.time ?? "",style: GoogleFonts
                    .acme(textStyle:
                TextStyle(
                  fontSize: 25,color: Colors.amber[50]),),),
                SizedBox(height: 30,),
                CircleAvatar(
                  backgroundColor: Colors.amber.shade50,
                    radius: 18,
                    child: IconButton(onPressed: (){
                      TasksCubit.get(context).deleteTask(index);
                    }, icon: Icon(Icons.delete_outline,color: Colors.orange.shade900,size: 20,)))
              ],
            )
            ],),
        ),
        ),
      );
    }, listener:(context,state){});
  }
}
