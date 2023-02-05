import 'package:digi_wallet_prototype/src/app.dart';
import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  //loading the env file for accesing the API keys
  await dotenv.load();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(DigiWalletApp(settingsController: settingsController));
}
