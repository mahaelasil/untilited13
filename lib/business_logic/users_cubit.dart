
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../corre/end_points.dart';
import '../data/models/users_response.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  UsersResponse usersResponse = UsersResponse();
  Dio dio = Dio();

  Future<void> getUsersUsingDio() async{

    emit(UsersLoadingState());

    try{
      final Response response = await dio.get(url);
      if (kDebugMode) {
        print('dio response status code ${response
            .statusCode}, dio response status message ${response
            .statusMessage}, dio response body ${response.data}');
      }
      if(response.statusCode == 200) {
        usersResponse = UsersResponse.fromJson(response.data);
        emit(UsersSuccessState());
      }else{
        emit(UsersErrorState());
      }
    }catch(error){
      if (kDebugMode) {
        print(error);
      }
      emit(UsersErrorState());
    }
  }
}