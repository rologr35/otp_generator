
import 'dart:convert';

import 'package:otp_generator/data/dao/_base/app_database.dart';
import 'package:otp_generator/domain/2fa/authenticated_entity_model.dart';
import 'package:otp_generator/domain/2fa/i_2fa_converter.dart';
import 'package:otp_generator/domain/2fa/i_2fa_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../../di/injector.dart';
import '_base/db_constants.dart';

class TwoFaDao implements I2faDao {
  final AppDatabase _appDatabase;
  final I2faConverter _i2faConverter;

  TwoFaDao(this._i2faConverter, this._appDatabase);

  @override
  Future<AuthenticatedEntity?> createApp(AuthenticatedEntity model) async {
    try {
      Database db = await _appDatabase.db;
      final map = {
        DBConstants.idKey: model.id,
        DBConstants.dataKey: jsonEncode(_i2faConverter.toJson(model)),
        DBConstants.parentKey: model.id
      };
      await db.insert(DBConstants.authenticatedEntityTable, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return model;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return null;
    }
  }

  @override
  Future<bool> deleteAllApps() async {
    try {
      Database db = await _appDatabase.db;
      await db.delete(DBConstants.authenticatedEntityTable);
      return true;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return false;
    }
  }

  @override
  Future<bool> deleteApp(String appId) async {
    try {
      Database db = await _appDatabase.db;
      final rows = await db.delete(DBConstants.authenticatedEntityTable,
          where: '${DBConstants.idKey}= ?', whereArgs: [appId]);
      return rows > 0;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return false;
    }
  }

  @override
  Future<AuthenticatedEntity?> getApp(String appId) async {
    try {
      Database db = await _appDatabase.db;
      final data = await db.query(DBConstants.authenticatedEntityTable,
          where: '${DBConstants.idKey}= ?', whereArgs: [appId]);
      if (data.isNotEmpty) {
        final String? value = data[0][DBConstants.dataKey] as String?;
        final AuthenticatedEntity obj = _i2faConverter.fromJson(jsonDecode(value ?? ""));
        return obj;
      }
      return null;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return null;
    }
  }

  @override
  Future<List<AuthenticatedEntity>> getApps() async {
    List<AuthenticatedEntity> list = [];
    try {
      Database db = await _appDatabase.db;
      final data = await db.query(DBConstants.authenticatedEntityTable);
      await Future.forEach(data, (Map<String, Object?> map) {
        final String? value = map[DBConstants.dataKey] as String?;
        if(value?.isNotEmpty ?? false) {
          final AuthenticatedEntity obj = _i2faConverter.fromJson(jsonDecode(value ?? ""));
          list.add(obj);
        }
      });
      return list;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return list;
    }
  }

  @override
  Future<bool> updateApp(AuthenticatedEntity model) async {
    try {
      await createApp(model);
      return true;
    } catch (ex) {
      Injector.instance.logger.log(ex);
      return false;
    }
  }

}