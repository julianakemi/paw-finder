import 'package:bloc/bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
import 'package:paw_finder/model/pet_model.dart';
import 'package:paw_finder/pages/pet_profile_page.dart';
import 'package:paw_finder/services/firebase_service.dart';

class AppCubits extends Cubit <CubitStates> {
  AppCubits({required  this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final pets;
  
  void getData() async{
    try {
      emit(LoadingState());
      pets = await data.fetchPetsFromFirebase();
      emit(LoadedState(pets));
    }
    catch(e) {
      print(e);
    }
  }

  petProfilePage(PetModel pet){
    emit(PetProfileState(pet));
  }

  goHome(){
    emit(LoadedState(pets));
  }

  reportPetInfo(){
    emit(ReportPetInfoState());
  }

  reportUserInfo(){
    emit(ReportUserInfoState());
  }

  reporPic(){
    emit(ReportPicState());
  }
}

