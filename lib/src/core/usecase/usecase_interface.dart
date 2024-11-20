import 'package:adote_um_pet/src/core/typedefs/types.dart';

abstract interface class UseCase<Type, Params> {
  Future<Output<Type>> call(Params params);
}
