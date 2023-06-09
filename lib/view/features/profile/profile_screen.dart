// ignore_for_file: depend_on_referenced_packages

import 'package:dash/utils/imports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    getUSer();
  }

  Future<void> getUSer() async {
    userModel = await LocalDatabase.getCurrentUser();
    _notify();
  }

  _notify() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name : ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size16,
                      color: kBlackColor,
                    ),
              ),
              Text(
                userModel?.username ?? "Unknown Username",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size16,
                      color: kBlackColor,
                    ),
              ),
              Text(
                userModel?.email ?? "Unknown Email",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: size16,
                      color: kBlackColor,
                    ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: ButtonWidget(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
        onTap: () {
          DialogBoxWidget.logOutDialog(context);
        },
        text: "LogOut",
      ),
    );
  }
}
