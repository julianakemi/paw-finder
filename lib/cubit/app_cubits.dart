import 'package:bloc/bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
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

  goHome(){
    emit(LoadedState(pets));
  }

}

