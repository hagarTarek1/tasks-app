import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled37/classes/customTextformfield.dart';
import 'package:untitled37/cubit/TasksCubit.dart';
import 'package:untitled37/cubit/TasksState.dart';
import 'package:untitled37/homeScreen.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=TasksCubit.get(context);
    cubit.clearText();
    return BlocConsumer<TasksCubit,TasksState>(builder:(context,state){
      return Scaffold(
        backgroundColor: Colors.amber.shade50,
        appBar:
        AppBar(
          foregroundColor: Colors.amber.shade50,
          backgroundColor: Color.fromRGBO(52, 118, 79, 0.8),
          centerTitle: true,
          title: Text("Add Your Task",style: GoogleFonts
              .acme(textStyle:
          TextStyle(
            fontSize: 30,),),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 100,left: 25,right: 25),
          child: Center(
            child: ListView(children: [
              CustomText(hint: "Title", Controllerr:cubit.titleController ),
              SizedBox(height: 20,),
              CustomText(hint: "SubTitle", Controllerr: cubit.subTitleController),
              SizedBox(height: 20,),
              CustomText(hint: "Time", Controllerr:cubit.timeController),
              SizedBox(height: 50,),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade900 ),
                  onPressed: (){
               cubit.addTask();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  HomeScreen()));}, child: Text("Add task",style: GoogleFonts
                      .acme(textStyle:
                  TextStyle(
                    color: Colors.amber.shade50,
                    fontSize: 30,))))


            ],),
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
