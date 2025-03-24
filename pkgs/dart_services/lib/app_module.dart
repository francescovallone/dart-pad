import 'package:dart_services/analyzer/analyzer_module.dart';
import 'package:dart_services/app_service.dart';
import 'package:serinus/serinus.dart';
import 'package:serinus_config/serinus_config.dart';

import 'app_controller.dart';

class AppModule extends Module {

  AppModule(): super(
    providers: [AppService()],
    controllers: [AppController()],
    imports: [ConfigModule(), AnalyzerModule()]
  );

}