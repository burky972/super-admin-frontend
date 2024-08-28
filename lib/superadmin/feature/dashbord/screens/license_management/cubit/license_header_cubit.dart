import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class LicenseHeaderState extends Equatable {
  final List<Restaurant> filteredRestaurants;
  final Restaurant? selectedRestaurant;
  final String searchQuery;

  LicenseHeaderState({
    required this.filteredRestaurants,
    required this.selectedRestaurant,
    required this.searchQuery,
  });

  factory LicenseHeaderState.initialize() {
    return LicenseHeaderState(
      filteredRestaurants: [],
      selectedRestaurant: null,
      searchQuery: '',
    );
  }

  LicenseHeaderState copyWith({
    List<Restaurant>? filteredRestaurants,
    Restaurant? selectedRestaurant,
    String? searchQuery,
  }) {
    return LicenseHeaderState(
      filteredRestaurants: filteredRestaurants ?? this.filteredRestaurants,
      selectedRestaurant: selectedRestaurant ?? this.selectedRestaurant,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [filteredRestaurants, selectedRestaurant, searchQuery];
}

class LicenseHeaderCubit extends Cubit<LicenseHeaderState> {
  final List<Restaurant> restaurants;

  LicenseHeaderCubit(this.restaurants)
      : super(LicenseHeaderState(
            filteredRestaurants: restaurants,
            selectedRestaurant: restaurants.isNotEmpty ? restaurants[0] : null,
            searchQuery: ''));

  void filterRestaurants(String query) {
    final filtered = restaurants
        .where((restaurant) => restaurant.name.toLowerCase().contains(query))
        .toList();
    emit(state.copyWith(
      filteredRestaurants: filtered,
      selectedRestaurant: filtered.isNotEmpty ? filtered[0] : null,
      searchQuery: query,
    ));
  }

  void selectRestaurant(Restaurant? restaurant) {
    emit(state.copyWith(selectedRestaurant: restaurant));
  }
}
