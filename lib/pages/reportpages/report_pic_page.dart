import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';

class ReportPicPage extends StatefulWidget {
  const ReportPicPage({super.key});

  @override
  State<ReportPicPage> createState() => _ReportPicPageState();
}

class _ReportPicPageState extends State<ReportPicPage> {
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
                        "Upload fotos do animal para que o dono possa identificá-lo."),
                    SizedBox(
                      height: 30,
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
                // BlocProvider.of<AppCubits>(context).reportUserInfo();
              },
              child: Text("Continuar"),
            ),
          ),
        ],
      ),
    ));
  }
}
