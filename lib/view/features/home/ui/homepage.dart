import 'package:carousel_slider/carousel_slider.dart';
import 'package:dash/utils/imports.dart';
import 'package:dash/view/features/home/bloc/home_bloc.dart';
import 'package:dash/view/widget/product_card_widget.dart';
import 'package:dash/view/widget/image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        titleSpacing: 20,
        centerTitle: false,
        title: Text(
          "Dash World",
          style: GoogleFonts.pacifico(
            fontSize: size24,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previous, current) => current is! HomeActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return Helper.progress();
            case HomeFetchedSuccessState:
              final responseData = state as HomeFetchedSuccessState;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        color: kWhiteColor,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          aspectRatio: 16 / 9,
                          // viewportFraction: 0.4,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: (callbackFunction){},
                          scrollDirection: Axis.horizontal,
                        ),
                        items: responseData.productsList.map((i) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ImageWidget(
                                image: i.image ?? "",
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white.withOpacity(0.5),
                                child: Text(
                                  i.title ?? "",
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontSize: size16,
                                        color: kBlackColor,
                                      ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    ProductCardWidget(
                      storeProductList: responseData.productsList,
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
