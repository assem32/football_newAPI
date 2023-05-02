import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

Widget standingItem({model,index,url}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if(url=='PD'||url=='PL'||url=='FL1'||url=='SA')
          if(index>=0&&index<4)
          Row(
            children: [
              Container(
                color: Colors.green,
                width: 5,
                height: 30,
              ),
              Text('${model['position']}-'),
            ],
          ),
        if(url=='PD'||url=='PL'||url=='FL1'||url=='SA')

          if(index >16)
          Row(
            children: [
              Container(
                color: Colors.red,
                width: 5,
                height: 30,
              ),
              Text('${model['position']}-'),
            ],
          ),
        if(url=='PD'||url=='PL'||url=='FL1'||url=='SA')

          if(index>3&&index<17)
            Text('${model['position']}-'),


          if(url=='BL1')
            if(index>=0&&index<4)
            Row(
              children: [
                Container(
                  color: Colors.green,
                  width: 5,
                  height: 30,
                ),
                Text('${model['position']}-'),
              ],
            ),
        if(url=='BL1')
          if(index >14)
            Row(
            children: [
              Container(
                color: Colors.red,
                width: 5,
                height: 30,
              ),
              Text('${model['position']}-'),
            ],
          ),
        if(url=='BL1')
          if(index>3&&index<15)
            Text('${model['position']}-'),


        Expanded(flex: 3, child: Row(
          children: [
            (model['team']['crest']).contains('.svg')?SvgPicture.network('${model['team']['crest']}',height: 30,width: 30,):Image.network('${model['team']['crest']}',height: 30,width: 30,),
            Expanded(child: Text('${model['team']['name']}',overflow: TextOverflow.ellipsis)),
          ],
        )),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${model['playedGames']}'),
              Text('${model['won']}'),
              Text('${model['draw']}'),
              Text('${model['lost']}'),
              Text('${model['points']}'),
            ],
          ),
        ),
      ],
    );

Widget leagueTitle({colorCode, image, leagueName, countryName}) => Container(
      color: Color(colorCode),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                height: 105,
                width: leagueName == 'Bundesliga' ? 100 : 75,
                child: Image.asset(image)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$leagueName',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '$countryName',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );

Widget scorerItem({model, index}) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.white
  ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Text('${index+1}'),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Flexible(child: Text('${model['player']['name']}')),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(

                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(

                                child: Text(
                              'Teams: ${model['team']['name']}',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  if(model['penalties']==null)
                    Text(
                      'Penalty: 0',
                      style: TextStyle(color: Colors.grey),
                    ),
                  if(model['penalties']!=null)
                  Text(
                    'Penalty: ${model['penalties']}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Text(
              'Goals: ${model['goals']}',
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );

Widget matchItem(model) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child:
                model['homeTeam']['shortName']==null?Text(''):
                  Text(
                    '${model['homeTeam']['shortName']}',
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    softWrap: false,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )),
            Container(
              width:  model['homeTeam']['shortName']==null? 140:40,
                height: 40,
                child:
                model['homeTeam']['shortName']==null?Text('waiting for qualifiers '):
                (model['homeTeam']['crest']).contains('.svg')?SvgPicture.network('${model['homeTeam']['crest']}',height: 30,width: 30,):Image.network('${model['homeTeam']['crest']}',height: 30,width: 30,),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  model['score']['fullTime']['away']==null?Text(''):
                  Text('${model['score']['fullTime']['home']}'),
                  Column(

                    children: [
                      model['homeTeam']['shortName']==null?Text(''):
                      Text('${DateFormat('yyyy-MM-dd').format(DateTime.parse('${model['utcDate']}'))}'),
                      model['homeTeam']['shortName']==null?Text(''):
                      Text('${model['status']}'),
                      model['homeTeam']['shortName']==null?Text(''):
                      Text('${DateFormat('hh:mm a').format( DateTime.parse(model['utcDate']).toLocal())}'),
                    ],
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  model['score']['fullTime']['away']==null?Text(''):
                  Text('${model['score']['fullTime']['away']}'),
                ],
              ),
            ),
            SizedBox(
              width: 4,
            ),
            model['homeTeam']['shortName']==null?Text(''):
            Container(
                width: 40,
                height: 40,
                child:
                (model['awayTeam']['crest']).contains('.svg')?SvgPicture.network('${model['awayTeam']['crest']}',height: 30,width: 30,):Image.network('${model['awayTeam']['crest']}',height: 30,width: 30,),
            ),
            SizedBox(
              width: 4,
            ),
            model['homeTeam']['shortName']==null?Text(''):
            Expanded(
                child: Text(
              '${model['awayTeam']['shortName']}',
              overflow: TextOverflow.fade,
            ))
          ],
        ),
      ),
    );

Widget leagueItem(image, function) => Expanded(
      child: InkWell(
        onTap: () {
          function();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Image.asset(image),
          ),
        ),
      ),
    );
