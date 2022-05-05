import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/utility/colors.dart';
import 'package:travel/cubit/travel_cubit_states.dart';
import 'package:travel/utility/strings.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_text.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../cubit/travel_cubits.dart';
import '../gen/assets.gen.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<AssetGenImage, String> data = {
    Assets.images.balloning: 'Balloning',
    Assets.images.hiking: 'Hiking',
    Assets.images.kayaking: 'Kayaking',
    Assets.images.snorkling: 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
    return SideMenu(
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.slideNRotate,
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: BlocBuilder<TravelCubits, TravelCubitStates>(
            builder: (context, state) {
              if (state is LoadedState) {
                var info = state.places;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                final _currentState = _sideMenuKey.currentState;
                                _currentState!.isOpened
                                    ? _currentState.closeSideMenu()
                                    : _currentState.openSideMenu();
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              color: Colors.black),
                          const Expanded(child: SizedBox()),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const AppLargeText(text: "Discover"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.maxFinite,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircleTabBarIndicator(
                            color: AppColors.mainColor,
                            radius: 4,
                          ),
                          isScrollable: true,
                          tabs: [
                            Tab(text: AppTexts.places),
                            Tab(text: AppTexts.inspiration),
                            Tab(text: AppTexts.emotions),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 300,
                      width: double.maxFinite,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ListView.builder(
                            itemCount: info.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<TravelCubits>(context)
                                      .detailPage(info[index]);
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 15, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        AppUrls.baseUrl +
                                            AppUrls.uploads +
                                            info[index].img,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const Text(""),
                          const Text(""),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppLargeText(
                            text: AppTexts.exploreMore,
                            size: 22,
                          ),
                          AppText(
                            text: AppTexts.seeAll,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(right: 50),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            data.keys.elementAt(index).path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AppText(
                                    text: data.values.elementAt(index),
                                    color: AppColors.textColor2,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class CircleTabBarIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabBarIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});
  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

Widget buildMenu() {
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(AppUrls.hadiImage),
                radius: 22.0,
              ),
              SizedBox(height: 16.0),
              Text(
                AppTexts.helloHadi,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.apps, size: 20.0, color: Colors.white),
          title: const Text(AppTexts.home),
          textColor: Colors.white,
          dense: true,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.bar_chart_sharp,
              size: 20.0, color: Colors.white),
          title: const Text(AppTexts.chart),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.search, size: 20.0, color: Colors.white),
          title: const Text(AppTexts.search),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.person, size: 20.0, color: Colors.white),
          title: const Text(AppTexts.profile),
          textColor: Colors.white,
          dense: true,

          // padding: EdgeInsets.zero,
        ),
      ],
    ),
  );
}
