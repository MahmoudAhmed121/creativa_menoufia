import 'package:bloc/bloc.dart';
import 'package:mahmoud/feautres/home/model/user_model.dart';
import 'package:mahmoud/feautres/home/repositories/user_repo.dart';

import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getDataFromApi() async {
    emit(HomeLoding(true));

    final response = await AllUserRepository().fetchUserData();
    
    emit(HomeDone(response));
  }

  void getSingleUser(int id) async {
    final responseSingleData = await AllUserRepository().fetchSingleUser(id);

    emit(HomeDetailsLoading());
    emit(HomeDetails(responseSingleData));
  }

  void setData(data) {
    emit(data);
  }

  HomeState getData() {
    return state;
  }
}
