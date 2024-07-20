import 'package:flutter/material.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/cache/cache_helper.dart';
import 'package:bookstore/main.dart';
import 'package:bookstore/core/services/service_locator.dart';

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  final List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
  ];

  late CacheHelper cacheHelper;
  late Locale _selectedLocale;

  @override
  void initState() {
    super.initState();
    cacheHelper = getIt<CacheHelper>();
    String? savedLocale = cacheHelper.getLocale();
    _selectedLocale =
        savedLocale != null ? Locale(savedLocale) : const Locale('en', 'US');
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _selectedLocale = locale;
      S.load(locale);
      BookStore.setLocale(context, locale);
      cacheHelper.saveLocale(locale.languageCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: 'en' == _selectedLocale.languageCode
          ? const Locale('en')
          : const Locale('ar'),
      items: supportedLocales.map<DropdownMenuItem<Locale>>((Locale locale) {
        return DropdownMenuItem<Locale>(
            value: locale,
            child: Text(
              locale.languageCode == 'en' ? 'English' : 'العربية',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ));
      }).toList(),
      onChanged: (Locale? newValue) {
        if (newValue != null) {
          _changeLanguage(newValue);
        }
      },
    );
  }
}
