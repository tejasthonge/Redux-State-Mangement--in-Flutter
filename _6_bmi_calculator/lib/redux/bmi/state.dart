


class BMIState{
   
   double? hightInFeet;
   double? hightInInch;
   double? weight;
   double? allBMI;

  BMIState( 
    { 
      required this.allBMI,
      required this.hightInFeet,
      required this.hightInInch,
      required this.weight, 
    }
  );

  factory BMIState.initialeState()=>BMIState(allBMI: null, hightInFeet: null, hightInInch: null, weight: null);

  BMIState  copyWith({ 
    double? hightInFeet,
    double? hightInInch,
    double? weight,
    double? allBMI,
  }) =>BMIState( allBMI: allBMI??this.allBMI, hightInFeet: hightInFeet ?? this.hightInFeet, hightInInch: hightInInch ?? this.hightInInch, weight: weight ?? this.weight);

  @override 
  String toString() {
    return 'BMIState{hightInFeet: $hightInFeet, hightInInch: $hightInInch, weight: $weight}';
  }

}