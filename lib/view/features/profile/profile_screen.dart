// ignore_for_file: depend_on_referenced_packages

import 'package:dash/utils/imports.dart';
import 'package:dash/view/features/profile/bloc/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(FetchAccountEvent()),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          centerTitle: false,
          titleSpacing: 20,
          title: Text(
            "Profile",
            style: GoogleFonts.pacifico(
              fontSize: size24,
              color: kPrimaryColor,
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name : ",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: size16,
                                    color: kBlackColor,
                                  ),
                        ),
                        Text(
                          state.user?.displayName ?? "- ",
                          // userModel?.username ?? "Unknown Username",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: size16,
                                    color: kBlackColor,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email : ",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: size16,
                                    color: kBlackColor,
                                  ),
                        ),
                        Text(
                          state.user?.email ?? "Unknown Email",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: size16,
                                    color: kBlackColor,
                                  ),
                        ),
                      ],
                    ),
                    ButtonWidget(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 90),
                      onTap: () {
                        BlocProvider.of<ProfileBloc>(context)
                            .add(DeleteAccountEvent());
                      },
                      text: "Delete Account",
                    ),
                  ],
                ),
                if (state.isLoading) Helper.progress(),
              ],
            );
          },
        ),
        bottomNavigationBar: ButtonWidget(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
          onTap: () {
            DialogBoxWidget.logOutDialog(context);
          },
          text: "LogOut",
        ),
      ),
    );
  }
}
