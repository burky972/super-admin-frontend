import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_management/cubit/transaction_management_state.dart';

class TransactionManagementCubit extends Cubit<TransactionManagementState> {
  TransactionManagementCubit()
      : super(TransactionManagementState(
          restaurantUsersMap: {
            'Restoran A': ['Kullanıcı 1', 'Kullanıcı 2'],
            'Restoran B': ['Kullanıcı 3', 'Kullanıcı 7'],
            'Restoran C': ['Kullanıcı 4', 'Kullanıcı 5', 'Kullanıcı 6'],
          },
          userTransactionsMap: {
            'Kullanıcı 1': [
              {'id': '1', 'transaction': 'İşlem 1', 'date': '2024-08-01'},
              {'id': '2', 'transaction': 'İşlem 2', 'date': '2024-08-02'}
            ],
            'Kullanıcı 2': [
              {'id': '3', 'transaction': 'İşlem 3', 'date': '2024-08-03'},
              {'id': '9', 'transaction': 'İşlem 9', 'date': '2024-08-09'}
            ],
            'Kullanıcı 3': [
              {'id': '4', 'transaction': 'İşlem 4', 'date': '2024-08-04'},
              {'id': '10', 'transaction': 'İşlem 10', 'date': '2024-08-10'}
            ],
            'Kullanıcı 4': [
              {'id': '5', 'transaction': 'İşlem 5', 'date': '2024-08-05'},
              {'id': '7', 'transaction': 'İşlem 7', 'date': '2024-08-07'},
              {'id': '8', 'transaction': 'İşlem 8', 'date': '2024-08-08'}
            ],
            'Kullanıcı 5': [
              {'id': '6', 'transaction': 'İşlem 6', 'date': '2024-08-06'},
              {'id': '11', 'transaction': 'İşlem 11', 'date': '2024-08-11'}
            ],
            'Kullanıcı 6': [
              {'id': '12', 'transaction': 'İşlem 12', 'date': '2024-08-12'},
              {'id': '13', 'transaction': 'İşlem 13', 'date': '2024-08-13'}
            ],
            'Kullanıcı 7': [
              {'id': '14', 'transaction': 'İşlem 14', 'date': '2024-08-14'},
              {'id': '15', 'transaction': 'İşlem 15', 'date': '2024-08-15'}
            ],
          },
        ));

  void selectRestaurant(String? restaurant) {
    emit(state.copyWith(
      selectedRestaurant: restaurant,
      selectedUser: null,
      selectedFaultyTransaction: null,
    ));
  }

  void selectUser(String? user) {
    emit(state.copyWith(
      selectedUser: user,
      selectedFaultyTransaction: null,
    ));
  }

  void selectFaultyTransaction(Map<String, String>? transaction) {
    emit(state.copyWith(selectedFaultyTransaction: transaction));
  }

  void editTransaction(Map<String, String> transaction, String newValue) {
    final updatedTransactions = state.userTransactionsMap[state.selectedUser]!
        .map((item) => item == transaction
            ? {...transaction, 'transaction': newValue}
            : item)
        .toList();

    emit(state.copyWith(userTransactionsMap: {
      ...state.userTransactionsMap,
      state.selectedUser!: updatedTransactions
    }));
  }

  void deleteTransaction(Map<String, String> transaction) {
    final updatedTransactions = state.userTransactionsMap[state.selectedUser]!
        .where((item) => item != transaction)
        .toList();

    emit(state.copyWith(userTransactionsMap: {
      ...state.userTransactionsMap,
      state.selectedUser!: updatedTransactions
    }));
  }
}
