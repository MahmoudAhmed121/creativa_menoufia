part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoding extends HomeState {
 final  bool x ;

  HomeLoding( this.x);
}


class HomeDone extends HomeState {
  final List<Screen> userData;

  HomeDone(this.userData,);


}
class HomeDetailsLoading extends HomeState {}
class HomeDetails extends HomeState {
  final Screen userSingleData;

  HomeDetails(this.userSingleData,);


}
