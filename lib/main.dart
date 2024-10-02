import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/utils/provider_list.dart';

import 'routes/routes.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: blocProviderList,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Test",
        theme: ThemeData(
          useMaterial3: true,
        ),
        routerConfig: MyRouter.router,
      ),
    );
  }
}
