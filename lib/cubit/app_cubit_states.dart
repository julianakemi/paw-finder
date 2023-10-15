import 'package:equatable/equatable.dart';
import 'package:paw_finder/model/pet_model.dart';

abstract class CubitStates extends Equatable{}

//initializes cubit
class InitialState extends CubitStates{
  @override
  //TODO: implement props
  List<Object> get props => []; 
}

//once initialization has been done, shows WelcomePage
class WelcomeState extends CubitStates{
  @override
  //TODO: implement props
  List<Object> get props => []; 
}

//triggered when laoding the data
class LoadingState extends CubitStates{
  @override
  //TODO: implement props
  List<Object> get props => []; 
}

//triggered after the data has been loaded successfully
class LoadedState extends CubitStates{
  LoadedState(this.pets);
  final List<PetModel> pets;
  @override
  List<Object> get props => [pets]; 
}

class PetProfileState extends CubitStates{
  PetProfileState(this.pet);
  final PetModel pet;
  @override
  List<Object> get props => [pet]; 
}

