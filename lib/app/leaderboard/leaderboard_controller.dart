import 'package:dice_game/model/app_user.dart';
import 'package:dice_game/service/firebase_services.dart';
import 'package:get/get.dart';

class LeaderBoardController extends GetxController {
  List<AppUser> usersList = <AppUser>[];

  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  @override
  void onInit() {
    _firebaseService.users.listen((users) {
      sortAndUpdate(users);
    });

    sortAndUpdate(_firebaseService.users);

    super.onInit();
  }

  void sortAndUpdate(List<AppUser> newList) {
    usersList = newList;

    usersList.sort((a, b) => b.cummulativeScore.compareTo(a.cummulativeScore));
    update();
  }
}
