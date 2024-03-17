import 'package:flutter/material.dart';
import '../model/user_data.dart';
import '../page/display_cv.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.cvInfo});
  final UserDataModel? cvInfo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DisplayCv()),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 390,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: const DecorationImage(
                  image: AssetImage(
                    "images/image.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: 390,
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  boxShadow: [],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Color.fromARGB(78, 0, 0, 0),
                ),
                child: Row(
                  children: [
                    Text(
                      "CV's ${cvInfo?.fullName ?? "SAUD ALQURASHI"}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
