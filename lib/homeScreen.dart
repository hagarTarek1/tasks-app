import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled37/components/taskContainer.dart';
import 'package:untitled37/cubit/TasksCubit.dart';
import 'package:untitled37/cubit/TasksState.dart';

import 'addScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
        appBar: AppBar(
          foregroundColor: Colors.amber.shade50,
          backgroundColor: Color.fromRGBO(52, 118, 79, 0.8),
          leading: Icon(Icons.line_weight_sharp),
          centerTitle: true,
          title: Text("Your Tasks",style: GoogleFonts
        .acme(textStyle:
    TextStyle(
    fontSize: 30,),),),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.orange[900],
          focusElevation: 10,
          backgroundColor: Color.fromRGBO(52, 118, 79, 0.8),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTask()));
          },child: Icon(Icons.add,size: 40,color: Colors.white,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),),
      body: BlocConsumer<TasksCubit,TasksState>(builder: (context,state){
        var cubit = TasksCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 600,
            width: 350,
            child: ListView.separated(itemBuilder: (context,index){
              return TaskContainer(taskModel: cubit.tasks[index], index: index,);
            },
                separatorBuilder: (context,index)=> SizedBox(height: 20,),
                itemCount: cubit.tasks.length),
          ),
        );
      },
      listener: (context,state){}
        ,)


    );
  }
}
