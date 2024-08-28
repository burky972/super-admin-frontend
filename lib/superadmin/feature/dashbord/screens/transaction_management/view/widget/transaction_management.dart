import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_management/cubit/transaction_management_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_management/cubit/transaction_management_state.dart';
import 'transaction_edit.dart';

class TransactionManagement extends StatelessWidget {
  const TransactionManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionManagementCubit(),
      child: BlocBuilder<TransactionManagementCubit, TransactionManagementState>(
        builder: (context, state) {
          final cubit = context.read<TransactionManagementCubit>();

          return Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSearchableDropdownRow(
                  context,
                  'Restoran Seçimi',
                  state.restaurantUsersMap.keys.toList(),
                  state.selectedRestaurant,
                  (value) => cubit.selectRestaurant(value),
                ),
                SizedBox(height: 20),
                _buildSearchableDropdownRow(
                  context,
                  'Kullanıcı Seçimi',
                  state.selectedRestaurant == null
                      ? []
                      : state.restaurantUsersMap[state.selectedRestaurant]!,
                  state.selectedUser,
                  (value) => cubit.selectUser(value),
                ),
                SizedBox(height: 20),
                _buildTransactionDropdownRow(
                  context,
                  'İşlem Seçimi',
                  state.selectedUser == null
                      ? []
                      : state.userTransactionsMap[state.selectedUser]!,
                  state.selectedFaultyTransaction,
                  (value) => cubit.selectFaultyTransaction(value),
                  (transaction) => cubit.deleteTransaction(transaction),
                  (transaction) async {
                    final newValue = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionEdit(
                          initialValue: transaction['transaction']!,
                        ),
                      ),
                    );

                    if (newValue != null) {
                      cubit.editTransaction(transaction, newValue);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchableDropdownRow(
      BuildContext context,
      String hint,
      List<String> list,
      String? selectedItem,
      ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: list,
            selectedItem: selectedItem,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: hint,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionDropdownRow(
      BuildContext context,
      String hint,
      List<Map<String, String>> list,
      Map<String, String>? selectedItem,
      ValueChanged<Map<String, String>?> onChanged,
      void Function(Map<String, String>) onDelete,
      void Function(Map<String, String>) onEdit) {
    return Row(
      children: [
        Expanded(
          child: DropdownSearch<Map<String, String>>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: list,
            itemAsString: (item) =>
                '${item['transaction']} - ID: ${item['id']} - Tarih: ${item['date']}',
            selectedItem: selectedItem,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: hint,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: selectedItem != null ? () => onEdit(selectedItem!) : null,
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: selectedItem != null ? () => onDelete(selectedItem!) : null,
        ),
      ],
    );
  }
}
