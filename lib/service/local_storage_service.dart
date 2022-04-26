import 'package:dice_game/model/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends GetxService {
  late Box<User> _userDataBox;

  User? get user => _userDataBox.getAt(0);

  @override
  void onInit() async {
    _userDataBox = await Hive.openBox<User>('user_data');
    super.onInit();
  }

  @override
  void onClose() async {
    await _userDataBox.close();
    super.onClose();
  }

  Future<void> updateUser(User user) async {
    await _userDataBox.putAt(0, user);
  }
}
