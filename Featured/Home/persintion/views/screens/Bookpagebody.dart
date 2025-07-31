import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/fetchingnameofnbook.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/statesfecthstate.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/book_hatdih.dart';
import 'package:wazker/Featured/Persintion/Home/views/splash/widget/errmessage.dart';
import 'package:wazker/Featured/utils/AppColors.dart';
import 'package:wazker/Featured/utils/Router.dart';

class Bookpagebody extends StatelessWidget {
  const Bookpagebody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .39,
          width: double.infinity,
          child: Image.asset('lib/assets/1000102297.png'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Appcolors.Kmotoncolor,
                  ),
                  height: double.infinity,
                  width: double.infinity,

                  child: catogry(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class catogry extends StatelessWidget {
  const catogry({super.key});

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: widget.api?.fetchBookNamesList(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
    //     } else if (snapshot.hasData) {
    //       final booksMap = snapshot.data as Map<String, dynamic>;
    //       final booksList = booksMap.values
    //           .map((e) => Bookgo.fromJson(e as Map<String, dynamic>))
    //           .toList();

    return BlocBuilder<Fetchap22icubit, Fetcha22pistate>(
      builder: (context, state) {
        if (state is Fetchapistate22Sucess) {
          final booksList = state.nameing;
          return ListView.builder(
            itemCount: booksList.length, // <-- FIXED
            itemBuilder: (context, index) {
              final book = booksList[index];
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Router2.KBookcatgorydetails);
                },
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15, width: 9),
                        Text(
                          '${book}', // safer access
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Appcolors.KText,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 9, width: 9),
                        Text(
                          ' وصف عمدة الاحكام ',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Appcolors.KText,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            color: Colors.grey[90],
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is Fetchapistate22Error) {
          return ErrorMessage(errMessage: state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
        ;
      },
    );
  }
}

// //     );
// //   }
// }
// class BookCatogry extends StatelessWidget {
//   const BookCatogry({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         GoRouter.of(context).push(Router2.KBookcatgorydetails);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.4),
//                 spreadRadius: 3,
//                 blurRadius: 6,
//                 offset: Offset(2, 5),
//               ),
//             ],
//           ),
//           height: 60,
//           width: double.infinity,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Icon(
//                   Icons.arrow_back,
//                   size: 22,
//                   color: Color(0xFF0097A7),
//                 ),
//               ),

//               Spacer(flex: 1),
//               SizedBox(height: 10),

//               Text(
//                 textAlign: TextAlign.center,
//                 'المتون  ',
//                 style: TextStyle(color: Color(0xFF0097A7), fontSize: 18),
//               ),
//               SizedBox(width: 10),
//               Image.asset('lib/assets/arabic (1).png', height: 50, width: 85),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
