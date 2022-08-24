abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBarState extends NewsStates {}

class NewsLoadingBusinessState extends NewsStates {}

class NewsGetBusinessDataSuccessState extends NewsStates {}

class NewsGetBusinessDataErrorState extends NewsStates {
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsLoadingSportState extends NewsStates {}

class NewsGetSportDataSuccessState extends NewsStates {}

class NewsGetSportDataErrorState extends NewsStates {
  final String error;

  NewsGetSportDataErrorState(this.error);
}

class NewsLoadingScienceState extends NewsStates {}

class NewsGetScienceDataSuccessState extends NewsStates {}

class NewsGetScienceDataErrorState extends NewsStates {
  final String error;

  NewsGetScienceDataErrorState(this.error);
}

class NewsChangeThemeState extends NewsStates {}

class NewsChangeIconThemeState extends NewsStates {}
