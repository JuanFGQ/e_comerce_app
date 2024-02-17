import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  late final GetStorage _storage;

  //Singleton instace
  static TLocalStorage? _instance;
  TLocalStorage._internal();

  factory TLocalStorage.instace() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  //GENERIC METHOD TO SAVE DATA
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //GENERIC METHOD TO READ DATA

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //METHOD TO REMOVE DATA

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  //CLEAR ALL DATA
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
