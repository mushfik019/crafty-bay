import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/screens/wish_list_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/utility/image_path.dart';
import 'package:craftybay/presentation/ui/widgets/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselSliderController sliderController = CarouselSliderController();

  int sliderIndex = 0;
  bool showAllCategories = false;
  bool showAllPopular = false;
  bool showAllSpecial = false;
  bool showAllNew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SvgPicture.asset(ImagePath.logoNavSVG),
        ),
        actions: [
          navIconButton(Icons.person_outline),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: navIconButton(Icons.phone_enabled_outlined),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: navIconButton(Icons.notifications_active_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      fillColor: ColorPalette.iconBgColor),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            color: Colors.pink,
                          ),
                          Container(
                            color: Colors.blue,
                          ),
                          Container(
                            color: Colors.green,
                          ),
                          Container(
                            color: Colors.yellow,
                          ),
                        ],
                        carouselController: sliderController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              sliderIndex = index;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: sliderIndex == index
                                        ? ColorPalette.primaryColor
                                        : Colors
                                            .transparent, // Active circle color
                                    border: Border.all(
                                      color: sliderIndex == index
                                          ? ColorPalette.primaryColor
                                          : ColorPalette.subtitleColor,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      sectionTitle(
                        'All Categories',
                        () {
                          setState(() {
                            showAllCategories =
                                !showAllCategories; // Toggle the state
                          });
                        },
                        isSeeAll: true,
                        showAll: showAllCategories,
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: showAllCategories ? 16 : 4,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFe7f7f7),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(Icons.tv,
                                      size: 42,
                                      color: ColorPalette.primaryColor),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Television',
                                  style:
                                      fontStyle(clr: ColorPalette.primaryColor),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      sectionTitle(
                        'Popular',
                        () {
                          setState(() {
                            showAllPopular =
                                !showAllPopular; // Toggle the state
                          });
                        },
                        isSeeAll: true,
                        showAll: showAllPopular,
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.67,
                          ),
                          itemCount: showAllPopular ? 15 : 3,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe7f7f7),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.slideshow_rounded,
                                      size: 70,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          'New year special shoe 30',
                                          style: fontStyle(size: 10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '100',
                                              style: fontStyle(
                                                  size: 11,
                                                  clr:
                                                      ColorPalette.primaryColor,
                                                  fw: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                ),
                                                Text(
                                                  '4.8',
                                                  style: fontStyle(
                                                    size: 11,
                                                    clr:
                                                        ColorPalette.titleColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WishListScreen(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2, horizontal: 3),
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorPalette.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      sectionTitle(
                        'Special',
                        () {
                          setState(() {
                            showAllSpecial =
                                !showAllSpecial; // Toggle the state
                          });
                        },
                        isSeeAll: true,
                        showAll: showAllSpecial,
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.67,
                          ),
                          itemCount: showAllSpecial ? 15 : 3,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe7f7f7),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.slideshow_rounded,
                                      size: 70,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          'New year special shoe 30',
                                          style: fontStyle(size: 10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '100',
                                              style: fontStyle(
                                                  size: 11,
                                                  clr:
                                                      ColorPalette.primaryColor,
                                                  fw: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                ),
                                                Text(
                                                  '4.8',
                                                  style: fontStyle(
                                                    size: 11,
                                                    clr:
                                                        ColorPalette.titleColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2, horizontal: 3),
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorPalette.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      sectionTitle(
                        'New',
                        () {
                          setState(() {
                            showAllNew = !showAllNew; // Toggle the state
                          });
                        },
                        isSeeAll: true,
                        showAll: showAllNew,
                      ),
                      AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.67,
                          ),
                          itemCount: showAllNew ? 15 : 3,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe7f7f7),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(11),
                                        topRight: Radius.circular(11),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.slideshow_rounded,
                                      size: 70,
                                      color: ColorPalette.primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Text(
                                          'New year special shoe 30',
                                          style: fontStyle(size: 10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '100',
                                              style: fontStyle(
                                                  size: 11,
                                                  clr:
                                                      ColorPalette.primaryColor,
                                                  fw: FontWeight.bold),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors.yellow,
                                                  size: 15,
                                                ),
                                                Text(
                                                  '4.8',
                                                  style: fontStyle(
                                                    size: 11,
                                                    clr:
                                                        ColorPalette.titleColor,
                                                  ),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2, horizontal: 3),
                                                decoration: BoxDecoration(
                                                  color:
                                                      ColorPalette.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row sectionTitle(String title, VoidCallback onTap,
      {bool isSeeAll = false, bool showAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: fontStyle(type: 'title'),
        ),
        if (isSeeAll)
          TextButton(
            onPressed: onTap,
            child: Text(
              showAll ? 'See Less' : 'See All', // Toggle text
              style: fontStyle(clr: ColorPalette.primaryColor),
            ),
          ),
      ],
    );
  }

  CircleAvatar navIconButton(IconData icon) {
    return CircleAvatar(
      backgroundColor: ColorPalette.iconBgColor,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: ColorPalette.titleColor,
        ),
      ),
    );
  }
}
