import 'package:create_different_blocs_task/controllers/counter_bloc/counter_bloc.dart';
import 'package:create_different_blocs_task/controllers/counter_bloc/counter_states.dart';
import 'package:create_different_blocs_task/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/counter_bloc/counter_events.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter",style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsScreen()));
            },
          )
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Column(
          children: [
            BlocBuilder<CounterBloc,CounterStates>(
              builder: (context,state) {
                return Text(counterBloc.number.toString(),style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20));
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocListener<CounterBloc,CounterStates>(
                  listener: (context,state){
                    if(state is NumberChange && state.number > 10){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Counter is more than 10 !')));
                    }
                  },
                  child: MaterialButton(
                      onPressed: (){
                        counterBloc.add(AddingNumber());
                      },
                    color: Colors.blue,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text("Add",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white), ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    counterBloc.add(ResettingNumber());
                  },
                  color: const Color(0xffe7edf3),
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("Reset",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black), ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
