import 'package:findate/view/auth/views/confirm_email.dart';
import 'package:findate/view/auth/views/login_screen.dart';
import 'package:findate/view/landing_page/no_internet_screen.dart';
import 'package:findate/view/on_bording/on_bording_screen.dart';
import 'package:flutter/material.dart';


pushToNoInternetPage(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ),
  );
}


pushToLoginPage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}

pushOnBoardingScreen(BuildContext context) async {
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const OnBoardingScreen(),
    ),
  );
}
pushConfrimEmailScreen(BuildContext context) async {
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ConfirmEmailScreen(),
    ),
  );
}

pushConfrimEmailScreen1(BuildContext context) async {
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ConfirmEmailScreen(),
    ),
  );
}

// pushCategoriesPage(BuildContext context) async {
//   Navigator.pushNamed(context, CategoriesPage.id);
// }

// pushSettingsScreen(BuildContext context) async {
//   Navigator.pushNamed(context, SettingsScreen.id);
// }

// pushToHomePage(BuildContext context) async {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (context) => const HomePageScreen(),
//     ),
//   );
// }

// pushMaterialScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const MaterialCardScreen1(),
//     ),
//   );
// }

// pushScholarshipScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const ScholarshipScreen(),
//     ),
//   );
// }

// pushAboutUsScreen(BuildContext context) async {
//   Navigator.of(context).pushReplacement(
//     MaterialPageRoute(
//       builder: (context) => const AboutUsScreen(),
//     ),
//   );
// }

// pushLogOutScreen(BuildContext context) async {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const LogOutScreen();
//       });
// }

// pushDeleteNote(BuildContext context) async {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return const DeleteNoteScreen();
//       });
// }

// pushCatergoriesSearchScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const CatergoriesSearchScreen()),
//     ),
//   );
// }

// pushEmailPasswordChangeScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const EmailPasswordChangeScreen()),
//     ),
//   );
// }

// pushSignUpScreen1(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: ((context) => const SignUpScreen1()),
//     ),
//   );
// }

// pushNoticeScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoticeScreen1(),
//     ),
//   );
// }

// pushNotificationScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NotificationScreen(),
//     ),
//   );
// }

// pushSchoolPortalScreen(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const SchoolPortal(),
//     ),
//   );
// }

// pushNoteBookScreen1(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen1(),
//     ),
//   );
// }

// pushNoteBookScreen2(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen2(),
//     ),
//   );
// }

// pushNoteBookScreen3(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const NoteBookScreen3(),
//     ),
//   );
// }

// logout(BuildContext context) async {
//   Navigator.of(context).pushNamedAndRemoveUntil(
//     LoginScreen.id, (Route<dynamic> route) => false);
// }

// pushToOnboardingPage(BuildContext context) async {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => const OnBoardingScreen(),
//     ),
//   );
// }

// pushToLoginPage(BuildContext context) async {
//   Navigator.of(context).pushNamed(LoginScreen.id);
// }
