import 'package:flutter/material.dart';
import 'package:ydione_plant_app/ui/screens/widgets/plant_widget.dart';

import '../../constants.dart';
import '../../models/plants.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedPlants;

  const FavoritePage({super.key, required this.favoritedPlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: widget.favoritedPlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your Favorited Plants',
                    style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.favoritedPlants.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        plantList: widget.favoritedPlants, index: index);
                  }),
            ),
    );
  }
}
