// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:latihan_bloc/404/404.dart';
// import 'package:latihan_bloc/bloc/counter.dart';
// import 'package:latihan_bloc/pages/home.dart';
// import 'package:latihan_bloc/pages/other.dart';

// class myRouter {
//   Counter mycounter = Counter();

//   Route onRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case "/":
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: mycounter,
//             child: HomePage(),
//           ),
//         );
//       case "/other":
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider.value(
//             value: mycounter,
//             child: const OtherPage(),
//           ),
//         );
//       default:
//         return MaterialPageRoute(
//           builder: (context) => const NotFoundPage(),
//         );
//     }
//   }
// }
