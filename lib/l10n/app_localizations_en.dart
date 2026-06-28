// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get cart => 'Cart';

  @override
  String get newLaptops => 'New Laptops';

  @override
  String get addToCart => 'Add To Cart';

  @override
  String get noFavorites => 'No Favorites';

  @override
  String get emptyCart => 'Empty Cart';

  @override
  String get checkout => 'Check out';

  @override
  String get total => 'Total';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get start => 'Get Started';

  @override
  String get settings => 'Settings';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get language => 'Language';

  @override
  String get successSnackbarTitle => 'Hooray';

  @override
  String get successSnackbarMessage =>
      'has been added to your cart successfully';

  @override
  String get faildSnackbarTitle => 'Sorry';

  @override
  String get faildSnackbarMessage =>
      'We can not handle this process now, please try again later';
}
