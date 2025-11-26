import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/features/todo/presentation/provider/todo_provider.dart';
import 'package:to_do/features/todo/presentation/view/todo_screen.dart';
import 'package:to_do/features/todo/repo/todo_repository.dart';
import 'package:to_do/general/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(sl<TodoRepository>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
