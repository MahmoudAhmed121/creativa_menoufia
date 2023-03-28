import 'package:get/get.dart';


class UserController extends RxController {


var phone = "".obs ;
var name = "".obs ;
var email = "".obs ;
void sendData( String userName , String userPhone , String userEmail )async{
  phone = userPhone.obs; 
  name = userName.obs;
  email = userEmail.obs;



}

}