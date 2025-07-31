import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/Fetchapicubit.dart';
import 'package:wazker/Featured/Persintion/Home/data/cubit/fetchapicubit/fetchapistate.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/1.dart';
import 'package:wazker/Featured/Persintion/Home/data/manager/book_hatdih/hadith.dart';
import 'package:wazker/Featured/Persintion/Home/views/splash/widget/errmessage.dart';
import 'package:wazker/Featured/utils/AppColors.dart';

class Bookdetailsbody extends StatelessWidget {
  Bookdetailsbody({super.key});
  Book? book;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            '',
            style: TextStyle(
              color: Appcolors.KText,
              fontSize: 25,
              fontFamily: 'Cairo',
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Color(0xFFDFF3F5),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                  ),

                  TextPdf(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextPdf extends StatelessWidget {
  const TextPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Fetchapicubit, Fetchapistate>(
      builder: (context, state) {
        if (state is FetchapistateSucess) {
          List<Hadith> hadithList = [];
          hadithList = state.hadith;

          return ListView.builder(
            itemCount: hadithList.length,
            itemBuilder: (context, index) {
              final textHadith = state.hadith[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 35,
                    ),
                    child: Text(
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Appcolors.Kprimiry,
                      ),
                      softWrap: true,

                      '${textHadith.text}',
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is FetchapistateError) {
          return ErrorMessage(errMessage: state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
