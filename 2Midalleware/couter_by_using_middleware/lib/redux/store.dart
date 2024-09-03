// writing the store function that reatening the Store class object ththa storuing the initial state ,reducer and middleware

import 'package:couter_by_using_middleware/redux/middleware/crash_middleware.dart';
import 'package:couter_by_using_middleware/redux/middleware/logging_middleware.dart';
import 'package:couter_by_using_middleware/redux/reducer.dart';
import 'package:redux/redux.dart';

Store<int> createStore() {
  return Store(
    (state, action) => counterReducer(state, action),
    initialState: 0,
    middleware: [
      loggingMiddleware,
      crashReportingMiddleware
    ]
  );
}
