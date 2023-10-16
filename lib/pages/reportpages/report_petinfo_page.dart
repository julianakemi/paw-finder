import 'package:flutter/material.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/model/pet_model.dart';
import 'package:paw_finder/model/user_model.dart';
import 'package:paw_finder/pages/reportpages/report_pic_page.dart';
import 'package:paw_finder/services/firebase_service.dart';

class ReportPetInfoPage extends StatefulWidget {
  final User user;
  const ReportPetInfoPage({required this.user, super.key});

  @override
  State<ReportPetInfoPage> createState() => _ReportPetInfoPageState();
}

class _ReportPetInfoPageState extends State<ReportPetInfoPage> {
  String? _selectedEspecie;
  String? _selectedLocation;
  String? _selectedBreed;
  String? _selectedGender;
  String? _selectedColor;
  String? _selectedSize;
  TextEditingController descriptionController = TextEditingController();

  List<String> listEspecie = ["cachorro", "gato", "outro"];
  List<String> listLocation = ["Bairro 1", "Bairro 2", "Bairro 3"];
  List<String> listBreed = ["Raça 1", "Raça 2", "Raça 3"];
  List<String> listGender = ["Macho", "Fêmea", "Não sei"];
  List<String> listColor = ["Branco", "Preto", "Amarelo", "Malhado", "Marrom"];
  List<String> listSize = ["Pequeno", "Médio", "Grande"];

  // Create an instance of DataServices
  final dataServices = DataServices();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
                padding: EdgeInsets.only(bottom: 10),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            Text("Reportar animal encontrado",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(
                "Para reportar um animal perdido, por favor preencha o questionário abaixo, fornecendo o máximo de informação possível."),
            SizedBox(
              height: 30,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Espécie"),
              ),
              value: _selectedEspecie,
              hint: Text(
                'selecione a espécie',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedEspecie = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedEspecie = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listEspecie.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Bairro"),
              ),
              value: _selectedLocation,
              hint: Text(
                'selecione o bairro',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedLocation = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listLocation.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Raça"),
              ),
              value: _selectedBreed,
              hint: Text(
                'selecione a raça',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedBreed = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedBreed = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listBreed.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Sexo"),
              ),
              value: _selectedGender,
              hint: Text(
                'selecione o sexo',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listGender.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Cor da pelagem"),
              ),
              value: _selectedColor,
              hint: Text(
                'selecione a cor',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedColor = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedColor = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listColor.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Porte"),
              ),
              value: _selectedSize,
              hint: Text(
                'selecione o porte',
              ),
              isExpanded: true,
              onChanged: (value) {
                setState(() {
                  _selectedSize = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  _selectedSize = value;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "campo obrigatório";
                } else {
                  return null;
                }
              },
              items: listSize.map((String val) {
                return DropdownMenuItem(
                  value: val,
                  child: Text(
                    val,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Descrição",
                  hintText:
                      "Descreva outros detalhes relevantes para ajudar o dono a identificar seu pet."),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary400,
                    elevation: 0,
                    foregroundColor: Colors.white),
                onPressed: () {
                  print(widget.user);
                  // Create a PetModel and populate it with form data
                  Pet pet = Pet(
                    type: _selectedEspecie ?? "",
                    img: "",
                    location: _selectedLocation ?? "",
                    breed: _selectedBreed ?? "",
                    size: _selectedSize ?? "",
                    gender: _selectedGender ?? "",
                    color: _selectedColor ?? "",
                    description: descriptionController.text,
                  );

                  // Navigate to the next page (ReportPicPage) and pass user and pet as parameters
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportPicPage(
                        user: widget.user,
                        pet: pet,
                      ),
                    ),
                  );
                },
                child: Text("Continuar"),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
