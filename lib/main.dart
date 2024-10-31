import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/locator_service.dart' as depinjections;
import 'package:flutter/cupertino.dart';
import 'common/app_theme.dart';
import 'feature/product/presentation/bloc/bloc_observer.dart';
import 'feature/home/presentation/bloc/home_bloc.dart';
import 'feature/home/presentation/widgets/bottombar/home_bottombar_widgets.dart';
import 'feature/product/presentation/bloc/product_bloc.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await depinjections.initializeDependencies();
  BlocOverrides.runZoned(
        () => runApp(const MyApp()),
    blocObserver: BlocsObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => injection<HomeBloc>(),
          ),
          BlocProvider<ProductBloc>(
            create: (context) =>injection<ProductBloc>(),
        ),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          home: const HomeBottomWidget(),
        )
    );
  }
}