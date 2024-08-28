import 'package:equatable/equatable.dart';

class TransactionManagementState extends Equatable {
  final String? selectedRestaurant;
  final String? selectedUser;
  final Map<String, String>? selectedFaultyTransaction;
  final Map<String, List<String>> restaurantUsersMap;
  final Map<String, List<Map<String, String>>> userTransactionsMap;

  const TransactionManagementState({
    this.selectedRestaurant,
    this.selectedUser,
    this.selectedFaultyTransaction,
    required this.restaurantUsersMap,
    required this.userTransactionsMap,
  });

  factory TransactionManagementState.initialize() {
    return TransactionManagementState(
      selectedRestaurant: null,
      selectedUser: null,
      selectedFaultyTransaction: null,
      restaurantUsersMap: {},
      userTransactionsMap: {},
    );
  }

  TransactionManagementState copyWith({
    String? selectedRestaurant,
    String? selectedUser,
    Map<String, String>? selectedFaultyTransaction,
    Map<String, List<String>>? restaurantUsersMap,
    Map<String, List<Map<String, String>>>? userTransactionsMap,
  }) {
    return TransactionManagementState(
      selectedRestaurant: selectedRestaurant ?? this.selectedRestaurant,
      selectedUser: selectedUser ?? this.selectedUser,
      selectedFaultyTransaction:
          selectedFaultyTransaction ?? this.selectedFaultyTransaction,
      restaurantUsersMap: restaurantUsersMap ?? this.restaurantUsersMap,
      userTransactionsMap: userTransactionsMap ?? this.userTransactionsMap,
    );
  }

  @override
  List<Object?> get props => [
        selectedRestaurant,
        selectedUser,
        selectedFaultyTransaction,
        restaurantUsersMap,
        userTransactionsMap
      ];
}
