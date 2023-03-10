import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobii_test/core/providers/providers.dart';
import 'package:mobii_test/l10n/l10n.dart';
import 'package:mobii_test/mobii_list/cubit/mobii_cubit.dart';
import 'package:mobii_test/mobii_list/view/mobii_list_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    setupProviders(); //* Setup getit providers
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => MobiiCubit(),
        child: const MobiiListPage(),
      ),
    );
  }
}
