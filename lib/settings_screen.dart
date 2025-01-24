import 'package:create_different_blocs_task/controllers/theme_bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controllers/theme_bloc/theme_states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeCubit themeBloc = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        
        ),
      body: SafeArea(
        child: Column(
          children: [
            BlocConsumer<ThemeCubit,ThemeStates>(
              builder: (context,state) {
                return SwitchListTile(
                  title:  const Text("Dark Mode", style: TextStyle(fontSize: 20),),
                  value: themeBloc.isDarkTheme,
                  onChanged: (switchValue){
                    themeBloc.changeTheme(isDark: switchValue);
                  }
                );
              },
              listener: (context,state){
                if(state is ThemeChangeState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(themeBloc.isDarkTheme? "Dark mode is activated" : "Dark mode is off"))
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
