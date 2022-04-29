import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final premiumBannerStory = Story(
  name: 'Widgets/Premium Banner',
  builder: (BuildContext context) {
    final bannerPosition = context.knobs.options<IllustrationPosition>(
      label: 'Illustration Position',
      initial: IllustrationPosition.right,
      options: const [
        Option(label: 'Left', value: IllustrationPosition.left),
        Option(label: 'Right', value: IllustrationPosition.right),
      ],
    );

    return Center(
      child: PremmiumBanner(
        title: 'Expresse todos os humores',
        illustrationPosition: bannerPosition,
        message:
            'Com Tracky Premium você tem acesso a  + de 300 emojis incríveis!',
        illustration: SvgPicture.asset(
          'assets/illustrations/emoji_banner.svg',
        ),
        onTap: () => {},
      ),
    );
  },
);
