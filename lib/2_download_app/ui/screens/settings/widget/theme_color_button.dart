import 'package:flutter/material.dart';
import '../../../providers/theme_color_provider.dart';
import '../../../theme/theme.dart';

class ThemeColorButton extends StatelessWidget {
  const ThemeColorButton({
    super.key,
    required this.themeColor,
    // required this.isSelected,
    required this.onTap,
  });

  final ThemeColor themeColor;
  // final bool isSelected;
  final ValueChanged<ThemeColor> onTap;

  // BoxBorder? get border =>
  //     isSelected ? Border.all(color: AppColors.neutral, width: 6) : null;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeColorProvider,
      builder: (context, _) {
        final isSelected = themeColor == themeColorProvider.currentThemeColor;

        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () => onTap(themeColor),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: themeColor.color,
                borderRadius: BorderRadius.circular(20),
                border: isSelected ? Border.all(color: AppColors.neutral, width: 6) : null

              ),
            ),
          ),
        );
      },
    );
  }
}
