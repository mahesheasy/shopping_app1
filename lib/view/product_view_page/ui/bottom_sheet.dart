// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shopping_app/screens/bloc/home_bloc.dart';
// import 'package:shopping_app/screens/models/home_products.dart';

// class CustomBottomSheet extends StatelessWidget {
//   final ProductDataModel productDataModel;
//   const CustomBottomSheet({super.key, required this.productDataModel});

//   @override
//   Widget build(BuildContext context) {
//     final homeBloc = BlocProvider.of<HomeBloc>(context);
//     return Container(
//       height: 50,
//       color: Colors.grey,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               homeBloc.add(HomeProductCartButtonClickedEvent(
//                   clickedProduct: productDataModel));
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, minimumSize: const Size(150, 50)),
//             child: const Text(
//               'Add to Cart',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 minimumSize: const Size(150, 50)),
//             child: const Text(
//               'Buy Now',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/screens/bloc/home_bloc.dart';
import 'package:shopping_app/screens/models/home_products.dart';

class CustomBottomSheet extends StatelessWidget {
  final ProductDataModel productDataModel;
  const CustomBottomSheet({Key? key, required this.productDataModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.grey, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Divider(color: Colors.black,thickness: 8,height: 10,),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  // Perform your action for 'Buy Now' here
                },
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
