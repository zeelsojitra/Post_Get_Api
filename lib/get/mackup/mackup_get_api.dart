import 'package:all_api_practic/service/get/mackup_get_api_service.dart';
import 'package:flutter/material.dart';

import '../../model/get/mackup_get_api_model.dart';
import 'mackup_details.dart';

class Mackup_api extends StatefulWidget {
  const Mackup_api({Key? key}) : super(key: key);

  @override
  State<Mackup_api> createState() => _Mackup_apiState();
}

class _Mackup_apiState extends State<Mackup_api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mackup Api"),
      ),
      body: FutureBuilder(
        future: GetMakupService.GetMackupModel(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MackupModel>?> snapshot) {
          final mackup = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Card(
              elevation: 10,
              child: GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  mainAxisSpacing: 3,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Mackup_Details(
                                      price: mackup[index].price,
                                      name: mackup[index].name,
                                      id: mackup[index].id,
                                      imagelink: mackup[index].imageLink,
                                      apiFeaturedImage:
                                          mackup[index].apiFeaturedImage,
                                      brand: mackup[index].brand,
                                      category: mackup[index].category,
                                      createdAt: mackup[index].createdAt,
                                      currency: mackup[index].currency,
                                      description: mackup[index].currency,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        mackup![index].imageLink.toString()),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              mackup![index].name,
                            ),
                            Text(
                              mackup![index].brand,
                            ),
                            Text(
                              mackup![index].price.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
