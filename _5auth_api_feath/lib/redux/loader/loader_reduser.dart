import 'dart:developer';

import 'package:_5auth_api_feath/redux/loader/loader_action.dart';
import 'package:_5auth_api_feath/redux/loader/loader_state.dart';
import 'package:redux/redux.dart';

//means combine reducers required the TypedReducers<State,Action>

Reducer<LoaderState> loaderStateReducer = combineReducers<LoaderState>([
  TypedReducer<LoaderState, LoaderLodingStart>(startLoading),
  TypedReducer<LoaderState, LoaderLodingFinish>(finishLoding),
  TypedReducer<LoaderState, LoaderSavingStart>(startSaving),
  TypedReducer<LoaderState, LoaderSavingFinish>(finishSaving),
]);

// following is to write in  single reducer we are further devided into multiple su reduser

// reducer for the LoaderLodingStart Action
LoaderState startLoading(LoaderState loaderState, LoaderLodingStart action) {
  return loaderState.copyWith(isLoading: true, isSaving: false);
}

//for the LoaderLodingEnd Action

LoaderState finishLoding(LoaderState loaderState, LoaderLodingFinish action) {
  return loaderState.copyWith(isLoading: false, isSaving: false);
}

// for the LoaderSavingStart Action

LoaderState startSaving(LoaderState loaderState, LoaderSavingStart action) {
  return loaderState.copyWith(isLoading: false, isSaving: true);
}

// for the LoaderSavingFinish Action

LoaderState finishSaving(LoaderState loaderState, LoaderSavingFinish action) {
  return loaderState.copyWith(isLoading: false, isSaving: false);
}
