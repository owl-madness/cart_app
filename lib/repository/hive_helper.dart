import 'package:cart_app_synkrama/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';

class HiveHelper {
  static HiveHelper? _instance;
  static late Box<dynamic> _box;

  static String loggedStateKey = 'loggedState';

  HiveHelper._();

  factory HiveHelper.getInstance() {
    _instance ??= HiveHelper._();
    return _instance!;
  }

  Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  Future<void> openBox(String boxName) async {
    _box = await Hive.openBox(boxName);
  }

  bool doesKeyExist(String key) {
    final hiveHelper = HiveHelper.getInstance();
    for (var boxKey in hiveHelper.getBoxValues()) {
      if (boxKey == key) {
        return true;
      }
    }
    return false;
  }

  Future<void> userLoggedState(bool loggedState) async {
    await _box.put(loggedStateKey,loggedState);
  }

  Future<void> putUser(UserDataModel userModel) async {
    await _box.put(userModel.email,
        {'name': userModel.name, 'password': userModel.password});
  }

  dynamic get(String key) {
    return _box.get(key);
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  int getBoxLength() {
    return _box.length;
  }

  Iterable<dynamic> getBoxValues() {
    return _box.values;
  }
}
