import 'package:flutter/material.dart';
import 'package:onboarding/helpers/utils.dart';
import 'package:onboarding/models/onboarding_content.dart';
import 'package:onboarding/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingContent> _content = CustomUtils.getOnboardingContent();
  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      pageIndex = page;
                    });
                  },
                  children: List.generate(
                    _content.length,
                    (index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 40,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_content[index].url),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _content[index].description,
                              style: const TextStyle(
                                fontSize: 28,
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Visibility(
                              visible: index < _content.length - 1,
                              child: CustomButton(
                                backgroundColor: const Color(0xff0a5cd7),
                                textColor: Colors.white,
                                text: "Далее",
                                onTap: () {
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                              ),
                            ),
                            Visibility(
                              visible: index == _content.length - 1,
                              child: Column(
                                children: [
                                  CustomButton(
                                      textColor: const Color(0xff0a5cd7),
                                      backgroundColor: Colors.white,
                                      text: 'Войти',
                                      onTap: () {}),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  CustomButton(
                                    backgroundColor: const Color(0xff0a5cd7),
                                    textColor: Colors.white,
                                    text: "Зарегистрироваться",
                                    onTap: () {
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _content.length,
                (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    height: 2,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: index == pageIndex ? Colors.white : Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
