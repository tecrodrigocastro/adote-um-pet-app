import 'package:fpdart/fpdart.dart';

import '../errors/base_exception.dart';

typedef Output<T> = Either<BaseException, T>;
