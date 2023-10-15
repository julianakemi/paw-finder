import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paw_finder/cubit/app_cubit_states.dart';
import 'package:paw_finder/cubit/app_cubits.dart';
import 'package:paw_finder/misc/colors.dart';
import 'package:paw_finder/widgets/horizontal_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.pets;
        return Column(
          children: [
            Stack(children: [
              Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'img/background-blob.png'), // Replace with your image
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top:36.0, left: 14, right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Busque seu pet",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 10),
                            SearchAnchor(builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                hintText: "Busque por bairro",
                                controller: controller,
                                padding: const MaterialStatePropertyAll<EdgeInsets>(
                                    EdgeInsets.symmetric(horizontal: 16.0)),
                                onTap: () {
                                  controller.openView();
                                },
                                onChanged: (_) {
                                  controller.openView();
                                },
                                leading: const Icon(Icons.search),
                                trailing: <Widget>[
                                  Tooltip(
                                    message: 'Filtros',
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.filter_list),
                                      selectedIcon:
                                          const Icon(Icons.brightness_2_outlined),
                                    ),
                                  )
                                ],
                              );
                            }, suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
                              return List<ListTile>.generate(5, (int index) {
                                final String item = 'item $index';
                                return ListTile(
                                  title: Text(item),
                                  onTap: () {},
                                );
                              });
                            }),
                          ]),
                      ),
                    )
                  ),
            ]),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return HorizontalCard(
                      location: info[index].location,
                      date: info[index].color,
                      breed: info[index].breed,
                      gender: info[index].gender);
                },
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}
