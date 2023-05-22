import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ina_satu_tujuh/deret/deret_page.dart';

import 'deret/bloc/deret_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeretBloc()),
      ],
      child: DismissableKeyboard(
        widget: MaterialApp(
          title: 'Deret INA17',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: DeretPage(),
        ),
      ),
    );
  }
}

class DismissableKeyboard extends StatelessWidget {
  final Widget widget;

  const DismissableKeyboard({
    Key? key,
    required this.widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);

          if (!focusScopeNode.hasPrimaryFocus &&
              focusScopeNode.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: widget
    );
  }
}