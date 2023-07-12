import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/users_cubit.dart';
import '../style/colors.dart';
import '../views/user_list_item.dart';
import '../widgets/defult_text.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late UsersCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = UsersCubit.get(context)..getUsersUsingDio();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlue,
        title: const DefaultText(
          text: 'Users',
          textColor: white,
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: darkBlue,
                  )
                ],
              ),
            );
          } else if (state is UsersSuccessState) {
            return ListView.builder(
                itemCount: cubit.usersResponse.data.length,
                itemBuilder: (context, index) =>
                    UsersListItem(userModel: cubit.usersResponse.data[index]));
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 75.sp,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}