import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footcore/modules/germany/cubit/cubit.dart';
import 'package:footcore/modules/germany/cubit/state.dart';
import 'package:footcore/modules/league_page.dart';
import 'package:footcore/shared/component/component.dart';

class Standing extends StatelessWidget {
  const Standing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GermanyCubit, GermanyState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                // CircleAvatar(
                //   // backgroundImage: NetworkImage('${NewsCubit.get(context).country}'),
                // ),
                // Center(
                //   child: MaterialButton(onPressed: (){
                //     NewsCubit.get(context).getStanding();
                //     },child: Text('click me')),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('#'),

                      Expanded(
                          flex: 3,
                          child: Text('Team')),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('PL',),

                            Text('W'),

                            Text('D'),

                            Text('L'),

                            Text('Pt'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                GermanyCubit.get(context).stand.length==0?Center(child: CircularProgressIndicator(color: Color(leagueColor),)):
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              standingItem(model: GermanyCubit.get(context).stand[index],index: index,url: url),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16,
                              ),
                          itemCount: GermanyCubit.get(context).stand.length),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,

                        decoration: BoxDecoration(
                            color: Colors.green,
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text('TO Champions League group stage')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text('Relegation')
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
