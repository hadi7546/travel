import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/travel_cubit_logics.dart';
import 'package:travel/cubit/travel_cubits.dart';

import 'services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel',
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TravelCubits>(
        create: (context) => TravelCubits(
          data: DataServices(),
        ),
        child: TravelCubitLogics(),
      ),
    );
  }
}
