import 'package:dart_services/analyzer/analyzer_service.dart';
import 'package:dart_services/app_service.dart';
import 'package:serinus/serinus.dart';

class AppController extends Controller{

  AppController(): super(path: '/') {
    on(Route.get('/'), (RequestContext context) {
      final sdk = context.use<AppService>().sdk;
      return '${sdk.dartSdkPath} - ${sdk.dartVersion}';
    });
    on(Route.get('/analyze'), (RequestContext context) async {
      final analyzer = context.use<AnalyzerService>();
      final res = await analyzer.analyze(
        r'''import 'dart:io';
import 'package:convert/convert.dart';

void main() {
  for (var i = 0; i < 10; i++) {
    print('hello ${i + 1}');
  }
  
  var process = await Process.start('cat', []);
  process.stdout
      .transform(utf8.decoder)
      .forEach(print);
  process.stdin.writeln('Hello, world!');
  process.stdin.writeln('Hello, galaxy!');
  process.stdin.writeln('Hello, universe!');
}'''
      );
      return {
        'imports': res.imports,
        'issues': res.issues,
      };
    });
  }

}