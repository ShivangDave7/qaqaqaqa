import 'controller/login_controller.dart';
import 'package:_shiv_ang_s_application1/core/app_export.dart';
import 'package:_shiv_ang_s_application1/core/utils/validation_functions.dart';
import 'package:_shiv_ang_s_application1/widgets/custom_button.dart';
import 'package:_shiv_ang_s_application1/widgets/custom_icon_button.dart';
import 'package:_shiv_ang_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:_shiv_ang_s_application1/domain/googleauth/google_auth_helper.dart';
import 'package:_shiv_ang_s_application1/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 16, top: 68, right: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                              height: 72,
                              width: 72,
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgClose)),
                          Padding(
                              padding: getPadding(top: 16),
                              child: Text("msg_welcome_to_e_com".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold16
                                      .copyWith(letterSpacing: 0.50))),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("msg_sign_in_to_continue".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12
                                      .copyWith(letterSpacing: 0.50))),
                          CustomTextFormField(
                              width: 343,
                              focusNode: FocusNode(),
                              controller: controller.emailController,
                              hintText: "lbl_your_email".tr,
                              margin: getMargin(top: 28),
                              prefix: Container(
                                  margin: getMargin(
                                      left: 18, top: 16, right: 12, bottom: 16),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgMail)),
                              prefixConstraints: BoxConstraints(
                                  minWidth: getSize(15.00),
                                  minHeight: getSize(15.00)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomTextFormField(
                              width: 343,
                              focusNode: FocusNode(),
                              controller: controller.passwordController,
                              hintText: "lbl_password".tr,
                              margin: getMargin(top: 10),
                              textInputAction: TextInputAction.done,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 16, top: 12, right: 10, bottom: 12),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  minWidth: getSize(24.00),
                                  minHeight: getSize(24.00)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: true),
                          CustomButton(
                              height: 57,
                              width: 343,
                              text: "lbl_sign_in".tr,
                              margin: getMargin(top: 16)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(134.00),
                                        margin: getMargin(top: 10, bottom: 9),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.blue50)),
                                    Text("lbl_or".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsBold14
                                            .copyWith(letterSpacing: 0.07)),
                                    Container(
                                        height: getVerticalSize(1.00),
                                        width: getHorizontalSize(137.00),
                                        margin: getMargin(top: 10, bottom: 9),
                                        decoration: BoxDecoration(
                                            color: ColorConstant.blue50))
                                  ])),
                          GestureDetector(
                              onTap: () {
                                onTapRowgoogle();
                              },
                              child: Container(
                                  margin: getMargin(top: 16),
                                  padding: getPadding(
                                      left: 7, top: 16, right: 7, bottom: 16),
                                  decoration: AppDecoration.outlineBlue50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgGoogle,
                                        height: getSize(24.00),
                                        width: getSize(24.00),
                                        margin: getMargin(bottom: 1)),
                                    Padding(
                                        padding: getPadding(
                                            left: 72,
                                            top: 2,
                                            right: 97,
                                            bottom: 1),
                                        child: Text("msg_login_with_google".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsBold14
                                                .copyWith(letterSpacing: 0.50)))
                                  ]))),
                          GestureDetector(
                              onTap: () {
                                onTapRowfacebook();
                              },
                              child: Container(
                                  margin: getMargin(top: 8),
                                  padding: getPadding(
                                      left: 7, top: 16, right: 7, bottom: 16),
                                  decoration: AppDecoration.outlineBlue50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Row(children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgFacebook,
                                        height: getSize(24.00),
                                        width: getSize(24.00),
                                        margin: getMargin(bottom: 1)),
                                    Padding(
                                        padding: getPadding(
                                            left: 64,
                                            top: 2,
                                            right: 87,
                                            bottom: 1),
                                        child: Text(
                                            "msg_login_with_facebook".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsBold14
                                                .copyWith(letterSpacing: 0.50)))
                                  ]))),
                          Padding(
                              padding: getPadding(top: 17),
                              child: Text("msg_forgot_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold12
                                      .copyWith(letterSpacing: 0.50))),
                          Padding(
                              padding: getPadding(top: 7, bottom: 5),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.blueGray300,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.50)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.indigoA200,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.50)),
                                    TextSpan(
                                        text: "lbl_register".tr,
                                        style: TextStyle(
                                            color: ColorConstant.lightBlueA200,
                                            fontSize: getFontSize(12),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.50))
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  onTapRowgoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapRowfacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }
}
