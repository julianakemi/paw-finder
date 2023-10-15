// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:paw_finder/model/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataServices {
  //Retrieve data from Firebase
  Future<List<Pet>> fetchPetsFromFirebase() async {
  List<Pet> petList = [];
  try {
    // Reference to the "found" collection
    final collectionRef = FirebaseFirestore.instance.collection('found');

    // Fetch the documents from the collection
    final QuerySnapshot querySnapshot = await collectionRef.get();

    // Loop through the documents and convert them to PetModel instances
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Pet pet = Pet.fromJson(data);
      petList.add(pet);
      print(petList);
    }
  } catch (e) {
    // Log the error
    print("Error fetching pets from Firebase: $e");
  }

  return petList;
}

//Send data to Firebase
Future<void> sendPetToFirebase(Pet pet) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('found');

      // Convert the PetModel to a Map
      Map<String, dynamic> petData = {
        'type': pet.type,
        'img': pet.img,
        'location': pet.location,
        'breed': pet.breed,
        'size': pet.size,
        'gender': pet.gender,
        'color': pet.color,
        'description': pet.description,
      };

      // Add the pet data to the collection
      await collectionRef.add(petData);
    } catch (e) {
      print("Error sending pet data to Firebase: $e");
    }
  }

}

