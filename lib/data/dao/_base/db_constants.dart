class DBConstants {
  static const String dbName = 'otp_generator_db';
  static const int dbVersion = 1;

  ///Common table schema
  static final Map<String, String> tableCols = {
    DBConstants.idKey: DBConstants.textType,
    DBConstants.dataKey: DBConstants.textType,
    DBConstants.parentKey: DBConstants.textType,
  };


  ///columns names
  static const String idKey = 'id';
  static const String dataKey = 'data';
  static const String parentKey = 'parent_id';

  ///columns types
  static const String textType = 'TEXT';
  static const String realType = 'REAL';
  static const String intType = 'INTEGER';

  ///table names
  static const String authenticatedEntityTable = 'authenticated_entity_table';
}
