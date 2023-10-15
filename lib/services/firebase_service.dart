// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:paw_finder/model/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DataServices {

  Future<List<PetModel>> fetchPetsFromFirebase() async {
  List<PetModel> petList = [];

  try {
    // Reference to the "found" collection
    final collectionRef = FirebaseFirestore.instance.collection('found');

    // Fetch the documents from the collection
    final QuerySnapshot querySnapshot = await collectionRef.get();

    // Loop through the documents and convert them to PetModel instances
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      PetModel pet = PetModel.fromJson(data);
      petList.add(pet);
      print(petList);
    }
  } catch (e) {
    // Log the error
    print("Error fetching pets from Firebase: $e");
  }

  return petList;
}
}




//   String baseUrl = "get URL";
//   Future<List<PetModel>> getInfo() async {
//     var apiURL = 'getplaces';
//     http.Response res = await http.get(Uri.parse(baseUrl + apiURL));
//     try {
//       if (res.statusCode == 200) {
//         List<dynamic> list = json.decode(res.body);
//         return list.map((e) => PetModel.fromJson(e)).toList();
//       } else {
//         return <PetModel>[];
//       }
//     } catch (e) {
//       print(e);
//       return <PetModel>[];
//     }
//   }
// }

