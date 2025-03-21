import 'package:flutter/material.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_otp.form.dart';
import 'forgot_password_otpviewmodel.dart';

class ForgotPasswordOtpView extends StatelessWidget
    with $ForgotPasswordOtpView {
  final log = getLogger('ForgotPasswordOtpView');

  ForgotPasswordOtpView({Key? key}) : super(key: key);

  //stacked forms handling
  @FormView(
    fields: [
      FormTextField(name: 'otp'),
    ],
  )
  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ForgotPasswordOtpViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(ZuriLogo),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: Text(
                      local!.forgotPassword,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Center(
                    child: Text(
                      local.enterOTP,
                    ),
                  ),
                  const SizedBox(
                    height: 49.0,
                  ),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        // horizontal: 20,
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: AppColors.zuriPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          return null;
                        },
                        length: 6,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          selectedColor: AppColors.zuriPrimaryColor,
                          selectedFillColor: AppColors.zuriPrimaryColor,
                          shape: PinCodeFieldShape.box,
                          activeColor: AppColors.zuriPrimaryColor,
                          disabledColor: Colors.grey,
                          inactiveColor: Colors.white,
                          inactiveFillColor: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: AppColors.zuriPrimaryColor,
                        ),
                        cursorColor: AppColors.zuriPrimaryColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: otpController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (value) {},
                        onTap: () {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          log.i('Allowing to paste $text');
                          //if you return true then it will show the paste
                          //confirmation dialog. Otherwise if false,
                          //then nothing will happen.
                          //but you can show anything you want here,
                          //like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: local.didntReceiveOTP,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          TextSpan(
                            text: local.resend,
                            style: AppTextStyle.greenSize14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        onPressed: model.verifyOtpCode,
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0), backgroundColor: const Color(0xff00B87C),
                        ),
                        child: Text(
                          local.continueButton,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ForgotPasswordOtpViewModel(),
    );
  }
}
