import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    // Core services would be registered here
    // Example:
    // getIt.registerLazySingleton(() => HttpService());
    // getIt.registerLazySingleton(() => LocalStorageService());
    
    // Repositories would be registered here
    // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    
    // Use cases would be registered here
    // getIt.registerLazySingleton(() => LoginUseCase(getIt()));
    
    // ViewModels would be registered here
    // getIt.registerFactory(() => LoginViewModel(getIt()));
  }
}