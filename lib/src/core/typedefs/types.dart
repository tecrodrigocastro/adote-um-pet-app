import 'package:result_dart/result_dart.dart';

import '../errors/base_exception.dart';

typedef Output<T extends Object> = Result<T, BaseException>;
