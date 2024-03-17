import 'package:cv_creator_app/constrans/color.dart';
import 'package:cv_creator_app/constrans/space.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.title, required this.icon, required this.toPage});
  final String title;
  final IconData icon;
  // final IconData? arrowIcon;
  final Widget toPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){ return toPage;}), (route) => false);
        // serviceLocator.launchGoogleURL(url: url);
        // "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwiNttSm39KEAxUxakECHb5tBHcYABABGgJ3cw&ase=2&gclid=CjwKCAiAloavBhBOEiwAbtAJOywREdqoaFb8vUMNB88Tvq2Uy1Q2nj5iD-431TcAWouAOKP4RJIoshoC5eQQAvD_BwE&ohost=www.google.com&cid=CAESV-D2kghDnu-jmYi7POoVcTggpGd8AR1yfZn3g252AgU-eSx0OepEK38O0FTfRkmFyQ9S7XUAuaHoHDgmjpQKuzM4EFt1ZAV1Kv58gTMzOkQDaTPSC7gLdg&sig=AOD64_0bCij_gkt817z7flozjboB4_Lxaw&q&nis=4&adurl&ved=2ahUKEwiksc6m39KEAxVETqQEHcVRCl8Q0Qx6BAgREAE");
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            // Icons.bed_outlined,
            color: darkGreen,
          ),
          width12,
          Text(
            title,
            style: const TextStyle(
                color: black, fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
 
  }
}