import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/cubit/cubit.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/germany/fixture.dart';
import 'package:footcore/modules/germany/standing.dart';
import 'package:footcore/modules/germany/top_scorer.dart';
import 'package:footcore/modules/league_page.dart';
import 'package:footcore/shared/component/component.dart';

class MainLeaguePage extends StatelessWidget {
  const MainLeaguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GermanyCubit()..getStanding(url)..getTopScorerGermany(url)..getMatchday(url),
      //..getFixture(leagueCode)..
      child: BlocConsumer<GermanyCubit,GermanyState>(
        listener: (context,state){},
        builder: (context,state){
          return  DefaultTabController(length: 3, child: Scaffold(
            body: SafeArea(
              child: Column(

                children: [
                  leagueTitle(colorCode: leagueColor,countryName: '$leagueCountry',leagueName: '$leagueName',image: '$leagueImage'),
                  Material(
                    color: Color(leagueColor),
                    child: TabBar(

                        tabs:[
                          Tab(
                            child: Text('Standing'),
                          ),Tab(
                            child: Text('Fixtuer'),
                          ),Tab(
                            child: Text('Top Scorer'),
                          )
                        ]
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Standing(),
                      Fixture(),
                      TopScorer()
                    ]),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
