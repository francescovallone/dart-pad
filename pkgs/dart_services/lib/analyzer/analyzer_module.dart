import 'package:dart_services/analyzer/analyzer_service.dart';
import 'package:dart_services/app_service.dart';
import 'package:serinus/serinus.dart';

class AnalyzerModule extends Module {

  AnalyzerModule(): super(
    providers: [
      Provider.deferred(
        (AppService appService) => AnalyzerService(appService.sdk),
        inject: [AppService],
        type: AnalyzerService
      )
    ],
    exports: [
      AnalyzerService
    ]
  );

}