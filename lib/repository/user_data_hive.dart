import 'package:cart_app_synkrama/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class UserDataHive {
  static String hiveDataKey = 'users';
  late final BoxCollection collection;

  Future<void> initiateData() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final databasePath = appDocumentDir.path;
    collection = await BoxCollection.open(
      'MyFirstFluffyBox', // Name of your database
      {'cats', 'dogs'}, // Names of your boxes
      path: databasePath,
    );
  }

  Future<void> addNewUser(UserDataModel userModel) async {
    final users = await collection.openBox<Map>(hiveDataKey);

    await users.put(userModel.email,
        {'name': userModel.name, 'password': userModel.password});
  }

  Future<UserDataModel?> checkUser(String email) async {
    final users = await collection.openBox<Map>(hiveDataKey);
    final catMap = await users.getAllValues();
    if (catMap.containsKey(email)) {
      var user = await users.get(email);
      UserDataModel existingUser = UserDataModel(
          email: email,
          name: user?[email]["name"],
          password: user?[email]["password"]);
      return existingUser;
    }
    return null;
  }
}
