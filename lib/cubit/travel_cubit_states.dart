import 'package:equatable/equatable.dart';
import 'package:travel/models/data_models.dart';

abstract class TravelCubitStates extends Equatable {}

class InitialState extends TravelCubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeStates extends TravelCubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends TravelCubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends TravelCubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends TravelCubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}
