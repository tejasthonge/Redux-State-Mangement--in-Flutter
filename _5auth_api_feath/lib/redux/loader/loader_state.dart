import 'package:meta/meta.dart';

@immutable
class LoaderState {
  final bool isLoading;
  final bool isSaving;

  const LoaderState({
    this.isLoading = false,
    this.isSaving = false,
  });

  factory LoaderState.initialState() =>const LoaderState(
        isLoading: false,
        isSaving: false,
      );

  LoaderState copyWith({bool? isSaving, bool? isLoading}) => LoaderState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving);
}
