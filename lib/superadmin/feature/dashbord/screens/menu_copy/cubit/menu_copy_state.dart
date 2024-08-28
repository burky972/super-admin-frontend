import 'package:equatable/equatable.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/model/menu_model.dart';

class MenuCopyState extends Equatable {
  final MenuModel? selectedSourceMenu;
  final MenuModel? selectedDestinationMenu;

  MenuCopyState({
    this.selectedSourceMenu,
    this.selectedDestinationMenu,
  });

  factory MenuCopyState.initialize() {
    return MenuCopyState(
      selectedSourceMenu: null,
      selectedDestinationMenu: null,
    );
  }
  MenuCopyState copyWith({
    MenuModel? selectedSourceMenu,
    MenuModel? selectedDestinationMenu,
  }) {
    return MenuCopyState(
      selectedSourceMenu: selectedSourceMenu ?? this.selectedSourceMenu,
      selectedDestinationMenu:
          selectedDestinationMenu ?? this.selectedDestinationMenu,
    );
  }

  @override
  List<Object?> get props => [selectedSourceMenu, selectedDestinationMenu];
}
