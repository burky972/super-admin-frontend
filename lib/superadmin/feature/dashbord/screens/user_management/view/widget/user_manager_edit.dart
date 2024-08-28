import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_manager_edit_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_manager_edit_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';

class UserManagerEdit extends StatelessWidget {
  final UserModel user;
  final ValueChanged<UserModel> onSave;

  const UserManagerEdit({super.key, required this.user, required this.onSave});

  void _saveChanges(BuildContext context) {
    final updatedUser = context.read<UserManagerEditCubit>().getUpdatedUser();
    onSave(updatedUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserManagerEditCubit(user),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kullanıcı Güncelleme'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: BlocBuilder<UserManagerEditCubit, UserManagerEditState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextFormField(
                    initialValue: state.userName,
                    decoration: InputDecoration(labelText: 'Kullanıcı adı'),
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().updateUserName(value),
                  ),
                  TextFormField(
                    initialValue: state.email,
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().updateEmail(value),
                  ),
                  TextFormField(
                    initialValue: state.password,
                    decoration: InputDecoration(labelText: 'Şifre'),
                    obscureText: false,
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().updatePassword(value),
                  ),
                  TextFormField(
                    initialValue: state.restaurantAssignment,
                    decoration:
                        InputDecoration(labelText: 'Restoran Atama'),
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().updateRestaurantAssignment(value),
                  ),
                  TextFormField(
                    initialValue: state.role,
                    decoration: InputDecoration(labelText: 'Rol'),
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().updateRole(value),
                  ),
                  SwitchListTile(
                    title: Text('Aktif'),
                    value: state.isActive,
                    onChanged: (value) =>
                        context.read<UserManagerEditCubit>().toggleIsActive(value),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _saveChanges(context),
                    child: Text('Kaydet'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
