import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_do_app/data/to_do_data.dart';

part 'to_do_bloc_event.dart';
part 'to_do_bloc_state.dart';

//to do bloc
//check events and impose busniss logic and emit state
class ToDoBlocBloc extends HydratedBloc<ToDoBlocEvent, ToDoBlocState> {
  ToDoBlocBloc() : super(ToDoBlocState()) {
    // on<ToDoBlocEvent>((event, emit) {
    //   if (event is TodoStarted) {
    //     _onToDoStarted;
    //   } else if (event is AddToDo) {
    //     _onAddToDo(emit, event.todo);
    //   } else if (event is RemoveToDo) {
    //     _onRemoveToDo(emit, event.todo);
    //   } else if (event is UpdateToDo) {
    //     _onUpdateToDo(emit, event.index);
    //   }
    // });
    on<TodoStarted>(_onToDoStarted);
    on<AddToDo>(_onAddToDo);
    on<RemoveToDo>(_onRemoveToDo);
    on<UpdateToDo>(_onUpdateToDo);
  }
  //when start the app
  void _onToDoStarted(TodoStarted event, Emitter<ToDoBlocState> emit) {
    if (state.status == ToDoStatus.SUCCSUSS) return;

    emit(state.copyWith(status: ToDoStatus.SUCCSUSS, todoList: state.todoList));
  }

  //when add a todo
  //alternatively this can be done by using temp list
  void _onAddToDo(AddToDo event, Emitter<ToDoBlocState> emit) {
    emit(state.copyWith(status: ToDoStatus.LOARDING));

    try {
      List<ToDo> temp = [];
      temp.addAll(state.todoList);
      temp.insert(0, event.todo);
      emit(state.copyWith(todoList: temp, status: ToDoStatus.SUCCSUSS));
    } catch (err) {
      emit(state.copyWith(status: ToDoStatus.ERROR));
    }
  }

  //when remove a todo
  void _onRemoveToDo(RemoveToDo event, Emitter<ToDoBlocState> emit) {
    emit(state.copyWith(status: ToDoStatus.LOARDING));

    try {
      state.todoList.remove(event.todo);
      emit(state.copyWith(
          todoList: state.todoList, status: ToDoStatus.SUCCSUSS));
    } catch (err) {
      emit(state.copyWith(status: ToDoStatus.ERROR));
    }
  }

  //when update todos
  //clic the check box
  void _onUpdateToDo(UpdateToDo event, Emitter<ToDoBlocState> emit) {
    emit(state.copyWith(status: ToDoStatus.LOARDING));

    try {
      state.todoList[event.index].isComplete =!state.todoList[event.index].isComplete;
      emit(state.copyWith(
          todoList: state.todoList, status: ToDoStatus.SUCCSUSS));
    } catch (err) {
      emit(state.copyWith(status: ToDoStatus.ERROR));
    }
  }

  //set as json
  @override
  ToDoBlocState? fromJson(Map<String, dynamic> json) {
    return ToDoBlocState.fromJson(json);
  }

  //fro setas json
  @override
  Map<String, dynamic>? toJson(ToDoBlocState state) {
    return state.toJson();
  }
}
