import 'package:flutter/material.dart';

import '../card/fixed_card.dart';
import '../utils/app_spacers.dart';

enum IllustrationPosition {
  left,
  right,
}

class PremmiumBanner extends StatelessWidget {
  const PremmiumBanner({
    Key? key,
    required this.title,
    required this.message,
    required this.illustration,
    required this.onTap,
    this.illustrationPosition = IllustrationPosition.right,
    this.radius = 12,
  }) : super(key: key);

  final String title;
  final String message;
  final Widget illustration;
  final VoidCallback onTap;
  final IllustrationPosition illustrationPosition;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return FixedCard(
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (illustrationPosition == IllustrationPosition.left)
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: illustration,
                  ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                        SpacerHeight8,
                        Text(
                          message,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 12,
                                    height: 1.25,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (illustrationPosition == IllustrationPosition.right)
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: illustration,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
