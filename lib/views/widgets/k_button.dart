import 'package:flutter/material.dart';
import 'package:listify/views/styles/styles.dart';

class _KButton extends StatelessWidget {
  _KButton({
    @required this.child,
    @required this.onPressed,
    this.backgroundColor = KColors.primary,
    this.height = 50,
    this.width = double.infinity,
    this.border,
  })  : assert(child != null),
        assert(onPressed != null);

  final Widget child;
  final Color backgroundColor;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Border border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
        ),
        child: child,
      ),
    );
  }
}

class KFilledButton extends _KButton {
  KFilledButton({
    @required String buttonText,
    @required VoidCallback onPressed,
    Color buttonColor = KColors.primary,
  })  : assert(buttonText != null),
        assert(onPressed != null),
        super(
          child: Center(
            child: Text(
              buttonText,
              style: KTextStyle.buttonText().copyWith(color: KColors.white),
            ),
          ),
          onPressed: onPressed,
          backgroundColor: buttonColor,
          height: KSize.getHeight(84),
        );

  KFilledButton.iconText({
    @required IconData icon,
    @required String buttonText,
    @required VoidCallback onPressed,
    Color buttonColor = KColors.primary,
  })  : assert(icon != null),
        assert(buttonText != null),
        assert(onPressed != null),
        super(
          child: Row(
            children: [
              SizedBox(width: KSize.getWidth(31)),
              Icon(icon, color: KColors.white),
              SizedBox(width: KSize.getWidth(24)),
              Text(
                buttonText,
                style: KTextStyle.bodyText2().copyWith(color: KColors.white),
              )
            ],
          ),
          onPressed: onPressed,
          backgroundColor: buttonColor,
          height: KSize.getHeight(84),
        );
}

class KOutlinedButton extends _KButton {
  KOutlinedButton({
    @required String buttonText,
    @required VoidCallback onPressed,
    TextStyle textStyle,
    Color borderColor,
  })  : assert(buttonText != null),
        super(
          child: Center(
            child: Text(
              buttonText,
              style: textStyle ??
                  KTextStyle.buttonText(fontWeight: FontWeight.w500),
            ),
          ),
          onPressed: onPressed,
          backgroundColor: KColors.transparent,
          height: KSize.getHeight(84),
          border: Border.all(
            color: borderColor == null
                ? KTheme.darkMode()
                    ? KColors.white
                    : KColors.charcoal
                : borderColor,
          ),
        );

  KOutlinedButton.iconText({
    @required String buttonText,
    VoidCallback onPressed,
    String assetIcon,
  })  : assert(buttonText != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: KSize.getHeight(34),
                width: KSize.getWidth(34),
                child: Image.asset(assetIcon),
              ),
              SizedBox(width: KSize.getWidth(22)),
              Text(
                buttonText,
                style: KTextStyle.buttonText(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          onPressed: onPressed ?? () {},
          backgroundColor: KColors.transparent,
          height: KSize.getHeight(84),
          border: Border.all(
            color: KTheme.darkMode() ? KColors.white : KColors.charcoal,
          ),
        );
}

class KTextButton extends _KButton {
  KTextButton({
    @required String buttonText,
    TextStyle buttonTextStyle,
    @required VoidCallback onPressed,
    TextAlign textAlign = TextAlign.center,
  }) : super(
          child: Text(
            buttonText,
            textAlign: textAlign,
            style: buttonTextStyle ?? KTextStyle.bodyText2(),
          ),
          onPressed: onPressed,
          height: null,
          backgroundColor: KColors.transparent,
        );

  KTextButton.iconText({
    @required String buttonText,
    TextStyle buttonTextStyle,
    @required String assetIcon,
    @required VoidCallback onPressed,
  }) : super(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              children: [
                Image.asset(
                  assetIcon,
                  width: KSize.getWidth(20),
                  height: KSize.getHeight(20),
                ),
                SizedBox(width: KSize.getWidth(15)),
                Text(
                  buttonText,
                  style: buttonTextStyle ?? KTextStyle.bodyText3(),
                ),
              ],
            ),
          ),
          onPressed: onPressed,
          backgroundColor: KColors.transparent,
          height: null,
        );
}
