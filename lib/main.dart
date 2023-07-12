import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled13/presentation/router/app_router.dart';
import 'business_logic/users_cubit.dart';
import 'corre/my_block_observer.dart';
import 'data/data_score/my_cache.dart';
//dio
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.initCache();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return
          MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => UsersCubit(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter App',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              onGenerateRoute: appRouter.onGenerateRoute,
            ),
          );
      },
    );
  }
}