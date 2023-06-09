// ignore_for_file: use_build_context_synchronously
import 'package:dash/utils/imports.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, required this.email});
  final String email;

  @override
  State<ForgotPasswordPage> createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController currentPassowrdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailIdController = TextEditingController();
  FocusNode emailIdFn = FocusNode();
  FocusNode currentPassowrdFn = FocusNode();
  FocusNode passwordFn = FocusNode();
  FocusNode confirmPasswordFn = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String? currentPassowrdErrorText;
  String? passwordErrorText;
  String? confirmPasswordErrorText;

  bool isLoading = false;
  bool isTermOfUse = false;
  bool obscureText = true;
  bool obscureConfirmPassword = true;
  bool currentPassword = true;

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    passwordFn.unfocus();
    passwordController.clear();
    confirmPasswordController.clear();
    confirmPasswordFn.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        automaticallyImplyLeading: true,
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: 1, fontSize: size20, fontWeight: FontWeight.w500
              // color: kBlueColor,
              ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WelcomeWidget(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormWidget(
                          enabled: false,
                          textInputAction: TextInputAction.next,
                          controller: emailIdController,
                          focusNode: emailIdFn,
                          label: 'Enter email ',
                          hint: 'Ex. dash@gmail.com',
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        TextFormWidget(
                          controller: currentPassowrdController,
                          focusNode: currentPassowrdFn,
                          label: 'Current Password',
                          hint: "Ex. Dash@123",
                          prefixIcon: Icons.lock,
                          maxLines: 1,
                          suffixIcon: currentPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: currentPassword,
                          errorText: currentPassowrdErrorText,
                          onSuffixIxonTap: () {
                            currentPassword = !currentPassword;
                            _notify();
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return currentPassowrdErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              return currentPassowrdErrorText =
                                  AppString.passwordValidation;
                            } else if (val.length < 8) {
                              return currentPassowrdErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              currentPassowrdErrorText = null;
                              return currentPassowrdErrorText;
                            }
                          },
                          onChanged: (val) {
                            if (val.isEmpty) {
                              currentPassowrdErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              currentPassowrdErrorText =
                                  AppString.passwordValidation;
                            } else if (val.length < 8) {
                              currentPassowrdErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              currentPassowrdErrorText = null;
                            }
                            _notify();
                          },
                          onEditingComplete: () {
                            if (currentPassowrdController.text.isEmpty) {
                              currentPassowrdErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(
                                currentPassowrdController.text.trim())) {
                              currentPassowrdErrorText =
                                  AppString.passwordValidation;
                            } else if (currentPassowrdController.text.length <
                                8) {
                              currentPassowrdErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              currentPassowrdErrorText = null;
                            }
                            _notify();
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormWidget(
                          controller: passwordController,
                          focusNode: passwordFn,
                          label: 'Create Password',
                          prefixIcon: Icons.lock,
                          maxLines: 1,
                          suffixIcon: obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: obscureText,
                          errorText: passwordErrorText,
                          hint: "Ex. Dash@123",
                          onSuffixIxonTap: () {
                            obscureText = !obscureText;
                            _notify();
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return passwordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              return passwordErrorText =
                                  AppString.passwordValidation;
                            } else if (val.length < 8) {
                              return passwordErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              passwordErrorText = null;
                              return passwordErrorText;
                            }
                          },
                          onChanged: (val) {
                            if (val.isEmpty) {
                              passwordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              passwordErrorText = AppString.passwordValidation;
                            } else if (val.length < 8) {
                              passwordErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              passwordErrorText = null;
                            }
                            _notify();
                          },
                          onEditingComplete: () {
                            if (passwordController.text.isEmpty) {
                              passwordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(
                                passwordController.text.trim())) {
                              passwordErrorText = AppString.passwordValidation;
                            } else if (passwordController.text.length < 8) {
                              passwordErrorText =
                                  AppString.passwordLengthValidation;
                            } else {
                              passwordErrorText = null;
                            }
                            _notify();
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormWidget(
                          controller: confirmPasswordController,
                          focusNode: confirmPasswordFn,
                          label: 'Confirm Password',
                          hint: "Ex. Dash@123",
                          prefixIcon: Icons.lock,
                          maxLines: 1,
                          suffixIcon: obscureConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obscureText: obscureConfirmPassword,
                          errorText: confirmPasswordErrorText,
                          onSuffixIxonTap: () {
                            obscureConfirmPassword = !obscureConfirmPassword;
                            _notify();
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return confirmPasswordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              return confirmPasswordErrorText =
                                  AppString.passwordValidation;
                            } else if (val.length < 8) {
                              return confirmPasswordErrorText =
                                  AppString.passwordLengthValidation;
                            } else if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              return confirmPasswordErrorText =
                                  AppString.passwordSameValidation;
                            } else {
                              confirmPasswordErrorText = null;
                              return confirmPasswordErrorText;
                            }
                          },
                          onChanged: (val) {
                            if (val.isEmpty) {
                              confirmPasswordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(val)) {
                              confirmPasswordErrorText =
                                  AppString.passwordValidation;
                            } else if (val.length < 8) {
                              confirmPasswordErrorText =
                                  AppString.passwordLengthValidation;
                            } else if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              confirmPasswordErrorText =
                                  AppString.passwordSameValidation;
                            } else {
                              confirmPasswordErrorText = null;
                            }
                            _notify();
                          },
                          onEditingComplete: () {
                            if (confirmPasswordController.text.isEmpty) {
                              confirmPasswordErrorText =
                                  AppString.passwordIsEmptyValidation;
                            } else if (!Helper.validatePassowrd(
                                confirmPasswordController.text.trim())) {
                              confirmPasswordErrorText =
                                  AppString.passwordValidation;
                            } else if (passwordController.text.length < 8) {
                              confirmPasswordErrorText =
                                  AppString.passwordLengthValidation;
                            } else if (passwordController.text.trim() !=
                                confirmPasswordController.text.trim()) {
                              confirmPasswordErrorText =
                                  AppString.passwordSameValidation;
                            } else {
                              confirmPasswordErrorText = null;
                            }
                            _notify();
                          },
                        ),
                        const SizedBox(height: 30),
                        ButtonWidget(
                          text: 'Submit',
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
