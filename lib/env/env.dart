// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Env.apiKey;
}
