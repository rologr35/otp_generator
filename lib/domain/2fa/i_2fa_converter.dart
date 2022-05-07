

import 'authenticated_entity_model.dart';

abstract class I2faConverter {

  AuthenticatedEntity fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(AuthenticatedEntity model);

}