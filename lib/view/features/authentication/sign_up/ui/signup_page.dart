// ignore_for_file: use_build_context_synchronously

import 'package:dash/utils/imports.dart';
import 'package:dash/view/features/authentication/sign_up/bloc/sign_up_bloc.dart';
import 'package:dash/view/navbar_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  FocusNode userNameFn = FocusNode();
  FocusNode emailFn = FocusNode();
  FocusNode passwordFn = FocusNode();
  FocusNode confirmPasswordFn = FocusNode();
  String? emailIdErrorText;
  String? userNameErrorText;
  String? passwordErrorText;
  String? confirmPasswordErrorText;
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPrivacyPolicy = false;
  bool obscureText = true;
  bool obscureConfirmPassword = true;
  SignUpBloc signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    passwordFn.unfocus();
    userNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    confirmPasswordFn.unfocus();
    userNameFn.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          'Create Account',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              letterSpacing: 1, fontSize: size20, fontWeight: FontWeight.w500
              // color: kBlueColor,
              ),
        ),
      ),
      body: BlocConsumer<SignUpBloc, SignUpState>(
        bloc: signUpBloc,
        listenWhen: (previous, current) => current is SignUpActionState,
        buildWhen: (previous, current) => current is! SignUpActionState,
        listener: (context, state) {
          if (state is HomeNavigateState) {
            Helper.toast(context, "Account Created Successfully",
                success: true);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (c) => const NavBarPage()),
              (route) => false,
            );
          }

          if (state is ErrorState) {
            Helper.toast(context, state.message);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const WelcomeWidget(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormWidget(
                              controller: userNameController,
                              focusNode: userNameFn,
                              label: 'Enter Username',
                              hint: "Ex. Test123",
                              prefixIcon: Icons.person,
                              errorText: userNameErrorText,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return userNameErrorText =
                                      'Enter your username';
                                } else {
                                  return userNameErrorText = null;
                                }
                              },
                              onEditingComplete: () {
                                if (userNameController.text.isEmpty) {
                                  userNameErrorText = 'Enter your username';
                                } else {
                                  userNameErrorText = null;
                                }
                                _notify();
                              },
                              onChanged: (val) {
                                if (val.isEmpty) {
                                  userNameErrorText = 'Enter your username';
                                } else {
                                  userNameErrorText = null;
                                }
                                _notify();
                              },
                            ),
                            const SizedBox(height: testFeildPadding),
                            TextFormWidget(
                              controller: emailIdController,
                              focusNode: emailFn,
                              label: 'Enter email ',
                              hint: 'Ex. dash@gmail.com',
                              prefixIcon: Icons.email,
                              errorText: emailIdErrorText,
                              onEditingComplete: () {
                                if (emailIdController.text.isEmpty) {
                                  emailIdErrorText = 'Enter the Email Id';
                                } else if (!emailIdController.text
                                        .contains('@') ||
                                    !emailIdController.text.contains('.')) {
                                  emailIdErrorText = 'Enter valid the email';
                                } else {
                                  emailIdErrorText = null;
                                }
                                _notify();
                              },
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  emailIdErrorText = 'Enter the Email Id';
                                  return emailIdErrorText;
                                } else if (!val.contains('@') ||
                                    !val.contains('.')) {
                                  emailIdErrorText = 'Enter valid the email';
                                  return emailIdErrorText;
                                } else {
                                  emailIdErrorText = null;
                                  return emailIdErrorText;
                                }
                              },
                              onChanged: (val) {
                                if (val.isEmpty) {
                                  emailIdErrorText = 'Enter the Email Id';
                                } else if (!val.contains('@') ||
                                    !val.contains('.')) {
                                  emailIdErrorText = 'Enter valid the email';
                                } else {
                                  emailIdErrorText = null;
                                }
                                _notify();
                              },
                            ),
                            const SizedBox(height: testFeildPadding),
                            TextFormWidget(
                              controller: passwordController,
                              focusNode: passwordFn,
                              label: 'Create Password',
                              hint: "Ex. Dash@123",
                              prefixIcon: Icons.lock,
                              maxLines: 1,
                              suffixIcon: obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              obscureText: obscureText,
                              errorText: passwordErrorText,
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
                                  passwordErrorText =
                                      AppString.passwordValidation;
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
                                  passwordErrorText =
                                      AppString.passwordValidation;
                                } else if (passwordController.text.length < 8) {
                                  passwordErrorText =
                                      AppString.passwordLengthValidation;
                                } else {
                                  passwordErrorText = null;
                                }
                                _notify();
                              },
                            ),
                            const SizedBox(height: testFeildPadding),
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
                                obscureConfirmPassword =
                                    !obscureConfirmPassword;
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
                            GestureDetector(
                              onTap: () {
                                isPrivacyPolicy = !isPrivacyPolicy;
                                _notify();
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: const EdgeInsets.only(right: 8),
                                    child: Checkbox(
                                      value: isPrivacyPolicy,
                                      onChanged: (onChanged) {
                                        if (onChanged != null) {
                                          isPrivacyPolicy = !isPrivacyPolicy;
                                          _notify();
                                        }
                                      },
                                    ),
                                  ),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: "I accept ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 12,
                                          ),
                                      children: [
                                        const TextSpan(text: "Dash"),
                                        const TextSpan(
                                          text: ' T&C ',
                                          style: TextStyle(
                                            fontSize: size12,
                                            color: kBlueColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' and ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontSize: 12,
                                              ),
                                        ),
                                        const TextSpan(
                                          text: ' Privacy Policy.',
                                          style: TextStyle(
                                            fontSize: size12,
                                            color: kBlueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ButtonWidget(
                              text: 'Submit',
                              onTap: validate,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is LoadingState && state.isLoading) Helper.progress(),
            ],
          );
        },
      ),
    );
  }

  void validate() {
    confirmPasswordFn.unfocus();
    _formKey.currentState?.validate();
    if (_formKey.currentState != null &&
        _formKey.currentState!.validate() &&
        isPrivacyPolicy == false) {
      Helper.toast(context, "Accept T&C and Privcy Policy");
    } else if (_formKey.currentState != null &&
        _formKey.currentState!.validate()) {
      UserModel userModel = UserModel(
        email: emailIdController.text.trim(),
        password: passwordController.text.trim(),
        username: userNameController.text.trim(),
      );
      signUpBloc.add(CreateAccountEvent(userModel));
    }
  }
}
