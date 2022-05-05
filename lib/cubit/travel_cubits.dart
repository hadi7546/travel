import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel/models/data_models.dart';
import 'package:travel/services/data_services.dart';
import 'travel_cubit_states.dart';

class TravelCubits extends Cubit<TravelCubitStates> {
  TravelCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeStates());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
