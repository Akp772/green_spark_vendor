import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/colors.dart';
import 'package:green_spark_vendor/src/data_layer/res/images.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';
import 'package:green_spark_vendor/src/data_layer/res/styles.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/app_buttons.dart';
import 'package:green_spark_vendor/src/ui_layer/widgets/text_widget_helper.dart';

class ShopDetailWidget extends StatefulWidget {
  const ShopDetailWidget({Key? key}) : super(key: key);

  @override
  State<ShopDetailWidget> createState() => _ShopDetailWidgetState();
}

class _ShopDetailWidgetState extends State<ShopDetailWidget> {

  final TextEditingController _shopController = TextEditingController();
  final TextEditingController _shopUrlController = TextEditingController();
  final TextEditingController _legalNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _timeZonController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appMainColor,
          elevation: 0,
          leading: const SizedBox(),
          title: const PoppinsSemiBoldText(text: "Vendor Name",fontSize: 16,color: AppColors.whiteColor,),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none,color: AppColors.whiteColor,))
          ],
        ),
        body: SafeArea(child: _mainWidget()));
  }

  Widget _mainWidget(){
    return Padding(
      padding: AppStyles.pd20,
      child:  Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        _listNoticeTileWidget(),
                        AppStyles.sbHeight14,
                        _listAlertTileWidget(),
                        AppStyles.sbHeight14,
                      ],
                    ),
                  ),
                  AppStyles.sbHeight10,
                  Container(
                    color: AppColors.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppStyles.sbHeight14,
                        const PoppinsSemiBoldText(text: "General Setting", fontSize: 18,color: AppColors.textColor,),
                        AppStyles.sbHeight14,
                        _commonLabelAndTextFieldWidget("Shop Name",_shopTextFieldWidget(),i_0),
                        AppStyles.sbHeight8,
                        _commonLabelAndTextFieldWidget("Shop URL",_shopURLTextFieldWidget(),i_1),
                        AppStyles.sbHeight8,
                        _commonLabelAndTextFieldWidget("Legal Name",_legalNameTextFieldWidget(),i_2),
                        AppStyles.sbHeight8,
                        _commonLabelAndTextFieldWidget("Time Zone",_timeZoneTextFieldWidget(),i_3),
                        AppStyles.sbHeight8,
                        _commonLabelAndTextFieldWidget("Description",_descriptionTextFieldWidget(),i_4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppStyles.sbHeight10,
          CommonAppButton(text: "Submit", onTap: (){
          })
        ],
      ),
    );
  }

  Widget _listNoticeTileWidget(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppImages.infoIcon,
        AppStyles.sbWidth10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _bottomTextWidget('Notice!',' Your email address is not verified, please verify to get full access'),
              AppStyles.sbHeight10,
              _buttonWidget("Take action"),
            ],
          ),
        )
      ],
    );
  }

  Widget _listAlertTileWidget(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppImages.infoIcon,
        AppStyles.sbWidth10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _bottomTextWidget('Alert!',' Your store is on hold! We will review and approve your store as soon as possible'),
              AppStyles.sbHeight10,
              _buttonWidget("Take action"),
            ],
          ),
        )
      ],
    );
  }

  Widget _buttonWidget(String text){
    return Container(
      width: 110,
      padding: AppStyles.pd10,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.circular(d_4),
      ),
      child: PoppinsBoldText(text: text,fontSize: 14,color: AppColors.whiteColor,),
    );
  }

  Widget _bottomTextWidget(String label,String content){
    return  RichText(
      text:  TextSpan(
        children: [
           TextSpan(
            text: label,
            style: const TextStyle(
              color: AppColors.blackTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          TextSpan(
              text: content, style: const TextStyle(color: AppColors.textColor, fontWeight: FontWeight.w400,)),
        ],
      ),
    );
  }

  Widget _commonLabelAndTextFieldWidget(String labelText, Widget fieldWidget, int type){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text:  TextSpan(
            children: [
              TextSpan(
                text: labelText,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              if(type==i_0 || type==i_1 ||type==i_2 )const TextSpan(text: '*', style: TextStyle(color: Colors.red)),

            ],
          ),
        ),
        AppStyles.sbHeight5,
        fieldWidget
      ],
    );
  }

  Widget _shopTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _shopController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _legalNameTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _legalNameController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _shopURLTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _shopUrlController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _emailTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _shopController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _timeZoneTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _timeZonController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _descriptionTextFieldWidget(){
    return Container(
      padding: AppStyles.pdH8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.textColor,width: 0.5)
      ),
      child: TextField(
        controller: _descriptionController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          hintText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

}
