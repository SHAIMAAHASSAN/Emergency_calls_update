// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Emergency Calls App`
  String get emergencyCallsApp {
    return Intl.message(
      'Emergency Calls App',
      name: 'emergencyCallsApp',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Calls`
  String get emergencyCalls {
    return Intl.message(
      'Emergency Calls',
      name: 'emergencyCalls',
      desc: '',
      args: [],
    );
  }

  /// `Request Call`
  String get requestCall {
    return Intl.message(
      'Request Call',
      name: 'requestCall',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get serviceName {
    return Intl.message(
      'Service Name',
      name: 'serviceName',
      desc: '',
      args: [],
    );
  }

  /// `Ambulance`
  String get ambulance {
    return Intl.message(
      'Ambulance',
      name: 'ambulance',
      desc: '',
      args: [],
    );
  }

  /// `Police`
  String get police {
    return Intl.message(
      'Police',
      name: 'police',
      desc: '',
      args: [],
    );
  }

  /// `Fire Department`
  String get fireDepartment {
    return Intl.message(
      'Fire Department',
      name: 'fireDepartment',
      desc: '',
      args: [],
    );
  }

  /// `Electricity Emergency`
  String get electricityEmergency {
    return Intl.message(
      'Electricity Emergency',
      name: 'electricityEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Natural Gas Emergency`
  String get naturalGasEmergency {
    return Intl.message(
      'Natural Gas Emergency',
      name: 'naturalGasEmergency',
      desc: '',
      args: [],
    );
  }

  /// `Road Rescue`
  String get roadRescue {
    return Intl.message(
      'Road Rescue',
      name: 'roadRescue',
      desc: '',
      args: [],
    );
  }

  /// `Anti-Drugs`
  String get antiDrugs {
    return Intl.message(
      'Anti-Drugs',
      name: 'antiDrugs',
      desc: '',
      args: [],
    );
  }

  /// ` The National Council for Women `
  String get theNationalCouncilforWomen {
    return Intl.message(
      ' The National Council for Women ',
      name: 'theNationalCouncilforWomen',
      desc: '',
      args: [],
    );
  }

  /// `Water Complains`
  String get waterComplains {
    return Intl.message(
      'Water Complains',
      name: 'waterComplains',
      desc: '',
      args: [],
    );
  }

  /// `Covid 19`
  String get covid19 {
    return Intl.message(
      'Covid 19',
      name: 'covid19',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Total Requests`
  String get totalRequests {
    return Intl.message(
      'Total Requests',
      name: 'totalRequests',
      desc: '',
      args: [],
    );
  }

  /// `Requests`
  String get requests {
    return Intl.message(
      'Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
