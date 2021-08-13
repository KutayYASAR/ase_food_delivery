import 'package:flutter/material.dart';

var restaurantCardData = [
  'Oses Çiğköfte',
  '4.2',
  '4.0',  //Servis
  '4.1',  //Lezzet
  '3.8',  //Hız
  '10', //Değerlendirme
  '2', //Yorum
];

class OrderEvaluation extends StatefulWidget {
  const OrderEvaluation({ Key? key }) : super(key: key);

  @override
  _OrderEvaluationState createState() => _OrderEvaluationState();
}

class _OrderEvaluationState extends State<OrderEvaluation> {
  double _currentServiceValue = 4;
  double _currentTasteValue = 4;
  double _currentSpeedValue = 4.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Değerlendir', style: TextStyle(color: Colors.black),) ,
      backgroundColor: Colors.white,
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            restaurantInfo(restaurantCardData[0], restaurantCardData[1], restaurantCardData[2], restaurantCardData[3], restaurantCardData[4], restaurantCardData[5], restaurantCardData[6]),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [Text('Restoranı Değerlendir',
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                        )],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                        child: Row(
                          children: [
                            Text('Servis:'),
                            
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Slider(
                              value: _currentServiceValue,
                              min: 1,
                              max: 5,
                              divisions: 4,
                              label: _currentServiceValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentServiceValue = value;
                                });
                              },
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                        child: Row(
                          children: [
                            Text('Lezzet:'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Slider(
                              value: _currentTasteValue,
                              min: 1,
                              max: 5,
                              divisions: 4,
                              label: _currentTasteValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentTasteValue = value;
                                });
                              },
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                        child: Row(
                          children: [
                            Text('Kurye Hizmeti:'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Slider(
                              value: _currentSpeedValue,
                              min: 1,
                              max: 5,
                              divisions: 4,
                              label: _currentSpeedValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSpeedValue = value;
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),),
            )

          ],
        ),
      ),
    );
  }

  Padding restaurantInfo(String restaurantName, String rating, String service, String taste, String speed, String evaluation, String comment) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(restaurantName,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 8),
                  child: Row(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(7)),
                        child: Padding(
                          padding:
                            const EdgeInsets.fromLTRB(2, 8, 2, 8),
                          child: Row(
                            children: [
                            Icon(
                              Icons.star_rate,
                              size: 23,
                              color: Colors.white,
                            ),
                            Padding(
                              padding:
                                const EdgeInsets.fromLTRB(7, 0, 7, 0),
                              child: Text(rating,
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 23),
                             ),
                            ),
                            ],
                          ),
                        ),
                        color: Colors.greenAccent[400],
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                         child: Column(
                           children: [
                             Row(
                               children: [
                                 Text('Servis   '),
                                 Text(service),
                             ],
                             ),
                             Row(
                               children: [
                                 Text('Lezzet   '),
                                 Text(taste),
                             ],
                             ),
                             Row(
                               children: [
                                 Text('Hız   '),
                                 Text(speed),
                             ],
                             ),
                           ],
                         ),
                       )
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.star,),
                      Text('$evaluation Değerlendirme '),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Icon(Icons.chat_bubble_outline),
                      Text('$comment Yorum'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}