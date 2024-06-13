import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/data/to_do_data.dart';
import 'package:to_do_app/to_do/to_do_bloc_bloc.dart';
import 'package:to_do_app/util/constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _discriptioncontroller = TextEditingController();
  ToDo todo = ToDo();
  //todobloc innitialize
  // late ToDoBlocBloc _todobloc;
  // @override
  // void initState() {
  //   _todobloc = BlocProvider.of<ToDoBlocBloc>(context);
  //   super.initState();
  // }

  addToDo(ToDo todo) {
    context.read<ToDoBlocBloc>().add(AddToDo(todo));
  }

  removeToDo(ToDo todo) {
    context.read<ToDoBlocBloc>().add(RemoveToDo(todo: todo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcbackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //show the todo adding form
          showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "Add To Do",
                  style: GoogleFonts.inter(
                      color: kcaleartBoxText,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title feild
                    TextField(
                      controller: _titlecontroller,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Title",
                        hintStyle: TextStyle(
                            color: kcaleartBoxText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kcaleartBoxText),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //discription feild
                    TextField(
                      controller: _discriptioncontroller,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Discription",
                        hintStyle: TextStyle(
                            color: kcaleartBoxText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: kcaleartBoxText),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        //trigger the todo adding event
                        onPressed: () {
                          addToDo(ToDo(
                              title: _titlecontroller.text,
                              discription: _discriptioncontroller.text));
                          // _todobloc.add(AddToDo(todo.copyWith(
                          //     _titlecontroller.text,
                          //     _discriptioncontroller.text,
                          //     false)));
                          _titlecontroller.text = "";
                          _discriptioncontroller.text = "";
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: kcCardcolor),
                        )),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Icon(
                            Icons.check,
                            color: kcMainTextColor,
                            size: 28,
                          ),
                        ))
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: kcCardcolor,
        autofocus: true,
        elevation: 1,
        child: Icon(
          Icons.add,
          size: 30,
          color: kcMainTextColor,
        ),
      ),
      appBar: AppBar(
        elevation: 1,
        bottomOpacity: 20,
        shadowColor: kcshadowcolor,
        backgroundColor: kcCardcolor,
        title: Text(
          "To Do App",
          style: GoogleFonts.inter(
              color: kcMainTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          //catch the state and build the context
          child: BlocBuilder<ToDoBlocBloc, ToDoBlocState>(
            builder: (context, state) {
              if (state.status == ToDoStatus.SUCCSUSS) {
                return ListView.builder(
                  itemCount: state.todoList.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  // controller: FixedExtentScrollController(),
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kcCardcolor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(1, 1),
                                blurRadius: 1,
                                color: kcshadowcolor)
                          ]),
                      child: Slidable(
                        key: const ValueKey(0),
                        startActionPane:
                            ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              removeToDo(state.todoList[index]);
                              // _todobloc
                              //     .add(RemoveToDo(todo: state.todoList[index]));
                            },
                            backgroundColor: kcred,
                            foregroundColor: kcbackground,
                            icon: Icons.delete,
                            label: "Delete",
                          )
                        ]),
                        child: ListTile(
                          title: Text(
                            state.todoList[index].title,
                            style: GoogleFonts.inter(
                                color: kcMainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            state.todoList[index].discription,
                            style: GoogleFonts.inter(
                                color: kcMainTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: Checkbox(
                            value: state.todoList[index].isComplete,
                            onChanged: (value) {
                              // _todobloc.add(UpdateToDo(index: index));
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state.status == ToDoStatus.INITIAL) {
                return const Center(child: Text("no data"));
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
