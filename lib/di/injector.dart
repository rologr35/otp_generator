

import 'package:kiwi/kiwi.dart';
import 'package:otp_generator/data/dao/2fa_dao.dart';
import 'package:otp_generator/domain/2fa/i_2fa_dao.dart';
import 'package:otp_generator/ui/authenticator/authenticator_bloc.dart';

import '../app_bloc.dart';
import '../base/bloc_base.dart';
import '../data/converter/2fa_converter.dart';
import '../data/dao/_base/app_database.dart';
import '../data/repository/2fa_repository.dart';
import '../domain/2fa/i_2fa_converter.dart';
import '../domain/2fa/i_2fa_repository.dart';
import '../utils/logger.dart';

///Part dependency injector engine and Part service locator.
///The main purpose of [Injector] is to provide bloCs instances and initialize the app components depending the current scope.
///To reuse a bloc instance in the widget's tree feel free to use the [BlocProvider] mechanism.
class Injector {
  ///Singleton instance
  static late Injector instance;

  static bool _initialized = false;

  KiwiContainer container = KiwiContainer();


  ///Is the app in debug mode?
  bool isInDebugMode() {
    var debugMode = false;
    assert(debugMode = true);
    return debugMode;
  }

  ///returns a new bloc instance
  T getNewBloc<T extends BaseBloC>() => container.resolve();

  T getDependency<T>() => container.resolve();

  Logger get logger => container.resolve();

  static init() {
    if(!_initialized) {
      instance = Injector._init();
      _initialized = true;
    }
  }

  Injector._init() {
    _initialize();
  }

  _initialize() {
    _registerCommon();
    _registerMappers();
    _registerDaoLayer();
    _registerRepositoryLayer();
    _registerBloCs();
  }

  _registerMappers() {
    container.registerSingleton<I2faConverter>((c) => TwoFaConverter());
  }

  _registerDaoLayer() {
    container.registerSingleton((c) => AppDatabase.instance);
    container.registerSingleton<I2faDao>((c) => TwoFaDao(c.resolve(), c.resolve()));
  }

  _registerRepositoryLayer() {
    container.registerSingleton<I2faRepository>((c) => TwoFaRepository(c.resolve()));
  }

  _registerBloCs() {
    container.registerFactory((c) => OtpGeneratorBloC());
    container.registerFactory((c) => AuthenticatorBloC(container.resolve()));
  }

  _registerCommon() {
    container.registerSingleton<Logger>((c) => LoggerImpl());
  }
}
