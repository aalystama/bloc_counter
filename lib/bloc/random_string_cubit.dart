import 'package:bloc/bloc.dart';

class RandomStringCubit extends Cubit<String?> {
  RandomStringCubit() : super(null);

  void changeValue(String value) => emit(value);
}
