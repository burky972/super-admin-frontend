import 'package:equatable/equatable.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class RestaurantManagementState extends Equatable {
  final List<Restaurant> restaurants;
  final Set<int> selectedRestaurants;

  const RestaurantManagementState({
    this.restaurants = const [],
    this.selectedRestaurants = const {},
  });

  factory RestaurantManagementState.initialize() {
    return RestaurantManagementState(
      restaurants: [],
      selectedRestaurants: {},
    );
  }

  RestaurantManagementState copyWith({
    List<Restaurant>? restaurants,
    Set<int>? selectedRestaurants,
  }) {
    return RestaurantManagementState(
      restaurants: restaurants ?? this.restaurants,
      selectedRestaurants: selectedRestaurants ?? this.selectedRestaurants,
    );
  }

  @override
  List<Object?> get props => [restaurants, selectedRestaurants];
}