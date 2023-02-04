import 'package:digi_wallet_prototype/src/auth/profile_scanner.dart';
import 'package:digi_wallet_prototype/src/home/home_view.dart';
import 'package:digi_wallet_prototype/src/shared/components/app_bar.dart';
import 'package:digi_wallet_prototype/src/shared/components/main_button.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class SetupFaceView extends StatefulWidget {
  const SetupFaceView({super.key});

  @override
  State<SetupFaceView> createState() => _SetupFaceViewState();
}

class _SetupFaceViewState extends State<SetupFaceView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final bool _animationStopped = false;
  String scanText = 'Scan';
  bool scanning = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animateScanAnimation(reverse: true);
        } else if (status == AnimationStatus.dismissed) {
          animateScanAnimation(reverse: false);
        }
      })
      ..forward(from: 0); // add this line

    super.initState();
  }

  void animateScanAnimation({required bool reverse}) {
    if (reverse) {
      _animationController.reverse(from: 1);
    } else {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            //description
            Column(
              children: [
                Text(
                  'Profile Verification',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: AppColors.black900),
                ),
                const SizedBox(height: 20),
                Text(
                  'Unlock all features by verifying your identity',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // scanner+
            ClipOval(
              child: ProfileScanner(
                height: size.width / 1.6,
                width: size.width / 1.6,
                animationStopped: _animationStopped,
                animationController: _animationController,
              ),
            ),
            const SizedBox(height: 75),

            //button
            MainButton(
              buttonWidget: Text(
                'Continue',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.white),
              ),
              buttonFunction: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const HomeView(),
                ),
              ),
              size: Size(size.width, 66),
            ),
          ],
        ),
      ),
    );
  }
}
