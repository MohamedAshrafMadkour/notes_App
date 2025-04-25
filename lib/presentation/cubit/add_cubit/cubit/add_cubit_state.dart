part of 'add_cubit_cubit.dart';

@immutable
sealed class AddCubitState {}

final class AddCubitInitial extends AddCubitState {}

final class AddCubitLoading extends AddCubitState {}

final class AddCubitSuccess extends AddCubitState {}

final class AddCubitError extends AddCubitState {
  final String error;

  AddCubitError({required this.error});
}
