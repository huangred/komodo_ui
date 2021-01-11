import 'package:flutter/material.dart';
import 'package:komodo_ui/komodo.dart';

class DefaultStyle {
  static Color get blue => newStyle?.blue ?? Color(0xff007bff);
  static Color get indigo => Color(0xff6610f2);
  static Color get purple => Color(0xff6f42c1);
  static Color get pink => Color(0xffe83e8c);
  static Color get red => Color(0xffff0045);
  static Color get orange => Color(0xfffd7e14);
  static Color get yellow => Color(0xffffc107);
  static Color get green => Color(0xff28a745);
  static Color get teal => Color(0xff20c997);
  static Color get cyan => Color(0xff17a2b8);
  static Color get white => Color(0xffffffff);
  static Color get black => Color(0xff000000);

  static Color get gray1 => Color(0xfffafafa);
  static Color get gray2 => Color(0xfff5f5f5);
  static Color get gray3 => Color(0xffeeeeee);
  static Color get gray4 => Color(0xffe0e0e0);
  static Color get gray5 => Color(0xffbdbdbd);
  static Color get gray6 => Color(0xffe9e9e9);

  static Color get light => Color(0xfff8f9fa);
  static Color get dark => Color(0xff343a40);

  static Color get lineColor => Color(0x1F000000); //isDark ? const Color(0x1FFFFFFF) : const Color(0x1F000000);
  static double get lineWidth => 1.0;

  static Color get maskColor => Colors.black26;

  ///主色Color
  static Color get primary => Color(0xffFFC300);
  static Color get success => green;
  static Color get info => cyan;
  static Color get warning => yellow;
  static Color get danger => red;

  static Color get pageBackground => Colors.grey[100];
  static Color get barrierColor => Color(0x80000000);

  static Color get textColorPrimary => Color(0xff333333);
  static Color get textColorSecondary => Colors.black54;

  static double get fontSizeXLarge => 18.0;
  static double get fontSizeLarge => 16.0;
  static double get fontSizeNormal => 14;
  static double get fontSizeSmall => 12;
  static double get fontSizeXSmall => 10.0;
  static double get fontSizeXXSmall => 8.0;
  static FontWeight get fontSizeBold => FontWeight.w500;

  static double get intervalBase => 2.0;
  static double get intervalXLarge => intervalBase * 8;
  static double get intervalLarge => intervalBase * 6;
  static double get intervalNormal => intervalBase * 5;
  static double get intervalSmall => intervalBase * 3;
  static double get intervalXSmall => intervalBase * 2;

  static double get radiusMax => 999.0;
  static double get radiusXLarge => 16.0;
  static double get radiusLarge => 10.0;
  static double get radiusNormal => 6.0;
  static double get radiusSmall => 4.0;
  static double get radiusXSmall => 2.0;

  static Duration get animationDurationBase => Duration(milliseconds: 500);
  static Duration get animationDurationFast => Duration(milliseconds: 300);
  static Duration get animationDurationSlow => Duration(milliseconds: 1000);

  static BoxShadow get boxShadow => BoxShadow(
        color: Colors.black38,
        blurRadius: 3.0,
        spreadRadius: 0,
        offset: Offset(0, 0),
      );

  static Color get imagePlaceHolderBackground => pageBackground;

  static double get appBarSpace => intervalXLarge;
  static Color get appBarBackground => primary;
  static double get appBarLeadingSize => 24.0;
  static Color get appBarLeadingCorlor => white;
  static TextStyle get appBarTitleTextStyle =>
      TextStyle(fontSize: fontSizeXLarge, fontWeight: fontSizeBold, color: white);
  static TextStyle get appBarActionTextStyle => TextStyle(fontSize: fontSizeNormal, color: white);
  static double get appBarActionIconSize => 24.0;
  static Color get appBarActionIconColor => white;
  static double get appBarActionlSpace => intervalNormal;

  static TextStyle get iTabsActiveTitleStyle => TextStyle(fontSize: fontSizeLarge, color: textColorPrimary);
  static TextStyle get iTabsInActiveTitleStyle => TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  static TextStyle get iTabsActiveSubTitleStyle => TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  static TextStyle get iTabsinActiveSubTitleStyle => TextStyle(fontSize: fontSizeSmall, color: textColorSecondary);
  static double get iTabsIndicatorHeight => 5.0;
  static double get iTabsIndicatorWidth => 16;
  static Color get iTabsIndicatorColor => DefaultStyle.primary;
  static double get iTabsIndicatorSpace => intervalBase;
  static double get iTabsItemSpace => intervalNormal * 2;
  static EdgeInsetsGeometry get iTabsPadding => EdgeInsets.fromLTRB(DefaultStyle.intervalNormal,
      DefaultStyle.intervalNormal, DefaultStyle.intervalNormal, DefaultStyle.intervalSmall);

