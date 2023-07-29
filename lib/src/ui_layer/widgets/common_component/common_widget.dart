// import 'package:base_code/src/data_layer/res/colors.dart';
// import 'package:base_code/src/data_layer/res/images.dart';
// import 'package:base_code/src/data_layer/res/styles.dart';
// import 'package:base_code/src/ui_layer/widgets/app_buttons.dart';
// import 'package:base_code/src/ui_layer/widgets/text_widget_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class CommonWidget {
//   static Widget crossLeading(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);
//         Navigator.pop(context);
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: AppColors.highlightedYellow),
//         child: AppImages.crossIcon,
//       ),
//     );
//   }
//
//   static Widget crossLeadingForMasterClassVideo(
//       BuildContext context, VoidCallback action) {
//     return InkWell(
//       onTap: () {
//         action();
//         // SystemChrome.setPreferredOrientations([
//         //   DeviceOrientation.portraitUp,
//         //   DeviceOrientation.portraitDown,
//         // ]);
//         //
//         // Navigator.pop(context);
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 11, vertical: 8),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: AppColors.highlightedYellow),
//         child: AppImages.crossIcon,
//       ),
//     );
//   }
//
//   static Widget loginSheetData(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
//           child: Column(
//             children: [
//               CommonText(
//                 text: "You’re Almost There",
//                 fontSize: 24,
//                 color: AppColors.textBrownColor,
//               ),
//               AppStyles.sbHeight16,
//               CommonText(
//                 text:
//                     "Login to access our premium features and have a personalized experience.",
//                 fontSize: 18,
//               ),
//               AppStyles.sbHeight51,
//               InkWell(
//                 onTap: () => Navigator.pop(context),
//                 child: CommonBottomSheetButton(
//                   textValue: "Continue As Guest",
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
