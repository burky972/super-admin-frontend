import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/settings/cubit/settings_cubit.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';

class SettingsManagement extends StatelessWidget {
  final List<String> _restaurants = [
    'Restoran 12',
    'Restoran B',
    'Restoran C',
    'Restoran D',
    'Restoran E',
  ];

  final List<String> _languages = [
    'Türkçe',
    'İngilizce',
    'Almanca',
    'Fransızca'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dil Seçenekleri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: context.dynamicWidth(0.4),
                  child: BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, state) {
                      return DropdownSearch<String>(
                        items: _restaurants,
                        selectedItem: state.selectedRestaurant,
                        onChanged: (String? newValue) {
                          context.read<SettingsCubit>().changeRestaurant(newValue!);
                        },
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              labelText: "Ara",
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Restoran Seç",
                            contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.selectedLanguage,
                  onChanged: (String? newValue) {
                    context.read<SettingsCubit>().changeLanguage(newValue!);
                  },
                  items: _languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Tema Ayarları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Text('Açık Mod'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        return Switch(
                          value: state.isDarkMode,
                          onChanged: (bool value) {
                            context.read<SettingsCubit>().toggleDarkMode(value);
                          },
                        );
                      },
                    ),
                  ),
                  Text('Koyu Mod'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Güvenlik Ayarları',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                _buildSecurityOption(
                  context,
                  title: '2FA',
                  value: (state) => state.is2FAEnabled,
                  onChanged: (context, value) => context.read<SettingsCubit>().toggle2FA(value),
                ),
                _buildSecurityOption(
                  context,
                  title: 'SSL Sertifikası',
                  value: (state) => state.isSSLEnabled,
                  onChanged: (context, value) => context.read<SettingsCubit>().toggleSSLEnabled(value),
                ),
                _buildSecurityOption(
                  context,
                  title: 'Test Sertifikası',
                  value: (state) => state.isTestEnabled,
                  onChanged: (context, value) => context.read<SettingsCubit>().toggleTestEnabled(value),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<SettingsCubit>().saveSettings();
                  Navigator.pop(context);
                },
                child: Text('Kaydet'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption(BuildContext context,
      {required String title, required bool Function(SettingsState) value, required Function(BuildContext, bool) onChanged}) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Container(
          width: context.dynamicWidth(0.5),
          child: CheckboxListTile(
            title: Text(title),
            value: value(state),
            onChanged: (bool? newValue) {
              onChanged(context, newValue!);
            },
          ),
        );
      },
    );
  }
}
