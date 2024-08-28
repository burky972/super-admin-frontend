import 'package:equatable/equatable.dart';

abstract class RestaurantManagementHeaderState extends Equatable {
  const RestaurantManagementHeaderState();

  @override
  List<Object> get props => [];
}

class RestaurantManagementHeaderInitial extends RestaurantManagementHeaderState {}

class RestaurantSearchUpdated extends RestaurantManagementHeaderState {
  final String query;

  const RestaurantSearchUpdated(this.query);

  @override
  List<Object> get props => [query];
}
