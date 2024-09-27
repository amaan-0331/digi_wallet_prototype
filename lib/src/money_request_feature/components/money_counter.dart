import 'package:digi_wallet_prototype/src/settings/settings_controller.dart';
import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MoneyCounter extends StatefulWidget {
  const MoneyCounter({super.key});

  @override
  State<MoneyCounter> createState() => _MoneyCounterState();
}

class _MoneyCounterState extends State<MoneyCounter> {
  final controller = TextEditingController(text: '0');
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<SettingsController>(context).themeMode;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: BoxDecoration(
        color: currentTheme == ThemeMode.dark
            ? AppColors.blackCharcoal
            : AppColors.whiteGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove_circle_rounded,
              size: 45,
            ),
            color: currentTheme == ThemeMode.dark
                ? AppColors.lightGrey
                : AppColors.darkGrey.withOpacity(0.5),
            onPressed: decreaseValue,
          ),
          Expanded(
            child: Stack(
              children: [
                EditableText(
                  expands: true,
                  maxLines: null,
                  controller: controller,
                  focusNode: focusNode,
                  style: const TextStyle(
                    color: Colors.transparent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.number,
                  showCursor: false,
                  onChanged: (value) => setState(() {}),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
                    FilteringTextInputFormatter.deny(RegExp('^0+')),
                  ],
                  backgroundCursorColor: Colors.transparent,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: focusNode.requestFocus,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          r'$',
                          style: TextStyle(
                            fontSize: 30,
                            color: currentTheme == ThemeMode.dark
                                ? AppColors.white
                                : AppColors.black900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${double.tryParse(controller.text) ?? 0}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: currentTheme == ThemeMode.dark
                                ? AppColors.white
                                : AppColors.black900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_rounded,
              size: 45,
            ),
            color: currentTheme == ThemeMode.dark
                ? AppColors.lightGrey
                : AppColors.darkGrey.withOpacity(0.5),
            onPressed: increaseValue,
          ),
        ],
      ),
    );
  }

  void increaseValue() {
    FocusManager.instance.primaryFocus?.unfocus();
    var value = int.tryParse(controller.text) ?? 0;
    if (value < 99999) value++;

    controller.text = '$value';
    setState(() {});
  }

  void decreaseValue() {
    FocusManager.instance.primaryFocus?.unfocus();
    var value = int.tryParse(controller.text) ?? 0;
    if (value > 0) value--;

    controller.text = '$value';
    setState(() {});
  }
}
