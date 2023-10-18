import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/pages/reportpages/report_petinfo_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:paw_finder/model/user_model.dart';
// import 'package:paw_finder/services/auth_services.dart';

class ReportUserPage extends StatefulWidget {
  const ReportUserPage({super.key});

  @override
  State<ReportUserPage> createState() => _ReportUserPageState();
}

class _ReportUserPageState extends State<ReportUserPage> {
  late String name;
  late String phoneNumber;
  late String email;
  // late String password;
  late User user;

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
                      Text("Reportar animal encontrado",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Crie uma conta para reportar um animal"),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Seu nome",
                          hintText: "Maria da Silva",
                        ),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Telefone (WhatsApp)",
                          hintText: "(00)0000-0000",
                        ),
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "email@email.com",
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      //   SizedBox(
                      //     height: 20,
                      //   ),
                      //   TextFormField(
                      //     obscureText: true,
                      //     decoration: const InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: "Senha",
                      //       hintText: "Senha de 6 digitos",
                      //     ),
                      //     onChanged: (value) {
                      //       password = value;
                      //     },
                      //   ),
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
            user = User(name: name, email: email, phoneNumber: phoneNumber);

            // Send user data to the "users" collection and get the document ID
            DocumentReference userDocumentReference =
                await FirebaseFirestore.instance.collection('users').add(user.toJson());
            
            // Obtain the document ID
            String userDocumentId = userDocumentReference.id;
            // Navigate to the ReportPetInfoPage and pass the user and document ID
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportPetInfoPage(
                  userDocumentId: userDocumentId, // Pass the user document ID
                ),
              ),
            );
                },
                child: Text("Continuar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
