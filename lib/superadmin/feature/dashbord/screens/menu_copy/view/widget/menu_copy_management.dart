import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/cubit/menu_copy_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/model/menu_model.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/cubit/menu_copy_cubit.dart';
import 'menu_card.dart';

class MenuCopyManagement extends StatelessWidget {
  final List<MenuModel> menus = [
    MenuModel(
      name: 'Restoran Menüsü 1',
      categories: [
        MenuCategory(
          name: 'Ana Yemekler',
          items: [
            MenuItem(
              name: 'Izgara Tavuk',
              price: 25.0,
              description: 'Lezzetli ızgara tavuk göğsü.',
            ),
            MenuItem(
              name: 'Köfte',
              price: 20.0,
              description: 'Ev yapımı köfte.',
            ),
          ],
        ),
        MenuCategory(
          name: 'Tatlılar',
          items: [
            MenuItem(
              name: 'Baklava',
              price: 15.0,
              description: 'Geleneksel Türk tatlısı.',
            ),
            MenuItem(
              name: 'Kazandibi',
              price: 12.0,
              description: 'Hafif ve lezzetli bir tatlı.',
            ),
          ],
        ),
      ],
    ),
    MenuModel(
      name: 'Menüsü 2',
      categories: [
        MenuCategory(
          name: 'Çorbalar',
          items: [
            MenuItem(
              name: 'Mercimek Çorbası',
              price: 10.0,
              description: 'Sıcak ve lezzetli mercimek çorbası.',
            ),
            MenuItem(
              name: 'Domates Çorbası',
              price: 8.0,
              description: 'Taze domateslerden yapılmış çorba.',
            ),
          ],
        ),
        MenuCategory(
          name: 'İçecekler',
          items: [
            MenuItem(
              name: 'Ayran',
              price: 5.0,
              description: 'Serinletici ayran.',
            ),
            MenuItem(
              name: 'Kola',
              price: 7.0,
              description: 'Soğuk kola.',
            ),
          ],
        ),
      ],
    ),
    MenuModel(
      name: 'Menüsü 3',
      categories: [
        MenuCategory(
          name: 'Çorbalar',
          items: [
            MenuItem(
              name: 'Mercimek Çorbası',
              price: 10.0,
              description: 'Sıcak ve lezzetli mercimek çorbası.',
            ),
            MenuItem(
              name: 'Domates Çorbası',
              price: 8.0,
              description: 'Taze domateslerden yapılmış çorba.',
            ),
          ],
        ),
        MenuCategory(
          name: 'İçecekler',
          items: [
            MenuItem(
              name: 'Ayran',
              price: 5.0,
              description: 'Serinletici ayran.',
            ),
            MenuItem(
              name: 'Kola',
              price: 7.0,
              description: 'Soğuk kola.',
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCopyCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<MenuCopyCubit, MenuCopyState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: MenuCard(
                            title: 'Kopyalanan Restoran Menüsü',
                            menu: state.selectedSourceMenu,
                            onMenuSelected: (menu) => context
                                .read<MenuCopyCubit>()
                                .selectSourceMenu(menu),
                            menus: menus,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: MenuCard(
                            title: 'Kopyalanacak Restoran Menüsü',
                            menu: state.selectedDestinationMenu,
                            onMenuSelected: (menu) => context
                                .read<MenuCopyCubit>()
                                .selectDestinationMenu(menu),
                            menus: menus,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<MenuCopyCubit>().copyMenu(),
                    child: Text('Menü Kopyala'),
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
