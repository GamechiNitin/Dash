import 'package:dash/utils/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DialogBoxWidget {
  static Future<void> logOutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          titlePadding: EdgeInsets.zero,
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
            ),
            child: Text(
              'Log Out',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: size16,
                    color: kWhiteColor,
                  ),
            ),
          ),
          content: Text(
            'Are you sure you want to logout ?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: size16,
                  color: kBlackColor,
                ),
          ),
          actions: <Widget>[
            ButtonWidget(
              text: "Yes",
              color: kRedColor,
              margin: EdgeInsets.zero,
              onTap: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
                // LocalDatabase.clear();
                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //       builder: (context) => const LogInPage(),
                //     ),
                //     (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
