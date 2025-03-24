import 'package:dart_services/sdk.dart';
import 'package:serinus/serinus.dart';

class AppService extends Provider with OnApplicationReady{

  Sdk? _sdk;

  Sdk get sdk => _sdk ?? Sdk.fromLocalFlutter();

  AppService(): super(isGlobal: true);

  @override
  Future<void> onApplicationReady() async {
    _sdk = Sdk.fromLocalFlutter();
  }

}