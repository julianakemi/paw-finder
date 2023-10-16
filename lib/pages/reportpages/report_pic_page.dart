import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/model/pet_model.dart';
import 'package:paw_finder/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paw_finder/pages/navpages/search_page.dart';
import 'dart:io';


class ReportPicPage extends StatefulWidget {
  final User user;
  final Pet pet;

  const ReportPicPage({required this.user, required this.pet, super.key});

  @override
  State<ReportPicPage> createState() => _ReportPicPageState();
}

class _ReportPicPageState extends State<ReportPicPage> {
  File? selectedImage;
  late String imageURL;

  // Function to pick an image using the image_picker package
  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

// Function to generate a random id
  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  // Function to upload file do Firebase storage (image folder)
  Future<void> uploadFile(selectedImage) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');
    Reference referenceImage = referenceDirImage.child(idGenerator());
    try {
      await referenceImage.putFile(selectedImage);
      imageURL = await referenceImage.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(bottom: 10),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                      ),
                      Text(
                        "Reportar animal encontrado",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "Upload uma foto do animal para que o dono possa identificá-lo."),
                      SizedBox(
                        height: 30,
                      ),
                      // Button to pick and upload an image
                      ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: Text("Selecionar Imagem"),
                      ),
                      if (selectedImage != null) Image.file(selectedImage!),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary400,
                  elevation: 0,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (selectedImage != null) {
                    //Upload image to firebase storage
                    uploadFile(selectedImage);
                    //update pet's image with the image URL
                    widget.pet.img = imageURL;
                  }
                  // Send user data to the "users" collection
                  await FirebaseFirestore.instance
                      .collection('users')
                      .add(widget.user.toJson());

                  // Send pet data to the "found" collection
                  await FirebaseFirestore.instance
                      .collection('found')
                      .add(widget.pet.toJson());

                },
                child: Text("Reportar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
