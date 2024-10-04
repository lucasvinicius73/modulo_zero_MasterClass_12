import 'package:moduloZero/dot_env.dart';
import 'package:test/test.dart';

void main() {
  final dotEnvRead = DotEnv();

  group("Test DotEnv", () {
    test('Keys', () async {
      expect(dotEnvRead.readDotEnv("./.env-example").keys,
          <String>["DATABASE_URL", "IS_ADMIN", "REFRESH_TIME"]);
    });
    test('Values', () async {
      expect(dotEnvRead.readDotEnv("./.env-example").values,
          <String>['"http://DATABASE"', "true", "123454"]);
    });
  });
}
