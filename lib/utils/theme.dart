import 'package:dash/utils/imports.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          titleSpacing: 0, // backgroundColor: kWhiteColor,
          titleTextStyle: TextStyle(
            color: kWhiteColor,
            fontSize: size16,
            fontWeight: FontWeight.w500,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          secondary: kSecondaryColor,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.normal,
            fontSize: size14,
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelStyle: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.normal,
          ),
          labelStyle: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.normal,
            fontSize: size14,
          ),
          errorStyle: TextStyle(
            color: kRedColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.pacifico(
              fontSize: size24,
              color: kPrimaryColor,
              fontWeight: FontWeight.w500),
          displayMedium: GoogleFonts.mogra(
            fontSize: size14,
            color: kBlackColor,
            fontWeight: FontWeight.w500,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: size14,
            color: kBlackColor,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: size12,
            color: kBlackColor,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: size12,
            color: kBlackColor,
          ),
        ),
      );
}
