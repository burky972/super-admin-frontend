import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/cubit/menu_copy_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/model/menu_model.dart';

class MenuCopyCubit extends Cubit<MenuCopyState> {
  MenuCopyCubit() : super(MenuCopyState.initialize());

  void selectSourceMenu(MenuModel? menu) {
    emit(state.copyWith(selectedSourceMenu: menu));
  }

  void selectDestinationMenu(MenuModel? menu) {
    emit(state.copyWith(selectedDestinationMenu: menu));
  }

  void copyMenu() {
    if (state.selectedSourceMenu != null &&
        state.selectedDestinationMenu != null) {
      final copiedCategories =
          List<MenuCategory>.from(state.selectedSourceMenu!.categories);
      emit(state.copyWith(
          selectedDestinationMenu: state.selectedDestinationMenu!
              .copyWith(categories: copiedCategories)));
    }
  }
}