  static EdgeInsetsGeometry get iTabsMargin => EdgeInsets.all(0.0);
  static Color get iTabsBackground => white;

  static double get iconTextIconSize => 22.0;
  static Color get iconTextIconColor => textColorSecondary;
  static TextStyle get iconTextTitleStyle => TextStyle(fontSize: fontSizeXSmall, color: textColorSecondary);

  // static Color get imagePlaceHolderBackground => gray3;
  // static Color get imagePlaceHolderIconColor => gray4;

  // static Color get uploaderBackground => gray3;
  // static Color get uploaderIcon => gray4;

  // static Color get previewImageIconBackground => black;
  // static Color get previewImageIconColor => white;

  static double get itextfieldLabelWidth => 80.0;
  static Color get itextfieldLabelColor => black;
  static double get itextfieldFontSize => fontSizeNormal;
  static Color get itextfieldRequiredColor => red;
  static Color get itextfieldErrorTextColor => red;
  static Color get itextfieldDisabledTextColor => gray3;
  static Color get itextfieldTextColor => Colors.black;
  static Color get itextfieldTextColorDark => Colors.white;
  static Color get itextfieldPlaceHolderColor => gray5;
  static Color get itextfieldPlaceHolderColorDark => gray4;
  static double get itextfieldErrorMessageFontSize => fontSizeSmall;
  static EdgeInsets get itextfieldContentPadding => EdgeInsets.only(top: intervalBase);
  static double get itextfieldCursorWidth => 1.0;
  static Color get itextfieldRightIconColor => gray3;
  static double get itextfieldRightIconSize => fontSizeLarge;
  static Color get itextfieldClearIconColor => gray4;
  static double get itextfieldClearIconSize => fontSizeLarge;
  static Color get itextfieldBackgroundColor => white;
  static Color get itextfieldBackgroundColorDark => Color(0xff212121);
  static EdgeInsets get itextfieldPadding => EdgeInsets.symmetric(horizontal: intervalXLarge, vertical: intervalXLarge);

  // /// Picker
  // static Color get pickerBackgroundColor => white;
  // static double get pickerHeight => 260.0;
  // static double get pickerToolbarHeight => 44.0;
  // static double get pickerTitleFontSize => fontSizeLarge;
  // static EdgeInsets get pickerActionPadding => EdgeInsets.symmetric(horizontal: intervalNormal);
  // static double get pickerActionFontSize => fontSizeNormal;
  // static Color get pickerActionTextColor => blue;
  // static double get pickerOptionFontSize => fontSizeLarge;
  // static Color get pickerOptionTextColor => Colors.black;
  // static Color get pickerLoadingIconColor => blue;
  // static Color get pickerLoadingMaskColor => Colors.white70;

  // /// Checkbox
  // static double get checkboxIconSize => 18.0;
  // static Color get checkboxBackgroundColor => white;
  // static Color get checkboxBackgroundColorDisabled => gray4;
  // static Color get checkboxBackgroundColorChecked => blue;

  // static Color get checkboxBorderColor => gray4;
  // static Color get checkboxBorderColorDisabled => gray4;
  // static Color get checkboxBorderColorChecked => blue;

  // static Color get checkboxIconColor => Colors.transparent;
  // static Color get checkboxIconColorChecked => white;

  // ///Cell
  static Color get cellBackgroundColor => white;
  static Color get cellTrailingIconColor => gray5;
  static double get cellTrailingIconSize => fontSizeLarge;
  static double get cellLabelWidth => 80.0;

  ///button
  static double get buttonSizeWidthXLarge => 256;
  static double get buttonSizeWidthLarge => 128;
  static double get buttonSizeWidthNormal => 96;
  static double get buttonSizeWidthSmall => 64;
  static double get buttonSizeWidthXSmall => 48;

  static double get buttonSizeHeightXLarge => 54;
  static double get buttonSizeHeightLarge => 48;
  static double get buttonSizeHeightNormal => 36;
  static double get buttonSizeHeightSmall => 24;
  static double get buttonSizeHeightXSmall => 18;

