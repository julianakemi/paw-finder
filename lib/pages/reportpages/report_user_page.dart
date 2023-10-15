import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/pages/reportpages/report_petinfo_page.dart';

class ReportUserPage extends StatefulWidget {
  const ReportUserPage({super.key});

  @override
  State<ReportUserPage> createState() => _ReportUserPageState();
}

class _ReportUserPageState extends State<ReportUserPage> {
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
                      Text(
                          "Forneca um meio de contato para que o dono consiga comunicar-se com voce."),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Seu nome",
                          hintText: "Maria da Silva",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Telefone (WhatsApp)",
                          hintText: "(00)0000-0000",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Seu email",
                          hintText: "email@email.com",
                        ),
                      ),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportPetInfoPage()),
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
