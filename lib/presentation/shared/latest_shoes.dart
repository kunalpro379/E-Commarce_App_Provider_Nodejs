import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping/presentation/shared/stagger_tile.dart';
import '../../models/sneaker_model.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    Key? key,
    required this.sneakers,
  }) : super(key: key);

  final Future<List<Sneakers>> sneakers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            final sneakerList = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                children: List.generate(sneakerList.length, (index) {
                  final shoe = sneakerList[index];
                  return StaggeredGridTile.extent(
                    crossAxisCellCount: 1,
                    mainAxisExtent: (index % 4 == 1 || index % 4 == 3)
                        ? MediaQuery.of(context).size.height * 0.35
                        : MediaQuery.of(context).size.height * 0.30,
                    child: StaggerTile(
                      imageUrl: shoe.imageUrl[1],
                      name: shoe.name,
                      price: "\$${shoe.price}",
                    ),
                  );
                }),
              ),
            );
          }
        });
  }
}
