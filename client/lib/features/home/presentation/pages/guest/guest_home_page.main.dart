part of "guest_home_page.dart";

Widget _buildHome(BuildContext context) {
  return BlocBuilder<HomeProductBloc, HomeProductState>(
      builder: (context, state) {
    if (state is HomeProductErrorState) {
      return Text(state.error);
    }
    if (state is HomeProductDoneState) {
      return Column(
        children: [
          _buildAppBar(),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSearchBar(),
                    const SizedBox(height: 10),
                    const TitledTextWidget().withTextButton(
                      context,
                      title: "Categories",
                      buttonLabel: "See all",
                      onTap: () {},
                    ),
                    TabSelectorWidget(
                      titles: state.categories ?? [],
                      index: state.index ?? 0,
                      onTap: (int index) {
                        sl<HomeProductBloc>()
                            .add(HomeProductPageUpdateEvent(index: index));
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CategoryProductWidget(
                        products: List.generate(
                      state.products!.length,
                      (index) {
                        final product = state.products![index];
                        return ProductCardWidget(
                          imageProvider: const CachedNetworkImageProvider(
                            "https://m.media-amazon.com/images/I/81dT7CUY6GL._SL1500_.jpg",
                          ),
                          name: product.name!,
                          price: product.price!,
                        );
                      },
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  });
}

SearchBarWidget _buildSearchBar() {
  return SearchBarWidget(
    onTap: () {
      sl<NavigationBarBloc>().add(const NavigationBarChangeIndexEvent(1));
    },
  );
}

HomeAppBarWidget _buildAppBar() {
  return HomeAppBarWidget(
    title: "Discover",
    actions: [
      BorderIconButton(
        tooltip: "Saved Products",
        icon: Icon(UIcons.regularRounded.shopping_bag),
        onPressed: () {},
      )
    ],
  );
}
