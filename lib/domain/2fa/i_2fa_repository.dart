


import '../../data/remote/result.dart';
import 'authenticated_entity_model.dart';

abstract class I2faRepository {

  Future<Result<List<AuthenticatedEntity>>> getApps();

  Future<Result<AuthenticatedEntity?>> getApp(String appId);

  Future<Result<bool>> updateApp(AuthenticatedEntity model);

  Future<Result<bool>> deleteApp(String appId);

  Future<Result<bool>> deleteAllApps();

  Future<Result<AuthenticatedEntity?>> createApp(String issuer, String label, String secret, OTPType type);

}