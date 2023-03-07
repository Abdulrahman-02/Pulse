import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // authentification
  {
    'styjddcc': {
      'en': 'Sign In',
      'fr': '',
    },
    'hbdefo45': {
      'en': 'Email Address',
      'fr': '',
    },
    'y94wcw8u': {
      'en': 'Enter your email...',
      'fr': '',
    },
    '644537ge': {
      'en': 'Password',
      'fr': '',
    },
    's3nw7iox': {
      'en': 'Enter your password...',
      'fr': '',
    },
    '4ekk383e': {
      'en': 'Sign In',
      'fr': '',
    },
    't7blbq5a': {
      'en': 'Forgot Password?',
      'fr': '',
    },
    'szgo8gxm': {
      'en': 'Or use a social account to login',
      'fr': '',
    },
    'w8csn8wd': {
      'en': 'Sign Up',
      'fr': '',
    },
    'w6xmw1cs': {
      'en': 'Email Address',
      'fr': '',
    },
    'e9c9u0zz': {
      'en': 'Enter your email...',
      'fr': '',
    },
    '90fi8p9v': {
      'en': 'Full Name',
      'fr': '',
    },
    't2wqjjap': {
      'en': 'Enter your full  name...',
      'fr': '',
    },
    '9ragmn9k': {
      'en': 'Password',
      'fr': '',
    },
    'vwu0h0ag': {
      'en': 'Enter your password...',
      'fr': '',
    },
    'yqn9ind0': {
      'en': 'Confirm Password',
      'fr': '',
    },
    'f1iyybcm': {
      'en': 'Enter your password...',
      'fr': '',
    },
    'd287nkwp': {
      'en': 'Create Account',
      'fr': '',
    },
    'xt9al9g9': {
      'en': 'Sign up using a social account',
      'fr': '',
    },
    'w3omlwxa': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Home
  {
    'iwx99xp8': {
      'en': 'Page Title',
      'fr': '',
    },
    'rbhcegp9': {
      'en': 'Home',
      'fr': '',
    },
  },
  // landing
  {
    '8tsmbpue': {
      'en': 'Home',
      'fr': '',
    },
  },
  // check
  {
    '6jpkpaxp': {
      'en': 'Page Title',
      'fr': '',
    },
    '0498b2z7': {
      'en': 'Home',
      'fr': '',
    },
  },
  // schedule
  {
    'd5kqssur': {
      'en': 'Page Title',
      'fr': '',
    },
    '1txhr6ch': {
      'en': 'Home',
      'fr': '',
    },
  },
  // menu
  {
    'a9fkk2m0': {
      'en': 'Page Title',
      'fr': '',
    },
    '3mc5wu6x': {
      'en': 'Home',
      'fr': '',
    },
  },
  // somebody
  {
    '8zebj0bf': {
      'en': 'Page Title',
      'fr': '',
    },
    '4vbev21z': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'kjep22eb': {
      'en': '',
      'fr': '',
    },
    '5stbzq2q': {
      'en': '',
      'fr': '',
    },
    '6pcwl1yt': {
      'en': '',
      'fr': '',
    },
    'ftdmxvwx': {
      'en': '',
      'fr': '',
    },
    'hr360b87': {
      'en': '',
      'fr': '',
    },
    'eevbteky': {
      'en': '',
      'fr': '',
    },
    'ni56kocf': {
      'en': '',
      'fr': '',
    },
    '9uywr4sh': {
      'en': '',
      'fr': '',
    },
    'zx5t3zhj': {
      'en': '',
      'fr': '',
    },
    '0ul89my3': {
      'en': '',
      'fr': '',
    },
    'fgk8ls6j': {
      'en': '',
      'fr': '',
    },
    'l2wkw2ww': {
      'en': '',
      'fr': '',
    },
    '88h48d5f': {
      'en': '',
      'fr': '',
    },
    '66tjahcl': {
      'en': '',
      'fr': '',
    },
    'p00u0c28': {
      'en': '',
      'fr': '',
    },
    'odp1kk49': {
      'en': '',
      'fr': '',
    },
    '34o7w13h': {
      'en': '',
      'fr': '',
    },
    '3b2due61': {
      'en': '',
      'fr': '',
    },
    'banc404v': {
      'en': '',
      'fr': '',
    },
    'w0rmk954': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
