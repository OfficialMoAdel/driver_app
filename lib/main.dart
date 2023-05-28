import 'package:driver_app/cubit/maps/maps_cubit.dart';
import 'package:driver_app/repository/maps_repo.dart';
import 'package:driver_app/screen/car/main_page_car.dart';
import 'package:driver_app/webServices/PlaceWebServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/auth/auth_cubit.dart';
import 'screen/intro_screen/splash_screen.dart';
import 'routes.dart';

int? isViewed;
void main() async {
  /* SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();//
  isViewed = prefs.getInt('IntroPage'); */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider(
            create: (context) => MapsCubit(MapsRepository(PlacesWebSevices())),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          //home: isViewed != 0 ? OnBoard() : LetsIn(),
          home: MainPagecar(),
          routes: routes,
          //initialRoute: SplashScreen.id,
          theme: ThemeData().copyWith(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: Color.fromARGB(255, 11, 11, 11)),
          ),
        ));
  }
}
