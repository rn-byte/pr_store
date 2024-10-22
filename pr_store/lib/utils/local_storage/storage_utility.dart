import 'package:get_storage/get_storage.dart';

class PrLocalStorage {
  // static final PrLocalStorage _instance = PrLocalStorage._internal();

  late final GetStorage _storage;

  /// Singleton Instance
  static PrLocalStorage? _instance;

  PrLocalStorage._internal();

  factory PrLocalStorage.instance() {
    _instance ??= PrLocalStorage._internal();
    return _instance!;
  }

  /// To assign or handle userbase storage
  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);

    /// Creating instance
    _instance = PrLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  ///Generic method to SAVE data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  ///Generic method to READ data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  ///Generic method to REMOVE data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  ///Generic method to CLEAR ALL data from Storage
  Future<void> clearALlData() async {
    await _storage.erase();
  }
}
