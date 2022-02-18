import 'package:bloc/bloc.dart';

class GlassCubit extends Cubit<bool> {
  GlassCubit() : super(false);

  void changeGlassOpacity() => emit(!state);
}
