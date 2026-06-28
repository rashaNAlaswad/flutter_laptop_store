// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get favorites => 'المفضلة';

  @override
  String get cart => 'عربة التسوق';

  @override
  String get newLaptops => 'أحدث اللابتوبات';

  @override
  String get addToCart => 'اضافة للعربة';

  @override
  String get noFavorites => 'ليس هنالك مفضلات';

  @override
  String get emptyCart => 'عربة التسوق فارغة';

  @override
  String get checkout => 'الدفع';

  @override
  String get total => 'المجموع';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get start => 'ابدء';

  @override
  String get settings => 'الاعدادات';

  @override
  String get english => 'اللغة الانجليزية';

  @override
  String get arabic => 'اللغة العربية';

  @override
  String get language => 'اللغة';

  @override
  String get successSnackbarTitle => 'مرحا';

  @override
  String get successSnackbarMessage => 'تمت اضافته إلى السلة بنجاح';

  @override
  String get faildSnackbarTitle => 'عذرا';

  @override
  String get faildSnackbarMessage =>
      'لا يمكن القيام بهذه العملية الان, الرجاء المحاولة مرة أخرى';
}
