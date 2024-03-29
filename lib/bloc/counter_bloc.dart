import 'dart:async';
import 'package:bloc/bloc.dart';
import './counter.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState {
    return UpdateCounterState(0);
  }

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementCounter) {
      yield* _mapIncrementCountertoState(event);
    }else if(event is DecrementCounter) {
      yield* _mapDecrementCountertoState(event);
    }
  }

  Stream<CounterState> _mapIncrementCountertoState(IncrementCounter event) async* {
    final int counter = event.counter + 1;
    yield UpdateCounterState(counter);
  }

    Stream<CounterState> _mapDecrementCountertoState(DecrementCounter event) async* {
    final int counter = event.counter - 1;
    yield UpdateCounterState(counter);
  }
}
