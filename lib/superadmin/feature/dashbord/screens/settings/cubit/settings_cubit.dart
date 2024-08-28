import 'package:bloc/bloc.dart';

class SettingsState {
  final String selectedLanguage;
  final bool isDarkMode;
  final bool is2FAEnabled;
  final bool isSSLEnabled;
  final bool isTestEnabled;
  final String selectedRestaurant;

  SettingsState({
    required this.selectedLanguage,
    required this.isDarkMode,
    required this.is2FAEnabled,
    required this.isSSLEnabled,
    required this.isTestEnabled,
    required this.selectedRestaurant,
  });

  SettingsState copyWith({
    String? selectedLanguage,
    bool? isDarkMode,
    bool? is2FAEnabled,
    bool? isSSLEnabled,
    bool? isTestEnabled,
    String? selectedRestaurant,
  }) {
    return SettingsState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      is2FAEnabled: is2FAEnabled ?? this.is2FAEnabled,
      isSSLEnabled: isSSLEnabled ?? this.isSSLEnabled,
      isTestEnabled: isTestEnabled ?? this.isTestEnabled,
      selectedRestaurant: selectedRestaurant ?? this.selectedRestaurant,
    );
  }
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          selectedLanguage: 'Türkçe',
          isDarkMode: true,
          is2FAEnabled: false,
          isSSLEnabled: false,
          isTestEnabled: false,
          selectedRestaurant: 'Restoran 12',
        ));

  void changeLanguage(String newLanguage) {
    emit(state.copyWith(selectedLanguage: newLanguage));
  }

  void toggleDarkMode(bool isDarkMode) {
    emit(state.copyWith(isDarkMode: isDarkMode));
  }

  void toggle2FA(bool is2FAEnabled) {
    emit(state.copyWith(is2FAEnabled: is2FAEnabled));
  }

  void toggleSSLEnabled(bool isSSLEnabled) {
    emit(state.copyWith(isSSLEnabled: isSSLEnabled));
  }

  void toggleTestEnabled(bool isTestEnabled) {
    emit(state.copyWith(isTestEnabled: isTestEnabled));
  }

  void changeRestaurant(String newRestaurant) {
    emit(state.copyWith(selectedRestaurant: newRestaurant));
  }

  void saveSettings() {
    // Call your save API here
  }
}
