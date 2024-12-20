import '../typedefs/types.dart';

abstract interface class UseCase<Type extends Object, Params> {
  Output<Type> call(Params params);
}
