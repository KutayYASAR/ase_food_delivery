
import 'dart:ui';

import 'package:flutter/material.dart';

var orderData= [
  ['101','26 Temmuz 2021','13:51','1 Teslimat','2 Ürün','24.16']
];
var deliveryData= [
  ['25-35 dk','10','Oses Çiğ Köfte','26 Temmuz Pazartesi','14:15']
];
var itemData= [
  ['Çiğ Köfte (1 kg.)','1','24.16'],
  ['Çiğ Köfte (1 kg.)','2','25.16']
];
var infosData= [
  ['Teslimat Adresim','Kemal Kutay Yaşar','Adres gelecekaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','Kısa Adres Gelecek','05380300525']
];
String restaurantName= 'Oses Çiğ Köfte';

class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: Center(child: Text('Sipariş Detay',style: TextStyle(color: Colors.black),),),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            restaurantCard(),
            orderInfoCard(orderData[0][0],orderData[0][1],orderData[0][2],orderData[0][3],orderData[0][4],orderData[0][5],),
            orderDetails(deliveryData[0][0],deliveryData[0][1],deliveryData[0][2],deliveryData[0][3],deliveryData[0][4],),
            deliveryInfos(width, infosData[0][0],infosData[0][1],infosData[0][2],infosData[0][3],infosData[0][4],),

          ],
        ),
      ),
    );
  }

  Card deliveryInfos(double width, String deliveryInfo,String deliveryName,String deliveryLongAdress,String deliveryShortAdress,String personalNumber) {
    return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('$deliveryInfo',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.deepOrange),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: Row(
                        children: [
                          Text('$deliveryName',style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width:width-32,child: Text('$deliveryLongAdress'))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: Row(
                        children: [
                          Text('$deliveryShortAdress',style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('$personalNumber')
                      ],
                    ),
                  ],
                ),
              ),
            );
  }

  Card orderDetails(String deliveryAverageTime,String deliveryNumber,String restaurantName,String deliveryDate,String deliveryTime) {
    return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Tahmini Teslimat Süresi: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                      Text(deliveryAverageTime)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7,bottom: 7),
                    child: Row(
                      children: [
                        Text('Teslimat No: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                        Text(deliveryNumber)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Restoran: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                      Text(restaurantName)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5,bottom:5),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Row(
                  children: [
                    Icon(Icons.check, color: Colors.greenAccent.shade700,),
                    Text('Teslim edildi',style: TextStyle(color: Colors.greenAccent.shade700,fontWeight: FontWeight.w700),)
                  ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3,bottom: 7),
                    child: Row(
                    children: [
                      Text('Teslimat: ',style: TextStyle(fontSize: 13),),
                      Text('Trendyol Go',style: TextStyle(fontWeight: FontWeight.w600),)
                    ],
                    ),
                  ),
                  Row(
                  children: [
                    Icon(Icons.info_outline,color: Colors.greenAccent.shade700,),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Siparişiniz '),
                              Text('$deliveryDate ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('günü saat ')
                            ],
                          ),
                          Row(
                            children: [
                              Text('$deliveryTime\'te ', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('teslim edilmiştir.')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return orderDetailsItemCard(itemData[index][0], itemData[index][1], itemData[index][2]);
                    },
                    itemCount: itemData.length,
                  ),
                ], 
              ),
            ),
          );
  }

  Card orderDetailsItemCard(String itemName,String itemPiece,String itemPrice) {
    return Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                      children: [
                        Text(itemName)
                      ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Adet: $itemPiece'),
                          Text('$itemPrice TL',style: TextStyle(color: Colors.deepOrange,fontSize: 17, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  ),
                );
  }

  Padding orderInfoCard(String orderNumber,String orderDate,String orderTime,String orderDelivery,String orderPiece,String orderPrice) {
    return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Sipariş No: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                        Text(orderNumber)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7,bottom: 7),
                      child: Row(
                        children: [
                          Text('Sipariş Tarihi: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                          Text('$orderDate / $orderTime')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Row(
                        children: [
                          Text('Sipariş Özeti: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                          Text('$orderDelivery, ',style: TextStyle(color: Colors.greenAccent),),
                          Text(orderPiece)
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('Toplam: ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600),),
                        Text('$orderPrice TL')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Padding restaurantCard() {
    return Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Text(restaurantName,style: TextStyle(fontSize: 17,fontWeight:FontWeight.w600)),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.repeat,color: Colors.deepOrange,),
                          Text('Tekrarla',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w600)),
                          VerticalDivider(
                            thickness: 2,
                          ),
                          Icon(Icons.star,color: Colors.deepOrange,),
                          Text('Değerlendir',style: TextStyle(fontSize: 14,fontWeight:FontWeight.w600)),
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