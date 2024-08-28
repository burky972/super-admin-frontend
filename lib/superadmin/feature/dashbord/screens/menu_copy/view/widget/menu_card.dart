import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/model/menu_model.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final MenuModel? menu;
  final List<MenuModel> menus;
  final ValueChanged<MenuModel?> onMenuSelected;

  const MenuCard({
    Key? key,
    required this.title,
    required this.menu,
    required this.menus,
    required this.onMenuSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownSearch<MenuModel>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: 'Menü Seçin',
                  border: OutlineInputBorder(),
                ),
              ),
              items: menus,
              itemAsString: (MenuModel menu) => menu.name,
              onChanged: onMenuSelected,
              selectedItem: menu,
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchDelay: Duration(milliseconds: 0),
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    labelText: 'Ara',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            if (menu != null)
              Expanded(
                child: ListView.builder(
                  itemCount: menu!.categories.length,
                  itemBuilder: (context, index) {
                    final category = menu!.categories[index];
                    return ListTile(
                      title: Text(category.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: category.items.map((item) {
                          return Text('${item.name} - ${item.price} TL');
                        }).toList(),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
