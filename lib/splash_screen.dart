import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  MySplashScreenState createState() => MySplashScreenState();
}

class MySplashScreenState extends State<MySplashScreen>
    with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  bool startNameAnimation = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        Tween<double>(begin: 30, end: 100).animate(animationController!);
    animationController!
        .forward()
        .whenComplete(() => {
              setState(() {
                // startNameAnimation = true;
              })
            })
        .whenComplete(() => checkPermission());
    //startTimer();
  }

  checkPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Center(
                child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  tween: Tween<double>(begin: 30, end: 100),
                  duration: const Duration(seconds: 3),
                  builder: (BuildContext context, double value, Widget? child) {
                    return SizedBox(
                        width: 300.0,
                        height: 150.0,
                        child: Container(
                          //height: MediaQuery.of(context).size.height / 2,
                          // width: MediaQuery
                          //     .of(context)
                          //     .size
                          //     .width * .7,
                          margin: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/newsicon.png'),
                            ),
                          ),
                        ));
                  },
                ),
              ),
              Center(
                child: TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  tween: Tween<double>(begin: 30, end: 100),
                  duration: const Duration(seconds: 3),
                  builder: (BuildContext context, double value, Widget? child) {
                    return SizedBox(
                      width: 300.0,
                      height: 150.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.transparent,
                        highlightColor: Colors.yellow[300]!,
                        child: Container(
                          //height: MediaQuery.of(context).size.height / 2,
                          // width: MediaQuery
                          //     .of(context)
                          //     .size
                          //     .width * .7,
                          margin: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/newsicon.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                    ;
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .55,
                //left: MediaQuery.of(context).size.width * .2,
                //right: MediaQuery.of(context).size.width * .2,
                left: 0,
                right: 0,
                child: const SizedBox(
                  width: 200.0,
                  height: 100.0,
                  // child: Shimmer.fromColors(
                  //   baseColor: Colors.white,
                  //   highlightColor: Colors.yellow[300]!,
                  child: Text(
                    'NewsHub',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ),
                ),
              ),
              startNameAnimation
                  ? Positioned(
                      top: MediaQuery.of(context).size.height * .5,
                      //left: MediaQuery.of(context).size.width * .2,
                      //right: MediaQuery.of(context).size.width * .2,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              "Parksmen",
                              textStyle: const TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
          // : Center(
          //     child: showCircularProgress(
          //       true,
          //       primary,
          //     ),
          //   ),
          ),
    );
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
}
