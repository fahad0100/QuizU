
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ScoresWidgets extends StatelessWidget {
//   const ScoresWidgets(
//       {super.key, required this.scoreValue, this.namePlay = ""});
//   final String scoreValue;
//   final String? namePlay;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(maxWidth: 300),
//         child: Container(
//           width: MediaQuery.of(context).size.width / 1.5,
//           height: 70,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: kElevationToShadow[2],
//             borderRadius: BorderRadius.circular(70),
//             // border: Border.all(color: Colors.black)
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Image.asset(
//                   "assets/Images/score.png",
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     namePlay.toString(),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                     style: GoogleFonts.roboto(
//                         color: Colors.amber[800],
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 50),
//                 child: Text(
//                   scoreValue.toString(),
//                   style: GoogleFonts.roboto(
//                       color: Colors.amber[800],
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
