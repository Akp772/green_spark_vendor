import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_text_fields.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/common_component/common_app_bar_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/table_widgets/common_table_widget.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({Key? key}) : super(key: key);

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {

  final TextEditingController controller = TextEditingController();

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWidget(context),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const CommonAppBarWidget(title: "Catalogue",isNotification: true),
             _topTabBarWidget(),
            _commonSearchWidget(),
            DataTableTopWidget(firstHeading: tabIndex==0?"Image":"Order",),
            Expanded(
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,index)=> DataTableItemWidget(widget: tabIndex==0?null:const SubTitleText(text: "2352",fontSize: 14,color: AppColors.textColor,),),
                        separatorBuilder:  (context,index)=> const DividerWidget(),
                        itemCount: 5),
                    const DividerWidget(),
                  ],
                ),
              ),
          ],
        )
    );
  }

  Widget _topTabBarWidget(){
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _commonTabBarItemWidget("Products",0),
          _commonTabBarItemWidget("Attributes",1),
        ],
      ),
    );
  }

  Widget _commonTabBarItemWidget(String text, int type){
    return Expanded(
      child: InkWell(
        onTap: (){
          tabIndex = type;
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: tabIndex==type ? AppColors.appMainColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.appMainColor,width: 1)
          ),
          padding: AppStyles.pdH16V8,
          child: PoppinsMediumText(text: text, fontSize: 14,color: tabIndex==type? AppColors.whiteColor:AppColors.textGreyColor,),
        ),
      ),
    );
  }

  Widget _commonSearchWidget(){
    return SizedBox(
      height: 80,
      child: Padding(
        padding: AppStyles.pdH15,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: SearchTextField(
                    controller: controller,
                    hint: "Search",
                    fontColor: AppColors.textColor
                ),
              ),
            ),
            AppStyles.sbWidth10,
            CommonAppButtonWithDynamicWidth(
              padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
              text: tabIndex==0?"Add Product":"Add Attribute", onTap: (){},fontSize: 14,)
          ],
        ),
      ),
    );
  }


}
