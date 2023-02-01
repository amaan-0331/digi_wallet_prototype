import 'package:digi_wallet_prototype/src/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormTextInput extends StatelessWidget {
  const FormTextInput({
    super.key,
    required this.labelText,
    required this.iconLocation,
    this.hintText,
    this.inputController,
    this.inputType,
    this.inputAction,
    this.validatorFunc,
    this.obscure = false,
    this.trailing,
  });
  final String labelText;
  final String? hintText;
  final TextEditingController? inputController;
  final String? Function(String?)? validatorFunc;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final bool obscure;
  final Widget? trailing;
  final String iconLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //label
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppColors.darkGrey),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 8),

        //
        Container(
          height: 66,
          decoration: BoxDecoration(
            border: const Border.fromBorderSide(
              BorderSide(
                color: AppColors.lightGrey,
              ),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Center(
            child: TextFormField(
              textInputAction: inputAction,
              validator: validatorFunc,
              obscureText: obscure,
              keyboardType: inputType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: inputController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(iconLocation),
                ),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
