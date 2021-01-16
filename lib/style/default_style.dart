import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo.dart';

class DefaultStyle {
  static Color get blue => newStyle?.blue ?? Color(0xff007bff);
  static Color get indigo => newStyle?.indigo ?? Color(0xff6610f2);
  static Color get purple => newStyle?.purple ?? Color(0xff6f42c1);
  static Color get pink => newStyle?.pink ?? Color(0xffe83e8c);
  static Color get red => newStyle?.red ?? Color(0xffff0045);
  static Color get orange => newStyle?.orange ?? Color(0xfffd7e14);
  static Color get yellow => newStyle?.yellow ?? Color(0xffffc107);
  static Color get green => newStyle?.green ?? Color(0xff28a745);
  static Color get teal => newStyle?.teal ?? Color(0xff20c997);
  static Color get cyan => newStyle?.cyan ?? Color(0xff17a2b8);
  static Color get white => newStyle?.white ?? Color(0xffffffff);
  static Color get black => newStyle?.black ?? Color(0xff000000);

  static Color get gray1 => newStyle?.gray1 ?? Color(0xfffafafa);
  static Color get gray2 => newStyle?.gray2 ?? Color(0xfff5f5f5);
  static Color get gray3 => newStyle?.gray3 ?? Color(0xffeeeeee);
  static Color get gray4 => newStyle?.gray4 ?? Color(0xffe0e0e0);
  static Color get gray5 => newStyle?.gray5 ?? Color(0xffbdbdbd);
  static Color get gray6 => newStyle?.gray6 ?? Color(0xffe9e9e9);

  static Color get pageBackground => newStyle?.pageBackground ?? Colors.grey[100];
  static Color get textColorPrimary => newStyle?.textColorPrimary ?? Color(0xff333333);
  static Color get textColorSecondary => newStyle?.textColorSecondary ?? Colors.black54;
  static Color get maskColor => newStyle?.maskColor ?? Colors.black26;

  static Color get lineColor => newStyle?.lineColor ?? Color(0x1F000000); //isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);
  static double get lineWidth => newStyle?.lineWidth ?? 0.5;

  ///主色Color
  static Color get primary => newStyle?.primary ?? Color(0xffFFC300);
  static Color get success => newStyle?.success ?? green;
  static Color get info => newStyle?.info ?? cyan;
  static Color get warning => newStyle?.warning ?? yellow;
  static Color get danger => newStyle?.danger ?? red;

  static double get fontSizeXLarge => newStyle?.fontSizeXLarge ?? 18.0;
  static double get fontSizeLarge => newStyle?.fontSizeLarge ?? 16.0;
  static double get fontSizeNormal => newStyle?.fontSizeNormal ?? 14;
  static double get fontSizeSmall => newStyle?.fontSizeSmall ?? 12;
  static double get fontSizeXSmall => newStyle?.fontSizeXSmall ?? 10.0;
  static double get fontSizeXXSmall => newStyle?.fontSizeXXSmall ?? 8.0;
  static FontWeight get fontSizeBold => newStyle?.fontSizeBold ?? FontWeight.w500;

  static double get intervalBase => newStyle?.intervalBase ?? 2.0;
  static double get intervalXLarge => newStyle?.intervalXLarge ?? intervalBase * 8;
  static double get intervalLarge => newStyle?.intervalLarge ?? intervalBase * 6;
  static double get intervalNormal => newStyle?.intervalNormal ?? intervalBase * 5;
  static double get intervalSmall => newStyle?.intervalSmall ?? intervalBase * 3;
  static double get intervalXSmall => newStyle?.intervalXSmall ?? intervalBase * 2;

  static double get radiusMax => newStyle?.radiusMax ?? 999.0;
  static double get radiusXLarge => newStyle?.radiusXLarge ?? 16.0;
  static double get radiusLarge => newStyle?.radiusLarge ?? 10.0;
  static double get radiusNormal => newStyle?.radiusNormal ?? 6.0;
  static double get radiusSmall => newStyle?.radiusSmall ?? 4.0;
  static double get radiusXSmall => newStyle?.radiusXSmall ?? 2.0;

