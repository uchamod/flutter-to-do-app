
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:to_do_app/data/to_do_data.dart';

part 'to_do_bloc_event.dart';
part 'to_do_bloc_state.dart';

class ToDoBlocBloc extends HydratedBloc<ToDoBlocEvent, ToDoBlocState> {
  ToDoBlocBloc() : super(const ToDoBlocState()) {
    on<ToDoBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  
  @override
  ToDoBlocState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson(ToDoBlocState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
