import 'package:dash/utils/imports.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: DashDecoration.kNueShadowDecoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(300),
            child: Image.asset(
              DashAssets.logo,
              height: MediaQuery.of(context).size.width / 3.8,
              width: MediaQuery.of(context).size.width / 3.8,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Shimmer.fromColors(
          baseColor: kPrimaryColor,
          highlightColor: kBlueColor,
          child: Text(
            "Welcome to Dash!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: kBlueColor,
                  fontSize: 25,
                ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
