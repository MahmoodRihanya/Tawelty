import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawelty_app/Features/explore/cubits/ui_component/ui_component_cubit.dart';
import 'package:tawelty_app/Features/explore/cubits/ui_component/ui_component_state.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_bottom_bar.dart';
import 'package:tawelty_app/Features/explore/widgets/customs/custom_search_bar.dart';
import 'package:tawelty_app/constants.dart';
import 'package:tawelty_app/globals.dart';

// ignore: must_be_immutable
class AllResturantView extends StatefulWidget {
  AllResturantView({super.key});

  static final String ID = 'AllView';

  @override
  State<AllResturantView> createState() => _AllResturantViewState();
}

class _AllResturantViewState extends State<AllResturantView> {
  Color foodKindColor = kgreyColor;
  Color nearResturantColor = kgreyColor;
  Color opportunityColor = kgreyColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final viewType =
        ModalRoute.of(context)!.settings.arguments as String? ?? 'near';
    switch (viewType) {
      case 'near':
        context.read<UiComponentCubit>().uiComponentResturant();
        break;
      case 'kind':
        context.read<UiComponentCubit>().uiComponentKindFood();
        break;
      case 'opportunity':
        context.read<UiComponentCubit>().uiComponentOpportunity();
        break;
      default:
        context.read<UiComponentCubit>().uiComponentResturant();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentUserLocality == ''
                  ? 'اذهب الى الخريطة لتحديد موقعك'
                  : '${currentUserLocality}',
              style: TextStyle(color: Colors.grey),
            ),
            Icon(Icons.location_on_sharp, color: kprimaryColor),
          ],
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.language, color: Colors.grey, size: 32),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: CustomSearchBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          opportunityColor = kprimaryColor;
                          nearResturantColor = kgreyColor;
                          foodKindColor = kgreyColor;
                        });
                        context
                            .read<UiComponentCubit>()
                            .uiComponentOpportunity();
                      },
                      child: Text(
                        'المناسبة',
                        style: TextStyle(color: opportunityColor, fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          opportunityColor = kgreyColor;
                          nearResturantColor = kgreyColor;
                          foodKindColor = kprimaryColor;
                        });
                        context.read<UiComponentCubit>().uiComponentKindFood();
                      },
                      child: Text(
                        'نوع الطعام',
                        style: TextStyle(color: foodKindColor, fontSize: 18),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          opportunityColor = kgreyColor;
                          nearResturantColor = kprimaryColor;
                          foodKindColor = kgreyColor;
                        });
                        context.read<UiComponentCubit>().uiComponentResturant();
                      },
                      child: Text(
                        'المطاعم القريبة',
                        style: TextStyle(
                          color: nearResturantColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<UiComponentCubit, UiComponentState>(
              builder: (context, state) {
                return Center(child: state.ui!);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
