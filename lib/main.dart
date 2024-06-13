import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/pages/homepage.dart';
import 'package:to_do_app/to_do/to_do_bloc_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //bind from hydratedbloc(hive local storage)
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "to do app",
      //call start event
      home: BlocProvider<ToDoBlocBloc>(
        create: (context) => ToDoBlocBloc()
          ..add(
            TodoStarted(),
          
          ),
          child: const Homepage(),
      ),
    );
  }
}
