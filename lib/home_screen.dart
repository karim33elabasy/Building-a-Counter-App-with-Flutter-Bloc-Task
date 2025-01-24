import 'package:create_different_blocs_task/controllers/counter_bloc/counter_cubit.dart';
import 'package:create_different_blocs_task/controllers/counter_bloc/counter_states.dart';
import 'package:create_different_blocs_task/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterBloc = context.read<CounterCubit>();
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
            BlocBuilder<CounterCubit,CounterStates>(
              builder: (context,state) {
                return Text(counterBloc.number.toString(),style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20));
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocListener<CounterCubit,CounterStates>(
                  listener: (context,state){
                    if(state is NumberChange){
                      if(state.number > 10){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Counter is more than 10 !')));
                      }else if(state.number<0){
                        showDialog(context: context, builder: (context)=> AlertDialog(
                          content: const Text("Number is negative !"),
                          actions: [
                            OutlinedButton(onPressed: (){Navigator.pop(context);}, child: const Text("Ok"))
                          ],
                        ));
                      }
                    }
                  },
                  child: MaterialButton(
                      onPressed: (){
                        counterBloc.addNumber();
                      },
                    color: Colors.blue,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Text("+",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white), ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    counterBloc.decreaseNumber();
                  },
                  color: Colors.blue,
                  shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Text("-",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white), ),
                ),
                MaterialButton(
                  onPressed: (){
                    counterBloc.resetNumber();
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
