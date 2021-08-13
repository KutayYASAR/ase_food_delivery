
import 'package:flutter/material.dart';

var orderData= [
  ['101','26 Temmuz 2021','13:51','1 Teslimat','2 Ürün','24.16 TL']
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
            orderInfoCard(orderData[0][0],orderData[0][1],orderData[0][2],orderData[0][3],orderData[0][4],orderData[0][5],)
          ],
        ),
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
                        Text(orderPrice)
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