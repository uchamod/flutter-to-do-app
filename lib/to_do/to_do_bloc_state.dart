part of 'to_do_bloc_bloc.dart';

//todo status
enum ToDoStatus { INITIAL, LOARDING, SUCCSUSS, ERROR }

//state bloc
class ToDoBlocState extends Equatable {
  final List<ToDo> todoList;
  final ToDoStatus status;
  const ToDoBlocState(
      {this.status = ToDoStatus.INITIAL, this.todoList = const []});

  @override
  List<Object> get props => [];
  //copy the state
  ToDoBlocState copyWith({ToDoStatus? status, List<ToDo>? todoList}) {
    return ToDoBlocState(status: status!, todoList: todoList!);
  }

//to json
  Map<String, dynamic> toJson() {
    return {"todos": todoList, "status": status};
  }

  //fromJson
  factory ToDoBlocState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json["todos"] as List<dynamic>)
          .map((item) => ToDo.fromJson(item as Map<String, dynamic>))
          .toList();
      return ToDoBlocState(
          todoList: listOfTodos,
          status: ToDoStatus.values.firstWhere(
              (status) => status.name.toString() == json["status"]));
    } catch (err) {
      print(err.toString());
      return const ToDoBlocState();
    }
  }
}