  static Duration get animationDurationNormal => newStyle?.animationDurationNormal ?? Duration(milliseconds: 500);
  static Duration get animationDurationFast => newStyle?.animationDurationFast ?? Duration(milliseconds: 300);
  static Duration get animationDurationSlow => newStyle?.animationDurationSlow ?? Duration(milliseconds: 1000);

  static BoxShadow get boxShadow => newStyle?.boxShadow ?? BoxShadow(color: Colors.black38, blurRadius: 3.0, spreadRadius: 0, offset: Offset(0, 0));

  static Color get imagePlaceHolderBackground => newStyle?.imagePlaceHolderBackground ?? pageBackground;

  static double get appBarSpace => newStyle?.appBarSpace ?? intervalXLarge;
  static Color get appBarBackground => newStyle?.appBarBackground ?? primary;
  static double get appBarLeadingSize => newStyle?.appBarLeadingSize ?? 24.0;
  static Color get appBarLeadingCorlor => newStyle?.appBarLeadingCorlor ?? white;
  static TextStyle get appBarTitleTextStyle => newStyle?.appBarTitleTextStyle ?? TextStyle(fontSize: fontSizeXLarge, fontWeight: fontSizeBold, color: white);
  static TextStyle get appBarActionTextStyle => newStyle?.appBarActionTextStyle ?? TextStyle(fontSize: fontSizeNormal, color: white);
  static double get appBarActionIconSize => newStyle?.appBarActionIconSize ?? 24.0;
  static Color get appBarActionIconColor => newStyle?.appBarActionIconColor ?? white;
  static double get appBarActionSpace => newStyle?.appBarActionSpace ?? intervalNormal;

  static TextStyle get iTabsActiveTitleStyle => newStyle?.iTabsActiveTitleStyle ?? TextStyle(fontSize: fontSizeLarge, color: textColorPrimary);
  static TextStyle get iTabsInActiveTitleStyle => newStyle?.iTabsInActiveTitleStyle ?? TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  static TextStyle get iTabsActiveSubTitleStyle => newStyle?.iTabsActiveSubTitleStyle ?? TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  static TextStyle get iTabsinActiveSubTitleStyle => newStyle?.iTabsinActiveSubTitleStyle ?? TextStyle(fontSize: fontSizeSmall, color: textColorSecondary);
  static double get iTabsIndicatorHeight => newStyle?.iTabsIndicatorHeight ?? 5.0;
  static double get iTabsIndicatorWidth => newStyle?.iTabsIndicatorWidth ?? 16;
  static Color get iTabsIndicatorColor => newStyle?.iTabsIndicatorColor ?? DefaultStyle.primary;
  static double get iTabsIndicatorSpace => newStyle?.iTabsIndicatorSpace ?? intervalBase;
  static double get iTabsItemSpace => newStyle?.iTabsItemSpace ?? intervalNormal * 2;
  static EdgeInsetsGeometry get iTabsPadding =>
      newStyle?.iTabsPadding ?? EdgeInsets.fromLTRB(DefaultStyle.intervalNormal, DefaultStyle.intervalNormal, DefaultStyle.intervalNormal, DefaultStyle.intervalSmall);

  static EdgeInsetsGeometry get iTabsMargin => newStyle?.iTabsMargin ?? EdgeInsets.all(0.0);
  static Color get iTabsBackground => newStyle?.iTabsBackground ?? white;

  static double get iconTextIconSize => newStyle?.iconTextIconSize ?? 22.0;
  static Color get iconTextIconColor => newStyle?.iconTextIconColor ?? textColorSecondary;
  static TextStyle get iconTextTitleStyle => newStyle?.iconTextTitleStyle ?? TextStyle(fontSize: fontSizeXSmall, color: textColorSecondary);

