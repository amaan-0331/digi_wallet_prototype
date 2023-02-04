import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_shadow/simple_shadow.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SimpleShadow(
          opacity: 0.2,
          offset: const Offset(0, 2),
          sigma: 3,
          child: SvgPicture.asset(
            'assets/illustrations/bottombar_background.svg',
            width: width,
            clipBehavior: Clip.antiAlias,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.asset('assets/icons/home.svg'),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset('assets/icons/chart.svg'),
                onPressed: () {},
              ),
              const SizedBox(),
              IconButton(
                icon: SvgPicture.asset('assets/icons/graph.svg'),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset('assets/icons/profile.svg'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
