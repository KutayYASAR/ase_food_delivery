import 'package:flutter/material.dart';
import 'package:food_delivery/details_page.dart';

List orderinfos=[
['Oses Çiğ Köfte','09 Temmuz 2021','16:25','30.50'],
['Burger King','18 Temmuz 2021','16:56','24.90']
];

AppBar appBarOrder() {
    return AppBar(
      title: Center(child: Text('Siparişlerim', style: TextStyle(color: Colors.black),)) ,
      backgroundColor: Colors.white,

    );
  }

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap:true,
          itemCount: orderinfos.length,
          itemBuilder: (BuildContext context, int index) {
          return InkWell(child: orderCard(orderinfos[index][0],orderinfos[index][1],orderinfos[index][2],orderinfos[index][3]),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage()));
          },
          );
         },
        ),
      ],
    );

  }

  Padding orderCard(String restaurantName,String orderDate,String orderTime,String totalPrice) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(10,8,10,0),
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
                        Text('$orderDate / $orderTime', style: TextStyle(fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('Detaylar >',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text('Toplam:',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
                      Text(' $totalPrice TL',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w500),)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8 ),
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
                  Row(
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(right:5),
                      child: OutlinedButton.icon(onPressed: (){}, icon: Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: Icon(Icons.repeat, color: Colors.deepOrange,),
                      ), label: Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Text('Tekrarla',style: TextStyle(color: Colors.black),),
                      )),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left:5),
                      child: OutlinedButton.icon(onPressed: (){}, icon: Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: Icon(Icons.star, color: Colors.deepOrange,),
                      ), label: Padding(
                        padding: const EdgeInsets.only(right:10),
                        child: Text('Değerlendir',style: TextStyle(color: Colors.black)),
                      )),
                    )
                  ],),
                ],
              ),
            ),

          ),
        );
  }


}





