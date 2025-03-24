import 'package:dart_services/app_module.dart';
import 'package:serinus/serinus.dart';

Future<void> bootstrap() async {
  final app = await serinus.createApplication(entrypoint: AppModule());
  app.enableShutdownHooks();
  app.use(CorsHook());
  app.globalPrefix = '/api';
  await app.serve();
}