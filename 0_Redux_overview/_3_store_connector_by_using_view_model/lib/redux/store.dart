

import 'package:_3_store_connector_by_using_view_model/redux/reduser/reduser.dart';
import 'package:_3_store_connector_by_using_view_model/redux/state/state.dart';
import 'package:redux/redux.dart';

final Store<CountterState> store= Store<CountterState>(
  countterReduser,
  initialState: CountterState.intialState());