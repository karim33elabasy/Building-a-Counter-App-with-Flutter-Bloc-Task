abstract class CounterStates{
  const CounterStates();
}

class InitialCounterState extends CounterStates{}

class NumberChange extends CounterStates{
  final int number;
  const NumberChange({required this.number});
}