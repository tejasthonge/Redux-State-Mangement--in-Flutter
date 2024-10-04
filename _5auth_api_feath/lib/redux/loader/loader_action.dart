

abstract class LoaderAction {

  @override 
  String toString() {
    return '$runtimeType';
  }

} 


class LoaderLodingStart extends LoaderAction {}
class LoaderLodingFinish extends LoaderAction {}
class LoaderSavingStart extends LoaderAction {}
class LoaderSavingFinish extends LoaderAction {}


