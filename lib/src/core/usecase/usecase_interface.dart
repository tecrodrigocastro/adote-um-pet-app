import '../typedefs/types.dart';

abstract interface class UseCase<Type extends Object, Params> {
  Future<Output<Type>> call(Params params);
}
