import 'package:dash/utils/imports.dart';
import 'package:dash/view/widget/image_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.storeProductList});
  final List<StoreProductModel> storeProductList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size16,
                      color: kBlackColor,
                    ),
              ),
              Text(
                "View All",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size12,
                      color: Colors.lightGreen,
                    ),
              ),
            ],
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 90),
          itemCount: storeProductList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: kWhiteColor,
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    offset: Offset(6, 6),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                  BoxShadow(
                    color: kSecondaryColor.withOpacity(0.1),
                    offset: const Offset(-6, -6),
                    spreadRadius: 1,
                    blurRadius: 4,
                  )
                ],
              ),
              child: Row(
                children: [
                  ImageWidget(
                    image: storeProductList[index].image ?? "",
                    width: 100,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            storeProductList[index].title ?? "",
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                          Text(
                            storeProductList[index].description ?? "",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: kBlack54Color,
                                  fontSize: 10,
                                ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.currency_rupee,
                                    size: size18,
                                    color: kPrimaryColor,
                                  ),
                                  Text(
                                    storeProductList[index].price.toString(),
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontSize: size18,
                                          color: Colors.lightGreen,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    double.parse("4") < 2.5
                                        ? Icons.star_half
                                        : Icons.star,
                                    size: size18,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: size14,
                                      color: kBlack54Color,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Chip(
                                backgroundColor: kBlueColor.withOpacity(0.4),
                                side: BorderSide.none,
                                label: Text(
                                  storeProductList[index]
                                          .category
                                          ?.toUpperCase() ??
                                      "",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: kPrimaryColor,
                                        fontSize: 10,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(
                                    left: 8.0,
                                    bottom: 4,
                                    right: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(300),
                                    color: kSecondaryColor.withOpacity(0.1),
                                  ),
                                  child: const Icon(
                                    Icons.favorite_border,
                                    color: kRedColor,
                                    size: size18,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
