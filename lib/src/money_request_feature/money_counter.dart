import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.remove_circle_rounded,
              size: 45,
            ),
            color: AppColors.darkGrey,
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
                    FilteringTextInputFormatter.deny(RegExp('^0+'))
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
                        const Text(
                          r'$',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${double.tryParse(controller.text) ?? 0}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
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
            color: AppColors.darkGrey,
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
