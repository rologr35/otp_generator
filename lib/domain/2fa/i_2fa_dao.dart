
import 'authenticated_entity_model.dart';

abstract class I2faDao {

  Future<bool> deleteAllApps();

  Future<bool> deleteApp(String appId);

  Future<AuthenticatedEntity?> getApp(String appId);

  Future<List<AuthenticatedEntity>> getApps();

  Future<AuthenticatedEntity?> createApp(AuthenticatedEntity model);

  Future<bool> updateApp(AuthenticatedEntity model);
}