// import 'package:base_code/src/data_layer/res/colors.dart';
// import 'package:base_code/src/data_layer/res/styles.dart';
// import 'package:flutter/material.dart';
//
// import 'text_widget_helper.dart';
//
// ///
// class CommonContainerWithIcon extends StatelessWidget {
//   const CommonContainerWithIcon(
//       {Key? key,
//       this.horizontal = 35,
//       this.vertical = 15,
//       required this.icon,
//       this.height = 24,
//       this.width = 24,
//       required this.onTap})
//       : super(key: key);
//
//   final double horizontal;
//   final double vertical;
//   final Widget icon;
//   final Function onTap;
//   final double height;
//   final double width;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onTap!();
//       },
//       child: Container(
//         decoration: AppStyles.radiusBoxDecoration(
//             color: AppColors.blackTextColor, radius: 12),
//         child: Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
//           child: Center(
//             child: SizedBox(
//                 height: AppStyles.getHeight(height),
//                 width: AppStyles.getWidth(width),
//                 child: icon),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// ///
// class LogInUsingContainer extends StatelessWidget {
//   const LogInUsingContainer(
//       {Key? key,
//       required this.iconWidget,
//       required this.onTap,
//       required this.buttonText,
//       this.fontSize = 14,
//       this.height = 1.5,
//       this.textColor = AppColors.blackTextColor})
//       : super(key: key);
//
//   final Widget iconWidget;
//   final Function onTap;
//   final String buttonText;
//   final double fontSize;
//   final double height;
//   final Color textColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onTap!();
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.blackTextColor),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//             ///mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               iconWidget,
//               AppStyles.sbWidth15,
//               Flexible(
//                   child: PoppinsMediumText(
//                 height: height,
//                 text: buttonText,
//                 fontSize: fontSize,
//                 color: textColor,
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
