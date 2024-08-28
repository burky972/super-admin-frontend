import 'package:bloc/bloc.dart';
import 'restaurant_header_state.dart';

class RestaurantManagementHeaderCubit extends Cubit<RestaurantManagementHeaderState> {
  RestaurantManagementHeaderCubit() : super(RestaurantManagementHeaderInitial());

  void searchRestaurant(String query) {
    emit(RestaurantSearchUpdated(query));
  }
}
