import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

const List<Option<Color>> grayScaleColors = [
  Option(label: 'offBlack', value: AppBaseColors.offBlack),
  Option(label: 'ash', value: AppBaseColors.ash),
  Option(label: 'body', value: AppBaseColors.body),
  Option(label: 'label', value: AppBaseColors.label),
  Option(label: 'placeholder', value: AppBaseColors.placeholder),
  Option(label: 'line', value: AppBaseColors.line),
  Option(label: 'input', value: AppBaseColors.input),
  Option(label: 'background', value: AppBaseColors.background),
  Option(label: 'offWhite', value: AppBaseColors.offWhite),
];

final lightColors = [
  MaterialColor(Colors.red.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.pink.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.purple.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.deepPurple.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.indigo.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.blue.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.cyan.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.teal.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.green.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.lightGreen.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.orange.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.deepOrange.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.brown.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.grey.shade500.value, const {500: Colors.red}),
  MaterialColor(Colors.blueGrey.shade500.value, const {500: Colors.red}),
];

final darkColors = [
  MaterialColor(Colors.red.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.pink.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.purple.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.deepPurple.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.indigo.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.blue.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.cyan.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.teal.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.green.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.lightGreen.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.orange.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.deepOrange.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.brown.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.grey.shade200.value, const {500: Colors.red}),
  MaterialColor(Colors.blueGrey.shade200.value, const {500: Colors.red}),
];

defaultPallete(Brightness brightness) => brightness == Brightness.light
    ? [
        Colors.green.shade500,
        Colors.teal.shade500,
        Colors.blue.shade500,
        Colors.orange.shade500,
        Colors.red.shade500,
      ]
    : [
        Colors.green.shade200,
        Colors.teal.shade200,
        Colors.blue.shade200,
        Colors.orange.shade200,
        Colors.red.shade200,
      ];

secondPallete(Brightness brightness) => brightness == Brightness.light
    ? [
        Colors.orange.shade500,
        Colors.teal.shade500,
        Colors.purple.shade500,
        Colors.blueGrey.shade500,
        Colors.grey.shade500,
      ]
    : [
        Colors.orange.shade200,
        Colors.teal.shade200,
        Colors.purple.shade200,
        Colors.blueGrey.shade200,
        Colors.grey.shade200,
      ];

thirdPallete(Brightness brightness) => brightness == Brightness.light
    ? [
        Colors.indigo.shade500,
        Colors.blue.shade500,
        Colors.teal.shade500,
        Colors.lightGreen.shade500,
        Colors.orange.shade500,
      ]
    : [
        Colors.indigo.shade200,
        Colors.blue.shade200,
        Colors.teal.shade200,
        Colors.lightGreen.shade200,
        Colors.orange.shade200,
      ];

fourthPallete(Brightness brightness) => brightness == Brightness.light
    ? [
        Colors.purple.shade500,
        Colors.pink.shade500,
        Colors.orange.shade500,
        Colors.yellow.shade500,
        Colors.lightGreen.shade500,
      ]
    : [
        Colors.purple.shade200,
        Colors.pink.shade200,
        Colors.orange.shade200,
        Colors.yellow.shade200,
        Colors.lightGreen.shade200,
      ];
