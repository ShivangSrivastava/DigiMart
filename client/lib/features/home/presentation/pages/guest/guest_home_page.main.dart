part of "guest_home_page.dart";

Widget _buildHome(BuildContext context) {
  return BlocBuilder<HomeProductBloc, HomeProductState>(
    builder: (context, state) {
      if (state is HomeProductDoneState) {
        return Column(
          children: [
            HomeAppBarWidget(
              title: "Discover",
              actions: [
                BorderIconButton(
                  tooltip: "Saved Products",
                  icon: Icon(UIcons.regularRounded.shopping_bag),
                  onPressed: () {},
                )
              ],
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchBarWidget(
                        onTap: () {
                          sl<NavigationBarBloc>()
                              .add(const NavigationBarChangeIndexEvent(1));
                        },
                      ),
                      const SizedBox(height: 10),
                      const TitledTextWidget()
                          .withoutTextButton(context, label: "For you"),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return const ProductCardWidget(
                              imageProvider: CachedNetworkImageProvider(
                                  "https://m.media-amazon.com/images/I/51xagmo75SL._SL1500_.jpg"),
                            );
                          },
                        ),
                      ),
                      const TitledTextWidget().withTextButton(
                        context,
                        title: "Categories",
                        buttonLabel: "See all",
                        onTap: () {},
                      ),
                      TabSelectorWidget(
                        titles: state.allCategories!,
                        index: state.currentIndex,
                        onTap: (int index) {
                          sl<HomeProductBloc>()
                              .add(HomeProductChangeCategoryEvent(index));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CategoryProductWidget(
                        products: [
                          ProductCardWidget(
                            imageProvider: CachedNetworkImageProvider(
                                "https://m.media-amazon.com/images/I/51Sn5X2gfaL._SL1500_.jpg"),
                          ),
                          ProductCardWidget(
                            imageProvider: CachedNetworkImageProvider(
                                "https://m.media-amazon.com/images/I/51Sn5X2gfaL._SL1500_.jpg"),
                          ),
                          ProductCardWidget(
                            imageProvider: CachedNetworkImageProvider(
                                "https://m.media-amazon.com/images/I/51Sn5X2gfaL._SL1500_.jpg"),
                          ),
                          ProductCardWidget(
                            imageProvider: CachedNetworkImageProvider(
                                "https://m.media-amazon.com/images/I/51Sn5X2gfaL._SL1500_.jpg"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }
      return const HomeLoadingSkeleton();
    },
  );
}
