import 'package:get_it/get_it.dart';
import 'package:bahcem/services/provider/auth_provider.dart';
import 'package:bahcem/services/auth_service.dart'; // AuthService'ı ekleyin

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthProvider>(AuthProvider());
  locator.registerSingleton<AuthService>(AuthService()); // AuthService'ı kaydedin
}
