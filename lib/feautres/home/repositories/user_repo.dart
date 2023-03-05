import 'package:dio/dio.dart';
import 'package:mahmoud/feautres/home/model/user.dart';

class AllUserRepository {
  Future<List<Screen>> fetchUserData() async {
    final response = await Dio().get("https://api.escuelajs.co/api/v1/users");

    final userData = List<Screen>.from(
      response.data.map(
        (value) => Screen.fromJson(value),
      ),
    );
    return userData;
  }


}
