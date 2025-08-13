import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawelty_app/Features/explore/cubits/ui_component/ui_component_state.dart';
import 'package:tawelty_app/Features/explore/widgets/ui/ui_food_kind.dart';
import 'package:tawelty_app/Features/explore/widgets/ui/ui_near_restaurant.dart';
import 'package:tawelty_app/Features/explore/widgets/ui/ui_opportunity.dart';

class UiComponentCubit extends Cubit<UiComponentState> {
  UiComponentCubit() : super(UiComponentState(ui: Container()));
  uiComponentResturant() {
    emit(UiComponentResturant(ui: UiNearRestaurant()));
  }

  uiComponentKindFood() {
    emit(UiComponentKindFood(ui: UiFoodKind()));
  }

  uiComponentOpportunity() {
    emit(UiComponentOpportunity(ui: UiOpportunity()));
  }
}
