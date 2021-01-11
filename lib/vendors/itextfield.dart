// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../themes/style.dart';

// class ITextField extends StatefulWidget {
//   // 控制属性
//   final TextEditingController controller;
//   // 输入类型
//   final TextInputType keyboardType;
//   // 焦点控制
//   final FocusNode focusNode;
//   // 键盘右下角的类型
//   final TextInputAction textInputAction;
//   // 输入框左侧文本
//   final String label;
//   final Widget leftWidget;
//   // 输入的最大字符数
//   final int maxLength;
//   // 占位提示文字
//   final String placeholder;
//   // 是否禁用输入框
//   final bool disabled;
//   // 是否只读
//   final bool readonly;
//   // 是否显示表单必填星号
//   final bool require;
//   final Color requiredColor;
//   // 是否启用清除控件
//   final bool clearable;
//   // 自动聚焦
//   final bool autofocus;
//   // 检验输入框正则
//   final List<TextInputFormatter> inputFormatters;
//   // 输入框类型
//   final String type;
//   // 输入框行数，当type=textarea可用
//   final int rows;
//   // 显示字数统计
//   final bool showWordLimit;
//   // 是否将输入内容标红
//   final bool error;
//   // 底部错误提示文案
//   final String errorMessage;
//   // 左侧文本宽度
//   final double labelWidth;
//   // 左侧文本对齐方式
//   final TextAlign labelAlign;
//   final Color labalColor;
//   // 输入框内容对齐方式
//   final TextAlign inputAlign;
//   // 左侧图标
//   final Icon leftIcon;
//   // 点击左侧图标时触发
//   final Function() clickLeft;
//   // 右侧图标
//   final IconData rightIcon;
//   // 点击右侧图标时触发
//   final Function() clickRight;
//   // 自定义右侧内容
//   final Widget right;
//   // 工具栏定制
//   final ToolbarOptions toolbarOptions;
//   // 输入框内容变化时触发
//   final Function(String val) onChange;
//   // 输入框内容编辑结束时触发
//   final Function() onEditingComplete;
//   // 输入框获得焦点时触发
//   final Function() onClick;
//   // 内容提交(按回车)的回调
//   final Function(String val) onSubmitted;
//   // 文本样式
//   final TextStyle style;
//   final EdgeInsetsGeometry padding;
//   final EdgeInsetsGeometry contentPadding;
//   final Color fillColor;

//   final double borderRadius;
//   final Color background;
//   final CrossAxisAlignment crossAxisAlignment;
//   ITextField(
//       {Key key,
//       this.keyboardType,
//       this.focusNode,
//       this.textInputAction: TextInputAction.done,
//       this.label,
//       this.placeholder,
//       this.controller,
//       this.maxLength: 999,
//       this.disabled: false,
//       this.readonly: false,
//       this.require: false,
//       this.clearable: true,
//       this.autofocus: false,
//       this.inputFormatters,
//       this.type: "text",
//       this.rows: 2,
//       this.showWordLimit: false,
//       this.error: false,
//       this.errorMessage,
//       this.labelWidth,
//       this.labelAlign: TextAlign.start,
//       this.inputAlign: TextAlign.start,
//       this.leftIcon,
//       this.clickLeft,
//       this.rightIcon,
//       this.clickRight,
//       this.right,
//       this.toolbarOptions,
//       this.onChange,
//       this.onEditingComplete,
//       this.onSubmitted,
//       this.onClick,
//       this.style,
//       this.requiredColor,
//       this.padding,
//       this.fillColor,
//       this.leftWidget,
//       this.labalColor,
//       this.borderRadius,
//       this.background,
//       this.contentPadding,
//       this.crossAxisAlignment})
//       : super(key: key);

//   @override
//   _ITextField createState() => _ITextField();
// }

// class _ITextField extends State<ITextField> {
//   bool _isShowPwd = false;
//   bool _isShowDelete;
//   TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();

//     _controller = widget.controller;

//     /// 获取初始化值
//     _isShowDelete = _controller.text.isNotEmpty;

//     /// 监听输入改变
//     _controller.addListener(() {
//       if (mounted) {
//         setState(() {
//           _isShowDelete = _controller.text.isNotEmpty;
//         });
//       }
//     });
//   }

//   Widget buildLeft() {
//     if (widget.leftWidget != null) return widget.leftWidget;

//     return Container(
//       width: widget.labelWidth ?? Style.itextfieldLabelWidth,
//       // height: Style.itextfieldMinHeight,
//       child: Row(
//         children: <Widget>[
//           widget.require
//               ? Text("*",
//                   style: TextStyle(
//                     fontSize: Style.itextfieldFontSize,
//                     color: widget.requiredColor ?? Style.itextfieldRequiredColor,
//                   ))
//               : Container(),
//           widget.leftIcon != null
//               ? GestureDetector(
//                   child: widget.leftIcon,
//                   onTap: () => widget.clickLeft(),
//                 )
//               : Container(),
//           widget.leftIcon != null ? SizedBox(width: Style.intervalXSmall) : Container(),
//           widget.label != null
//               ? Text(
//                   "${widget.label}",
//                   textAlign: widget.labelAlign,
//                   style: TextStyle(
//                     fontSize: Style.itextfieldFontSize,
//                     color: widget.labalColor ?? Style.itextfieldLabelColor,
//                   ),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }

