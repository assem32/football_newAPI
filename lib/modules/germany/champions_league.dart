import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/cubit/cubit.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/league_page.dart';
import 'package:footcore/shared/component/component.dart';

class ChampionLeague extends StatelessWidget {
  const ChampionLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GermanyCubit()..getChampionLeague(),
      child: BlocConsumer<GermanyCubit,GermanyState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: Column(
                children: [
                  leagueTitle(colorCode: leagueColor,countryName: '$leagueCountry',leagueName: '$leagueName',image: '$leagueImage'),
                  Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>matchItem(GermanyCubit.get(context).groupStage[index])
                        , separatorBuilder:  (context,index)=>SizedBox(
                      height: 10,
                    ), itemCount: GermanyCubit.get(context).groupStage.length),
                  ),



                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
