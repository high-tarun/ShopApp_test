import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreenBloc extends Cubit<UIState> {
  BehaviorSubject<HomePageTab> bottomNavState =
      BehaviorSubject<HomePageTab>.seeded(HomePageTab.home);
  HomeScreenBloc() : super(UIState.loaded);
}

enum HomePageTab {
  home,
  product,
  favourites,
  profile,
}

enum UIState {
  loading,
  loaded,
  error,
}
