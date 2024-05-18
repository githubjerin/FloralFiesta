import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floral_fiesta/constants.dart';
import 'package:floral_fiesta/data.dart';
import 'package:floral_fiesta/Pages/plant_details_page.dart';

import '../components/recently_viewed_card.dart';
import '../components/plant_card.dart';
import '../components/category_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Let\'s find your plants!',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.poppins(
                          color: kDarkGreenColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: kDarkGreenColor),
                    cursorColor: kDarkGreenColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kGinColor,
                      hintText: 'Search Plant',
                      hintStyle: TextStyle(color: kGreyColor),
                      prefixIcon: Icon(
                        Icons.search,
                        color: kDarkGreenColor,
                        size: 26.0,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.mic),
                        color: kDarkGreenColor,
                        iconSize: 26.0,
                        splashRadius: 20.0,
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kGinColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGinColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGinColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  CategorySelector(
                    selected: selected,
                    categories: const [
                      'Recommended',
                      'Top',
                      'Indoor',
                      'Outdoor'
                    ],
                    onTap: (index) {
                      setState(() {
                        selected = index;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 290.0,
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 220.0,
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: recommended.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 20.0);
                              },
                              itemBuilder: (context, index) {
                                return PlantCard(
                                  plantType: recommended[index].plantType,
                                  plantName: recommended[index].plantName,
                                  plantPrice: recommended[index].plantPrice,
                                  image: Image.asset(
                                    recommended[index].image,
                                    alignment: Alignment.topLeft,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PlantDetails(
                                            plant: recommended[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, bottom: 16.0),
                          child: Text(
                            'Recently Viewed',
                            style: TextStyle(
                              color: kDarkGreenColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                          child: ListView.separated(
                            itemCount: viewed.length,
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RecentlyViewedCard(
                                plantName: viewed[index].plantName,
                                plantInfo: viewed[index].plantInfo,
                                image: AssetImage(viewed[index].image),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 20.0);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}