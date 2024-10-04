import 'dart:io';

class DotEnv {
  Map<String, String> readDotEnv(String dotEnvPath) {
    final file = File(dotEnvPath);
    final content = file.readAsLinesSync();

    Map<String, String> dotEnv = {};

    for (var line in content) {
      if (line.contains("#")) {
        String newLine = line.split("#")[0];
        line = newLine;
      }
      if (line.isNotEmpty) {
        String key = line.split('=')[0];
        String value = line.split('=')[1];
        dotEnv[key] = value.replaceAll(" ", "");
      } else {
        continue;
      }
    }
    return dotEnv;
  }
}

void main() {
  final dotEnvRead = DotEnv();
  Map content = dotEnvRead.readDotEnv("./.env");
  print(content);
}
