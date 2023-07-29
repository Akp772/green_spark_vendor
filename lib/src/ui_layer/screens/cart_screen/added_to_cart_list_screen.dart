import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class AddedToCartListScreen extends StatefulWidget {
  const AddedToCartListScreen({Key? key}) : super(key: key);

  @override
  State<AddedToCartListScreen> createState() => _AddedToCartListScreenState();
}

class _AddedToCartListScreenState extends State<AddedToCartListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(child: Column(
          children: [
            const Padding(
              padding: AppStyles.pd20,
              child: PoppinsMediumText(text: "Items Added To Cart", fontSize: 18,color: AppColors.textColor,),
            ),
            AppStyles.sbHeight10,
            _commonContainer(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index)=> _listWidget(),
                  separatorBuilder: (context,index)=> AppStyles.sbHeight5,
                  itemCount: 5),
            )

          ],
    ));
  }

  Widget _commonContainer({required Widget child}){
    return Container(
        padding: AppStyles.pd20,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.textColor,width: 0.5),
            borderRadius: BorderRadius.circular(4)
        ),
        child:child
    );
  }
  Widget _listWidget(){
    return ListTile(
      leading: _commonImageWidget(),
      title: const PoppinsMediumText(text: "Women white and red dress",fontSize: 14,color: AppColors.textColor,height: 2,),
      subtitle: _richTextWidget(),
      trailing: AppImages.blueEyeIcon,
    );
  }

  Widget _richTextWidget(){
    return RichText(
        text: const TextSpan(
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,color: AppColors.textColor),
            children:[
              TextSpan(text:'Added To Cart On '),
              TextSpan(text:'21 jun 2023 ',style: TextStyle(color: AppColors.lightBlueThirdColor)),
              TextSpan(text:'By james Charles'),
            ]
        )
    );
  }

  Widget _commonImageWidget(){
    return Container(
      height: 60,width: 53,
      padding: AppStyles.pd2,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          border: Border.all(color: AppColors.textColor,width: 0.1)
      ),
      child: AppImages.productDemoImg,
    );
  }
}
