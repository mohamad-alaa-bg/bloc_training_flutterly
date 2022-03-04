part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncrement;

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncrement];

  CounterState({
    @required this.counterValue,
    @required this.wasIncrement,
  });

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return new CounterState(
      counterValue: map['counterValue'] as int,
      wasIncrement: map['wasIncrement'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'counterValue': this.counterValue,
      'wasIncrement': this.wasIncrement,
    } as Map<String, dynamic>;
  }

// String toJson() => json.encode(toMap());
//
// factory CounterState.fromJson(String source) =>
//     CounterState.fromMap(json.decode(source));
}
