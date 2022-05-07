import 'package:otp_generator/data/repository/_base_repository.dart';
import 'package:uuid/uuid.dart';

import '../../domain/2fa/authenticated_entity_model.dart';
import '../../domain/2fa/i_2fa_dao.dart';
import '../../domain/2fa/i_2fa_repository.dart';
import '../remote/result.dart';

class TwoFaRepository extends BaseRepository implements I2faRepository {
  final I2faDao _i2faDao;

  TwoFaRepository(this._i2faDao);

  @override
  Future<Result<bool>> deleteAllApps() async {
    try {
      final res = await _i2faDao.deleteAllApps();
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<bool>> deleteApp(String appId) async {
    try {
      final res = await _i2faDao.deleteApp(appId);
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<AuthenticatedEntity?>> getApp(String appId) async {
    try {
      final res = await _i2faDao.getApp(appId);
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<List<AuthenticatedEntity>>> getApps() async {
    try {
      final res = await _i2faDao.getApps();
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<bool>> updateApp(AuthenticatedEntity model) async {
    try {
      final res = await _i2faDao.updateApp(model);
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }

  @override
  Future<Result<AuthenticatedEntity?>> createApp(
      String issuer, String label, String secret, OTPType type) async {
    try {
      final res = await _i2faDao.createApp(AuthenticatedEntity(
          id: const Uuid().v1(),
          secret: secret,
          issuer: issuer,
          label: label,
          type: type));
      return ResultSuccess(value: res);
    } catch (ex) {
      return resultError(ex);
    }
  }
}
