import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/home/repository/home_http_api_repository.dart';
import 'package:picscape/home/repository/home_repository.dart';
import 'package:picscape/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'configs/app_configs/app_strings.dart';
import 'configs/routes/route_names.dart';
import 'configs/routes/routes.dart';

// creating an instance of GetIt
// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // initializing all the view model created with Provider to used them across the app

        ChangeNotifierProvider(
            create: (_) => HomeProvider(homeRepository: getIt())),
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: ThemeData(
            scaffoldBackgroundColor: AppPellet.whiteBackground,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppPellet.whiteBackground),
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),
    );
  }
}
