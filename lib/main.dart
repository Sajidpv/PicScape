import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:picscape/configs/app_themes/colors.dart';
import 'package:picscape/configs/components/notification_handler.dart';
import 'package:picscape/home/repository/home_http_api_repository.dart';
import 'package:picscape/home/repository/home_repository.dart';
import 'package:picscape/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';
import 'configs/routes/route_names.dart';
import 'configs/routes/routes.dart';

GetIt getIt = GetIt.instance;
NotificationService _notificationService = NotificationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _notificationService.initialize();
  getIt.registerLazySingleton<HomeRepository>(() => HomeHttpApiRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomeProvider(homeRepository: getIt())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PicScape',
        theme: ThemeData(
          scaffoldBackgroundColor: AppPellet.whiteBackground,
          appBarTheme:
              const AppBarTheme(backgroundColor: AppPellet.whiteBackground),
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
