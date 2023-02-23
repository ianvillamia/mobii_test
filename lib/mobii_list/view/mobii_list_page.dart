import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobii_test/mobii_list/cubit/mobii_cubit.dart';
import 'package:mobii_test/mobii_list/view/widgets/user_tile.dart';

class MobiiListPage extends StatelessWidget {
  const MobiiListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MobiiCubit, MobiiState>(
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
            finished: (finished) {
              return ListView.builder(
                itemCount: finished.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserTile(user: finished.users[index]);
                },
              );
            },
            orElse: SizedBox.new,
          );
        },
      ),
    );
  }
}
