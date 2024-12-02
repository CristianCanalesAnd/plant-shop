import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_shop/router/router.dart';
import 'package:plant_shop/state/app_state/app_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/theme/app_theme.dart';

void main() {
  runApp(MyApp(
    rootRouter: RootRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final RootRouter rootRouter;

  const MyApp({
    super.key,
    required this.rootRouter,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppStateCubit()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        routerDelegate: rootRouter.delegate(),
        routeInformationParser: rootRouter.defaultRouteParser(),
      ),
    );
  }
}
