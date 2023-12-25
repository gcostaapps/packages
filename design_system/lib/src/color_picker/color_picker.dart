// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'circle_color.dart';

const List<ColorSwatch> materialColors = <ColorSwatch>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey
];

const List<ColorSwatch> accentColors = <ColorSwatch>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.yellowAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
];

const List<ColorSwatch> fullMaterialColors = <ColorSwatch>[
  ColorSwatch(0xFFFFFFFF, {500: Colors.white}),
  ColorSwatch(0xFF000000, {500: Colors.black}),
  Colors.red,
  Colors.redAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.purple,
  Colors.purpleAccent,
  Colors.deepPurple,
  Colors.deepPurpleAccent,
  Colors.indigo,
  Colors.indigoAccent,
  Colors.blue,
  Colors.blueAccent,
  Colors.lightBlue,
  Colors.lightBlueAccent,
  Colors.cyan,
  Colors.cyanAccent,
  Colors.teal,
  Colors.tealAccent,
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent,
  Colors.lime,
  Colors.limeAccent,
  Colors.yellow,
  Colors.yellowAccent,
  Colors.amber,
  Colors.amberAccent,
  Colors.orange,
  Colors.orangeAccent,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey
];

class ColorPicker extends StatefulWidget {
  final Color? selectedColor;
  final ValueChanged<Color>? onColorChange;
  final ValueChanged<ColorSwatch>? onMainColorChange;
  final List<ColorSwatch>? colors;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool allowShades;
  final bool onlyShadeSelection;
  final int numberOfLines;
  final double spacing;
  final IconData iconSelected;
  final VoidCallback? onBack;
  final double? elevation;
  final bool forceIconColorToThemeBrightness;

  const ColorPicker({
    super.key,
    this.selectedColor,
    this.onColorChange,
    this.onMainColorChange,
    this.colors,
    this.shrinkWrap = true,
    this.physics,
    this.allowShades = false,
    this.onlyShadeSelection = false,
    this.iconSelected = Icons.check,
    this.numberOfLines = 1,
    this.spacing = 24,
    this.onBack,
    this.elevation,
    this.forceIconColorToThemeBrightness = false,
  });

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final _defaultValue = materialColors.first;

  List<ColorSwatch> _colors = materialColors;

  late ColorSwatch _mainColor;
  late Color _shadeColor;
  late bool _isMainSelection;

  @override
  void initState() {
    super.initState();
    _initSelectedValue();
  }

  @override
  @protected
  void didUpdateWidget(covariant ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initSelectedValue();
  }

  void _initSelectedValue() {
    if (widget.colors != null) _colors = widget.colors!;

    Color shadeColor = widget.selectedColor ?? _defaultValue;
    ColorSwatch? mainColor = _findMainColor(shadeColor);

    if (mainColor == null) {
      mainColor = _colors.first;
      shadeColor = (mainColor[500] ?? mainColor[400])!;
    }

    _mainColor = mainColor;
    _shadeColor = shadeColor;
    _isMainSelection = true;
  }

  ColorSwatch? _findMainColor(Color shadeColor) {
    for (final mainColor in _colors) {
      if (_isShadeOfMain(mainColor, shadeColor)) {
        return mainColor;
      }
    }

    return (shadeColor is ColorSwatch && _colors.contains(shadeColor))
        ? shadeColor
        : null;
  }

  bool _isShadeOfMain(ColorSwatch mainColor, Color shadeColor) {
    for (final shade in _getMaterialColorShades(mainColor)) {
      if (shade == shadeColor) return true;
    }
    return false;
  }

  void _onMainColorSelected(ColorSwatch color) {
    final isShadeOfMain = _isShadeOfMain(color, _shadeColor);
    final Color? shadeColor =
        isShadeOfMain ? _shadeColor : (color[500] ?? color[400]);

    // shadeColor should not be null { Ajmal }
    if (shadeColor == null) return;
    setState(() {
      _mainColor = color;
      _shadeColor = shadeColor;
      _isMainSelection = false;
    });

    if (widget.onMainColorChange != null) widget.onMainColorChange!(color);
    if (widget.onlyShadeSelection && !_isMainSelection) {
      return;
    }
    if (widget.allowShades && widget.onColorChange != null) {
      widget.onColorChange!(shadeColor);
    }
  }

  void _onShadeColorSelected(Color color) {
    setState(() => _shadeColor = color);
    if (widget.onColorChange != null) widget.onColorChange!(color);
  }

  void _onBack() {
    setState(() => _isMainSelection = true);
    if (widget.onBack != null) widget.onBack!();
  }

  List<Color> _getMaterialColorShades(ColorSwatch color) {
    return <Color>[
      if (color[50] != null) color[50]!,
      if (color[100] != null) color[100]!,
      if (color[200] != null) color[200]!,
      if (color[300] != null) color[300]!,
      if (color[400] != null) color[400]!,
      if (color[500] != null) color[500]!,
      if (color[600] != null) color[600]!,
      if (color[700] != null) color[700]!,
      if (color[800] != null) color[800]!,
      if (color[900] != null) color[900]!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final listChildren = _isMainSelection || !widget.allowShades
        ? _colors
            .map((color) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: CircleColor(
                    color: color,
                    onColorChoose: () => _onMainColorSelected(color),
                    isSelected: _mainColor == color,
                    iconSelected: widget.iconSelected,
                    elevation: widget.elevation,
                    forceIconColorToThemeBrightness:
                        widget.forceIconColorToThemeBrightness,
                  ),
                ))
            .toList()
        : [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _onBack,
              padding: const EdgeInsets.only(right: 2.0),
            ),
            ..._getMaterialColorShades(_mainColor).map(
              (color) => CircleColor(
                color: color,
                onColorChoose: () => _onShadeColorSelected(color),
                isSelected: _shadeColor == color,
                iconSelected: widget.iconSelected,
                elevation: widget.elevation,
              ),
            )
          ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
            shrinkWrap: widget.shrinkWrap,
            physics: widget.physics,
            crossAxisSpacing: widget.spacing,
            mainAxisSpacing: widget.spacing,
            crossAxisCount: _colors.length ~/ widget.numberOfLines,
            children: listChildren,
          ),
        );
      },
    );
  }
}