//   Widget buildTextField() {
//     return Expanded(
//         child: TextFormField(
//             controller: _controller,
//             focusNode: widget.focusNode,
//             keyboardType: widget.keyboardType,
//             textInputAction: widget.type == "textarea" ? TextInputAction.newline : widget.textInputAction,
//             textAlign: widget.inputAlign,
//             autofocus: widget.autofocus,
//             readOnly: widget.readonly,
//             enabled: !widget.disabled,
//             maxLines: widget.type == "textarea" ? widget.rows : 1,
//             style: widget.style ??
//                 TextStyle(
//                     fontSize: Style.fontSizeNormal,
//                     color: widget.error
//                         ? Style.itextfieldErrorTextColor
//                         : widget.disabled ? Style.itextfieldDisabledTextColor : Style.itextfieldTextColor),
//             inputFormatters: widget.inputFormatters,
//             obscureText: widget.type == "password" ? !_isShowPwd : false,
//             decoration: InputDecoration(
//               filled: widget.fillColor != null,
//               fillColor: widget.fillColor,
//               isDense: true,
//               contentPadding: widget.contentPadding ??
//                   (widget.placeholder != null ? EdgeInsets.only(top: 0) : Style.itextfieldContentPadding),
//               hintText: widget.placeholder,
//               hintStyle: TextStyle(
//                 color: widget.error ? Style.itextfieldErrorTextColor : Style.itextfieldPlaceHolderColor,
//                 fontSize: Style.itextfieldFontSize,
//               ),
//               counterText: widget.showWordLimit == false ? "" : null,
//               border: InputBorder.none,
//               errorText: widget.errorMessage,
//               errorStyle: TextStyle(
//                 fontSize: Style.itextfieldErrorMessageFontSize,
//                 color: Style.itextfieldRequiredColor,
//               ),
//             ),
//             maxLength: widget.maxLength,
//             toolbarOptions: widget.toolbarOptions,
//             cursorColor: widget.error ? Style.itextfieldRequiredColor : Style.itextfieldTextColor,
//             cursorWidth: Style.itextfieldCursorWidth,
//             onEditingComplete: () {
//               if (widget.onEditingComplete != null) widget.onEditingComplete();
//             },
//             onChanged: (val) {
//               if (widget.onChange != null) widget.onChange(val);
//             },
//             onTap: () {
//               if (widget.onClick != null) widget.onClick();
//             },
//             onFieldSubmitted: (val) {
//               if (widget.onSubmitted != null) widget.onSubmitted(val);
//             }));
//   }

//   Widget buildRight() {
//     return Container(
//       // height: Style.itextfieldMinHeight,
//       child: Row(
//         children: <Widget>[
//           widget.type == "password" ? SizedBox(width: Style.intervalNormal) : Container(),
//           widget.type == "password"
//               ? GestureDetector(
//                   child: Icon(_isShowPwd ? Icons.visibility_off : Icons.visibility,
//                       size: Style.itextfieldFontSize, color: Style.itextfieldRightIconColor),
//                   onTap: () {
//                     setState(() {
//                       _isShowPwd = !_isShowPwd;
//                     });
//                   },
//                 )
//               : Container(),
//           widget.clearable && _isShowDelete ? SizedBox(width: Style.intervalNormal) : Container(),
//           widget.clearable && _isShowDelete
//               ? GestureDetector(
//                   child: Icon(Icons.cancel, size: Style.itextfieldClearIconSize, color: Style.itextfieldClearIconColor),
//                   onTap: () {
//                     _controller.text = '';
//                     if (widget.onChange != null) widget.onChange("");
//                   },
//                 )
//               : Container(),
//           (widget.rightIcon != null || widget.right != null) ? SizedBox(width: Style.intervalNormal) : Container(),
//           (widget.rightIcon != null && widget.right == null)
//               ? GestureDetector(
//                   child: Icon(widget.rightIcon,
//                       size: Style.itextfieldRightIconSize, color: Style.itextfieldRightIconColor),
//                   onTap: () => widget.clickRight(),
//                 )
//               : Container(),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: widget.padding ?? Style.itextfieldPadding,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
//         color: widget.background ?? Style.itextfieldBackgroundColor,
//       ),
//       child: Row(
//         crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.center,
//         children: <Widget>[
//           (widget.leftIcon != null || widget.label != null || widget.leftWidget != null) ? buildLeft() : Container(),
//           buildTextField(),
//           buildRight(),
//           widget.right != null ? widget.right : Container(),
//         ],
//       ),
//     );
//   }
// }
