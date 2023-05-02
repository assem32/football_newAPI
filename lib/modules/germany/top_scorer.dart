import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/cubit/cubit.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/league_page.dart';
import 'package:footcore/shared/component/component.dart';

class TopScorer extends StatelessWidget {
  const TopScorer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GermanyCubit,GermanyState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: GermanyCubit.get(context).topScore.length==0?Center(child: CircularProgressIndicator(color: Color(leagueColor),)):SafeArea(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: ListView.separated(itemBuilder: (context,index)=>scorerItem(model:GermanyCubit.get(context).topScore[index],index: index), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: GermanyCubit.get(context).topScore.length))
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
