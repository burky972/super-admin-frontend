import 'package:equatable/equatable.dart';

abstract class UserManagementHeaderState extends Equatable {
  const UserManagementHeaderState();

  @override
  List<Object?> get props => [];
}

class UserManagementHeaderInitial extends UserManagementHeaderState {}

class UserManagementHeaderUpdated extends UserManagementHeaderState {
  final bool isUserAdded;

  const UserManagementHeaderUpdated({this.isUserAdded = false});

  @override
  List<Object?> get props => [isUserAdded];
}