import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/league_page.dart';
import 'package:footcore/shared/network/dio.dart';


class GermanyCubit extends Cubit<GermanyState> {
  GermanyCubit() : super(GermanyInitialState());

  static GermanyCubit get(context) => BlocProvider.of(context);


  List<dynamic> stand = [];
  Map<String, dynamic> stand1 = {};


  var leagueCode;

  void getStanding(url) {
    DioHelper.getData(url: 'v4/competitions/$url/standings', query: {
    }).then((value) {
      stand = value.data['standings'][0]['table'];

      // for(int i =0;i<stand.length;i++){
      //
      // }
      print(stand);
      emit(GetGermanyStandingState());
    }).catchError((error) {
      print(error.toString());
    });
  }

  List<dynamic>topScore = [];

  void getTopScorerGermany(url) {
    DioHelper.getData(url: 'https://api.football-data.org/v4/competitions/$url/scorers').then((value) {
      topScore = value.data['scorers'];
      emit(GetGermanyScorerState());
    }).catchError((error) {
      print(error);
    });
  }

  DateTime now= new DateTime.now();
  var year;
  var month;
  var monthS;
  var monthE;
  var dayfrom;
  var dayto;
  var dateS;
  var dateE;
  void getdate(){
    month=now.month;
    year=now.year;
    if(month==1 ||month==3 ||month==5 ||month==7 ||month==8 ||month==10 ||month==12)
    {
      if(now.day>=8&&now.day<25){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;


      }
      else if(now.day<8){
        if(month==1)
        {
          dayfrom=now.day+24;
          dayto=now.day+7;
          month=12;
          year=now.year-1;
        }
        else {
          dayfrom = now.day + 23;
          monthS=now.month-1;
          monthE=now.month;
          dayto=now.day+7;
        }
      }
      else if(now.day>24)
      {
        if(month==12){
          monthE=1;
          year=now.year+1;
          dayto=now.day-24;
          dayfrom=now.day-7;
          monthS=now.month;

        }
        else {
          dayto = now.day - 24;
          dayfrom=now.day-7;
          monthE=now.month+1;
          monthS=now.month;
        }
      }
    }
    if(month==4||month==6||month==9||month==11)
    {
      if(now.day>=8&&now.day<25){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;
      }
      if(now.day<8) {
        dayfrom = now.day - 24;
        dayto=now.day+7;
        monthS=now.month-1;
        monthE=now.month;
      } else if(now.day>23) {
        dayto = now.day - 23;
        dayfrom=now.day-7;
        monthE=month+1;
        monthS=now.month;
      }
    }
    if(month==2)
    {
      if(now.day>=8&&now.day<21){
        dayfrom=now.day-7;
        dayto=now.day+7;
        monthE=now.month;
        monthS=now.month;
      }
      if(now.day<8) {
        dayfrom = now.day - 24;
        dayto=now.day+7;
        monthS=now.month-1;
        monthE=now.month;
      } else if( now.day>21) {
        dayto = now.day - 20;
        dayfrom=now.day-7;
        monthE=month+1;
        monthS=now.month;
      }
    }
    dateS='$year-$monthS-$dayfrom';
    dateE='$year-$monthE-$dayto';
    print(dateS);
    print(dateE);


  }

  List<dynamic> fixtureList=[];
  void getFixture(url) {
    getMatchday(url);
    DioHelper.getData(url: 'https://api.football-data.org/v4/competitions/$url/matches',
      query: {
      'matchday':'${matchDay.toString()}'
      }
        ).then((value) {
      fixtureList=value.data['matches'];
      emit(GetGermanyFixtureSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(GetGermanyFixtureErrorStates());
    });
  }

  void getMatchday(url){
    DioHelper.getData(url: 'http://api.football-data.org/v4/competitions/$url').then((value) {
      matchDay = (value.data['currentSeason']['currentMatchday']);
      print(matchDay);
      emit(GetGermanyScorerState());
    }).catchError((error) {
      print(error);
    });
  }

  List allTeamsCL=[];

  List groupStage=[];
  List groupStageA=[];
  List groupStageB=[];
  List groupStageC=[];
  List groupStageD=[];
  List groupStageE=[];
  List groupStageF=[];
  List groupStageG=[];
  List groupStageH=[];

  void getChampionLeague(){
    DateTime now = DateTime.now();
    int currentYear = now.year;
    currentYear=currentYear-1;
    DioHelper.getData(url: 'http://api.football-data.org/v4/competitions/CL/matches',query: {
      'season':'$currentYear'
    }).then((value) {
      allTeamsCL = value.data['matches'];
      print(allTeamsCL[2]);
      for(int i=0;i<allTeamsCL.length;i++)
        {
          if(allTeamsCL[i]['stage']=='GROUP_STAGE'||allTeamsCL[i]['stage']=='FINAL'||allTeamsCL[i]['stage']=='SEMI_FINALS'||allTeamsCL[i]['stage']=='QUARTER_FINALS'||allTeamsCL[i]['stage']=='LAST_16')
            groupStage.add(allTeamsCL[i]);
        }
      print('${groupStage}  weeeeeeeeee');

      for(int i=0;i<groupStage.length;i++){
        if(groupStage[i]['group']=='GROUP_A')
          groupStageA.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_B')
          groupStageB.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_C')
          groupStageC.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_D')
          groupStageD.add(groupStage);
        if(allTeamsCL[i]['group']=='GROUP_E')
          groupStageE.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_F')
          groupStageF.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_G')
          groupStageG.add(groupStage[i]);
        if(allTeamsCL[i]['group']=='GROUP_H')
          groupStageH.add(groupStage[i]);
      }
      print('${groupStageA}here it is');
      emit(GetGermanyScorerState());
    }).catchError((error) {
      print(error);
    });
  }

}
