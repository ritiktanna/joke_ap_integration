import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:joke_app/common_file/api_calls.dart';
import 'package:joke_app/homepage/bloc/home_page_bloc.dart';
import 'package:joke_app/homepage/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc homePageBloc;

  @override
  void initState() {
    super.initState();
    homePageBloc = HomePageBloc(
      GetIt.instance.get<ApiCalls>(),
    );
    homePageBloc.add(const GetJokeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homePageBloc,
      child: const HomeScreen(),
    );
  }
}
