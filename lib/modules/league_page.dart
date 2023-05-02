import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/champions_league.dart';
import 'package:footcore/modules/germany/cubit/cubit.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/germany/maIn_league_screen.dart';
import 'package:footcore/shared/component/component.dart';
import 'package:footcore/shared/network/dio.dart';


var leagueCode;
var leagueName;
var leagueCountry;
var leagueImage;
var leagueColor;

var url;
 int ? matchDay;

class LeaguesPage extends StatelessWidget {
  const LeaguesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>GermanyCubit(),
      child: BlocConsumer<GermanyCubit,GermanyState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              backgroundColor: Colors.grey[300],
              elevation: 0,
              title: Center(child: Text('Commpetitions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        leagueItem('assets/premier-league-2-logo.png',(){
                          url='PL';
                          leagueName='Premier League';
                          leagueCountry='England';
                          leagueImage='assets/english.png';
                          leagueColor=0xff3d195b;
                          GermanyCubit.get(context).getMatchday(url);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));
                        }),
                        leagueItem('assets/laliga-logo.png',(){
                          url='PD';
                          leagueName='La Liga';
                          leagueCountry='Spain';
                          leagueImage='assets/laliga-logo.png';
                          leagueColor=0xff0c519c;
                          GermanyCubit.get(context).getMatchday(url);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                        })

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        leagueItem('assets/bundesliga-logo.png',(){
                          // leagueCode=175;
                          url='BL1';
                          leagueName='Bundesliga';
                          leagueCountry='Germany';
                          leagueImage='assets/bundesliga-logo.png';
                          leagueColor=0xffd20515;
                          GermanyCubit.get(context).getMatchday(url);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));


                          // DioHelper.getData(url: 'v4/competitions/PL', ).then((value) {
                          //   print(value.data);
                          // });



                        }),
                        leagueItem('assets/serie-a-logo.png',(){
                          url='SA';
                          leagueName='Serie-A';
                          leagueCountry='Italy';
                          leagueImage='assets/serie-a-logo.png';
                          leagueColor=0xff024494;
                          GermanyCubit.get(context).getMatchday(url);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                        }),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        leagueItem('assets/ligue-1-logo.png',(){
                          url='FL1';
                          leagueName='Ligue 1';
                          leagueCountry='France';
                          leagueImage='assets/ligue-1-logo.png';
                          leagueColor=0xff12233f;
                          GermanyCubit.get(context).getMatchday(url);

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLeaguePage()));

                        }),
                        leagueItem('assets/champion dark.png',
                                (){
                              leagueCode=141;
                              leagueName='Champions League';
                              leagueCountry='Europe';
                              leagueImage='assets/ucl-logo.png';
                              leagueColor=0xff0E1E5B;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChampionLeague()));

                            }),
                      ],
                    ),
                  ),

                  // MaterialButton(onPressed: (){
                  //   leagueCode=207;
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MainGermanyPage()));
                  // },child: Text('italy'),),
                  // MaterialButton(onPressed: (){
                  //   leagueCode=175;
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MainGermanyPage()));
                  //
                  // },child: Text('germany'),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
