import 'package:flutter/material.dart';

import '../../model/get/mackup_get_api_model.dart';
import 'mackup_api_model.dart';

class Mackup_demo extends StatefulWidget {
  const Mackup_demo({Key? key}) : super(key: key);

  @override
  State<Mackup_demo> createState() => _Mackup_demoState();
}

class _Mackup_demoState extends State<Mackup_demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commanAppBar(
        name: "Mackup Demo",
        elevation: 10,
      ),
      body: FutureBuilder(
        future: GetMackup.GetmackupApi(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MackupModel?>?> snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    data![index]!.imageLink.toString()))),
                      ),
                      Text(data![index]!.name),
                      Text(data![index]!.price.toString()),
                      Text(data![index]!.currency.toString()),
                      Text(data![index]!.brand.toString()),
                      Text(data![index]!.id.toString()),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  AppBar commanAppBar({String? name, double? elevation}) => AppBar(
        title: Text("${name}"),
        elevation: elevation,
      );
}
