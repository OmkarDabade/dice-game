import 'package:dice_game/model/app_user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends GetxService {
  late Box<AppUser> _userDataBox;

  AppUser? get user => _userDataBox.get('user');

  @override
  void onClose() async {
    await _userDataBox.close();
    super.onClose();
  }

  Future<void> initService() async {
    _userDataBox = await Hive.openBox<AppUser>('user_data');
  }

  Future<void> updateUser(AppUser user) async {
    await _userDataBox.put('user', user);
  }
}
