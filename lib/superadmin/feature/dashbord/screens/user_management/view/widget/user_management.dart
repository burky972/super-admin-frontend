import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/view/widget/user_manager_edit.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';

class UserManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserManagementCubit(),
      child: BlocBuilder<UserManagementCubit, UserManagementState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.selectedUsers.isNotEmpty)
                Container(
                  color: secondaryColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Seçilen kullanıcı sayısı: ${state.selectedUsers.length}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: state.selectedUsers.isEmpty
                            ? null
                            : () {
                                context
                                    .read<UserManagementCubit>()
                                    .deleteSelectedUsers();
                              },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      elevation: 4.0,
                      child: ListTile(
                        leading: Checkbox(
                          value: state.selectedUsers.contains(index),
                          onChanged: (bool? value) {
                            if (value != null) {
                              context
                                  .read<UserManagementCubit>()
                                  .toggleSelection(index);
                            }
                          },
                        ),
                        title: Text(user.userName),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Text('Email: ${user.email}'),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                  'Restoran: ${user.restaurantAssignment}'),
                            ),
                            Expanded(
                              child: Text('Rol: ${user.role}'),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              user.isActive ? Icons.check_circle : Icons.cancel,
                              color: user.isActive ? Colors.green : Colors.red,
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserManagerEdit(
                                      user: user,
                                      onSave: (updatedUser) {
                                        context
                                            .read<UserManagementCubit>()
                                            .editUser(updatedUser, index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
