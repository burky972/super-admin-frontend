import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_add_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_add_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';

class UserManagementAdd extends StatelessWidget {
  final Function(UserModel) onUserAdded;

  UserManagementAdd({required this.onUserAdded});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserManagementAddCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kullanıcı Ekle'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: [
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(labelText: 'Kullanıcı Adı'),
                      onChanged: (value) {
                        context.read<UserManagementAddCubit>().userNameChanged(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kullanıcı adı girin';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        context.read<UserManagementAddCubit>().emailChanged(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen email girin';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(labelText: 'Şifre'),
                      obscureText: true,
                      onChanged: (value) {
                        context.read<UserManagementAddCubit>().passwordChanged(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen şifre girin';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return TextFormField(
                      decoration: InputDecoration(labelText: 'Restoran Atama'),
                      onChanged: (value) {
                        context.read<UserManagementAddCubit>().restaurantAssignmentChanged(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen restoran atama yapın';
                        }
                        return null;
                      },
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return DropdownButtonFormField<String>(
                      value: state.role,
                      decoration: InputDecoration(labelText: 'Rol'),
                      items: ['Super Admin', 'Admin', 'User'].map((role) {
                        return DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        );
                      }).toList(),
                      onChanged: (value) {
                        context.read<UserManagementAddCubit>().roleChanged(value!);
                      },
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Text('Aktif'),
                        Switch(
                          value: state.isActive,
                          onChanged: (value) {
                            context.read<UserManagementAddCubit>().isActiveChanged(value);
                          },
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: context.dynamicHeight(0.03)),
                SizedBox(height: 20),
                BlocBuilder<UserManagementAddCubit, UserManagementAddState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.formValid
                          ? () {
                              context.read<UserManagementAddCubit>().submitForm(onUserAdded);
                              Navigator.pop(context);
                            }
                          : null,
                      child: Text('Kullanıcı Ekle'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
