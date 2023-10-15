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
            Container(
                height: 240,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                decoration: BoxDecoration(color: AppColors.primary400),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Busque seu pet",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 20),
                      SearchAnchor(builder:
                          (BuildContext context, SearchController controller) {
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
                      }, suggestionsBuilder:
                          (BuildContext context, SearchController controller) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {},
                          );
                        });
                      }),
                    ])),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: info.length,
                itemBuilder: (context, index) {
                  return HorizontalCard(
                      location: info[index].location, 
                      date: info[index].color,
                      breed: info[index].breed,
                      gender:info[index].gender);
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