  static double get itextfieldLabelWidth => newStyle?.itextfieldLabelWidth ?? 80.0;
  static Color get itextfieldLabelColor => newStyle?.itextfieldLabelColor ?? black;
  static double get itextfieldFontSize => newStyle?.itextfieldFontSize ?? fontSizeNormal;
  static Color get itextfieldRequiredColor => newStyle?.itextfieldRequiredColor ?? red;
  static Color get itextfieldErrorTextColor => newStyle?.itextfieldErrorTextColor ?? red;
  static Color get itextfieldDisabledTextColor => newStyle?.itextfieldDisabledTextColor ?? gray3;
  static Color get itextfieldTextColor => newStyle?.itextfieldTextColor ?? Colors.black;
  static Color get itextfieldPlaceHolderColor => newStyle?.itextfieldPlaceHolderColor ?? gray5;
  static double get itextfieldErrorMessageFontSize => newStyle?.itextfieldErrorMessageFontSize ?? fontSizeSmall;
  static EdgeInsets get itextfieldContentPadding => newStyle?.itextfieldContentPadding ?? EdgeInsets.only(top: intervalBase);
  static double get itextfieldCursorWidth => newStyle?.itextfieldCursorWidth ?? 1.0;
  static Color get itextfieldRightIconColor => newStyle?.itextfieldRightIconColor ?? gray3;
  static double get itextfieldRightIconSize => newStyle?.itextfieldRightIconSize ?? fontSizeLarge;
  static Color get itextfieldClearIconColor => newStyle?.itextfieldClearIconColor ?? gray4;
  static double get itextfieldClearIconSize => newStyle?.itextfieldClearIconSize ?? fontSizeLarge;
  static Color get itextfieldBackgroundColor => newStyle?.itextfieldBackgroundColor ?? white;
  static EdgeInsets get itextfieldPadding => newStyle?.itextfieldPadding ?? EdgeInsets.symmetric(horizontal: intervalXLarge, vertical: intervalXLarge);

  static Color get cellBackgroundColor => newStyle?.cellBackgroundColor ?? white;
  static Color get cellTrailingIconColor => newStyle?.cellTrailingIconColor ?? gray5;
  static double get cellTrailingIconSize => newStyle?.cellTrailingIconSize ?? fontSizeLarge;
  static double get cellLabelWidth => newStyle?.cellLabelWidth ?? 80.0;

  ///button
  static double get buttonSizeWidthXLarge => newStyle?.buttonSizeWidthXLarge ?? 256;
  static double get buttonSizeWidthLarge => newStyle?.buttonSizeWidthLarge ?? 128;
  static double get buttonSizeWidthNormal => newStyle?.buttonSizeWidthNormal ?? 96;
  static double get buttonSizeWidthSmall => newStyle?.buttonSizeWidthSmall ?? 64;
  static double get buttonSizeWidthXSmall => newStyle?.buttonSizeWidthXSmall ?? 48;
  static double get buttonSizeHeightXLarge => newStyle?.buttonSizeHeightXLarge ?? 54;
  static double get buttonSizeHeightLarge => newStyle?.buttonSizeHeightLarge ?? 48;
  static double get buttonSizeHeightNormal => newStyle?.buttonSizeHeightNormal ?? 36;
  static double get buttonSizeHeightSmall => newStyle?.buttonSizeHeightSmall ?? 24;
  static double get buttonSizeHeightXSmall => newStyle?.buttonSizeHeightXSmall ?? 18;
  static Color get buttonBackground => newStyle?.buttonBackground ?? blue;
  static Color get buttonDisabledBackground => newStyle?.buttonDisabledBackground ?? gray3;
  static Color get buttonCaptionColor => newStyle?.buttonCaptionColor ?? white;
  static Color get buttonDisabledCaptionColor => newStyle?.buttonDisabledCaptionColor ?? black;

  static Color get itagBackground => newStyle?.itagBackground ?? Color(0xffF2EDFE);
  static Color get itagCaptionColor => newStyle?.itagCaptionColor ?? Color(0xff6F4CF9);

  static double get iPickerItemHeight => newStyle?.iPickerItemHeight ?? 36.0;
  static double get iPickerHeight => newStyle?.iPickerHeight ?? 200.0;
}
