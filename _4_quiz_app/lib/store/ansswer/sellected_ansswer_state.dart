


class SellectedAnsswerState{

  final int sellctedAnsswerIndex;
  SellectedAnsswerState({required this.sellctedAnsswerIndex});
  

  @override
  String toString() => 'SellectedAnsswerState{sellctedAnsswerIndex: $sellctedAnsswerIndex}';
  
  factory SellectedAnsswerState.initialState()=> SellectedAnsswerState(sellctedAnsswerIndex: -1);
}