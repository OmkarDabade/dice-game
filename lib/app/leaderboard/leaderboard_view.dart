import 'package:dice_game/app/leaderboard/leaderboard_controller.dart';
import 'package:dice_game/model/app_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Leader board')),
      body: GetBuilder<LeaderBoardController>(
        builder: (model) => model.usersList.isEmpty
            ? const Center(
                child: Text('Users not found'),
              )
            : ListView.builder(
                itemCount: model.usersList.length,
                itemBuilder: (c, i) => _userCard(model.usersList[i]),
              ),
      ),
    );
  }

  Widget _userCard(AppUser user) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(user.email ?? 'RandomUser'),
      trailing: Text(user.cummulativeScore.toString()),
    );
  }
}
