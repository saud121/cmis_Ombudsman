// void showCustomDialog(BuildContext context) {
//   final isRecording= true;
//   final buttonIcon= isRecording ? Icons.stop : Icons.mic;
//   final buttonText= isRecording ? "STOP" : "START";
//   final primary= isRecording ? Colors.red : Colors.white;
//   final onPrimar= isRecording ? Colors.white : Colors.black;
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 700),
//     pageBuilder: (_, __, ___) {
//       return Center(
//        child: Container(
//         height: 240,
//         child: SizedBox.expand(child: Container(
//           child:  Center(
//             child: Column(
//             children: [
//               ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(175,50),
//                   primary: primary,
//                   onPrimary: onPrimar,
//                 ),
//                 icon: Icon(buttonIcon),
//                 label: Text(buttonText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
//                 onPressed: () async{
//
//                 },
//               ),
//             ]),
//           ),
//         )),
//         margin: EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
//       ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 0), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }