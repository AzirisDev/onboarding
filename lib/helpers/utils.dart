import 'package:flutter/material.dart';
import 'package:onboarding/models/onboarding_content.dart';

class CustomUtils {
  static List<OnboardingContent> getOnboardingContent() {
    return [
      OnboardingContent(
          description:
              'Более 20 видов услуг по бухгалтерии, налогообложению и учету кадров от 5 000 тенге в месяц',
          color: const Color(0xe6effe),
          url: 'https://i.pinimg.com/474x/a6/e6/22/a6e6225bb9ad1ad185392216c335de92.jpg'),
      OnboardingContent(
          description:
          'Оплата обязательных налогов:  возможность оплатить пенсионные, социальные, медицинские, подоходные налоги',
          color: const Color(0x251812),
          url: 'https://www.teahub.io/photos/full/0-3049_dark-phone-wallpaper-hd-dark-phone.jpg'),
      OnboardingContent(
          description:
          'Личный бухгалтер: \u2028\u2028ведение бухгалтерии, подготовка документов консультация по финансовым вопросам',
          color: const Color(0x020506),
          url: 'https://i.pinimg.com/originals/90/6d/a1/906da1bc16d0e1f9ccb850d5fe5a30f2.jpg'),
    ];
  }
}