  static Color get buttonBackground => blue;
  static Color get buttonDisabledBackground => gray3;

  static Color get buttonCaptionColor => white;
  static Color get buttonDisabledCaptionColor => black;

  static Color get itagBackground => Color(0xffF2EDFE);
  static Color get itagCaptionColor => Color(0xff6F4CF9);

  // static Color get loadingTextColor => gray4;
  // static double get loadingTextFontSize => fontSizeNormal;
  // static Color get loadingSpinnerColor => blue;
  // static Color get loadingSpinnerBackgroundColor => gray2;
  // static double get loadingSpinnerSize => 30.0;
  // static double get loadingSpinnerWidth => 2.0;
  // static Duration get loadingSpinnerAnimationDuration => Duration(milliseconds: 800);

  // static TextStyle get tabFilterActiveTitleStyle => TextStyle(fontSize: fontSizeLarge, color: textColorPrimary);
  // static TextStyle get tabFilterinActiveTitleStyle => TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  // static TextStyle get tabFilterActiveSubTitleStyle => TextStyle(fontSize: fontSizeNormal, color: textColorSecondary);
  // static TextStyle get tabFilterinActiveSubTitleStyle => TextStyle(fontSize: fontSizeSmall, color: textColorSecondary);
  // static double get tabFilterIndicatorHeight => 5.0;
  // static double get tabFilterIndicatorWidth => 16;
  // static Color get tabFilterIndicatorColor => DefaultStyle.primary;

  // static double get tabFilterIndicatorSpace => intervalBase;
  // static double get tabFilterItemSpace => intervalNormal * 2;
  // static EdgeInsetsGeometry get tabFilterPadding => EdgeInsets.only(
  //       left: DefaultStyle.intervalNormal,
  //       top: DefaultStyle.intervalNormal,
  //       right: DefaultStyle.intervalNormal,
  //       bottom: DefaultStyle.intervalSmall,
  //     );
  // static EdgeInsetsGeometry get tabFilterMargin => EdgeInsets.all(0.0);
  // static Color get tabFilterBackground => white;

  static double get iPickerItemHeight => 36.0;
  static double get iPickerHeight => 200.0;
  // // Icons
  // // https://cdn.materialdesignicons.com/5.1.45/
  // static IconData get iconSticky => IconData(0xF0403, fontFamily: 'maticons');
  // static IconData get iconUnsticky => IconData(0xF0404, fontFamily: 'maticons');
  // static IconData get iconFeatured => IconData(0xF0791, fontFamily: 'maticons');

  // static IconData get iconHeight => IconData(0xF0EFB, fontFamily: 'maticons');
  // static IconData get iconWeight => IconData(0xF05A2, fontFamily: 'maticons');
  // static IconData get iconRelation => IconData(0xF112D, fontFamily: 'maticons');
  // static IconData get iconSexOrientation => IconData(0xF029E, fontFamily: 'maticons');
  // static IconData get iconSexRole => IconData(0xF1342, fontFamily: 'maticons');

  // static IconData get iconComment => IconData(0xF0189, fontFamily: 'maticons');
  // static IconData get iconView => IconData(0xF06D0, fontFamily: 'maticons');
  // static IconData get iconLike => IconData(0xF02D5, fontFamily: 'maticons');
  // static IconData get iconLiked => IconData(0xF02D1, fontFamily: 'maticons');
  // static IconData get iconBookmark => IconData(0xF09A5, fontFamily: 'maticons');
  // static IconData get iconBookmarkFolder => IconData(0xF069D, fontFamily: 'maticons');

  // static IconData get iconMale => IconData(0xF029D, fontFamily: 'maticons');
  // static IconData get iconfemale => IconData(0xF029C, fontFamily: 'maticons');

  // static IconData get iconEditAccount => IconData(0xF0FFB, fontFamily: 'maticons');
  // static IconData get iconFans => IconData(0xF0849, fontFamily: 'maticons');
  // static IconData get iconFollowing => IconData(0xF0BE3, fontFamily: 'maticons');
  // static IconData get iconPalette => IconData(0xF0E0C, fontFamily: 'maticons');

  // static IconData get iconVIP => IconData(0xF01A5, fontFamily: 'maticons');
  // static IconData get iconSVIP => IconData(0xF01A5, fontFamily: 'maticons');
}
