import "package:create_different_blocs_task/controllers/counter_bloc/counter_cubit.dart";
import "package:create_different_blocs_task/controllers/theme_bloc/theme_cubit.dart";
import "package:create_different_blocs_task/controllers/theme_bloc/theme_states.dart";
import "package:create_different_blocs_task/home_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CounterCubit()),
        BlocProvider(create: (context)=> ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit,ThemeStates>(
        builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: context.read<ThemeCubit>().isDarkTheme? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            home: const HomeScreen()
          );
        }
      ),
    );
  }
}
