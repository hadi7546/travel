import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/travel_cubit_states.dart';
import 'package:travel/cubit/travel_cubits.dart';
import 'package:travel/pages/detail_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/nav/main_page.dart';

import '../pages/welcome_page.dart';

class TravelCubitLogics extends StatefulWidget {
  TravelCubitLogics({Key? key}) : super(key: key);

  @override
  State<TravelCubitLogics> createState() => _TravelCubitLogicsState();
}

class _TravelCubitLogicsState extends State<TravelCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TravelCubits, TravelCubitStates>(
          builder: (context, state) {
        if (state is WelcomeStates) {
          return const WelcomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        }

        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const MainPage();
        }

        return const Center(child: Text("Error"));
      }),
    );
  }
}
