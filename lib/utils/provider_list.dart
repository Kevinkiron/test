import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:test/bloc/splash_bloc/splash_bloc.dart';

List<SingleChildWidget> blocProviderList = [
  BlocProvider(
    create: (context) => SplashBloc()..add(Navigate()),
  ),
  BlocProvider(
    create: (context) => BottomNavBloc(),
  ),
];
