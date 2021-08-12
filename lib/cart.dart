import 'package:flutter/material.dart';
import 'package:food_delivery/home_page.dart';

var cartItems = [['Ekstra Kıtır Dürüm','20.80']];

  AppBar appBarCart() {
    var cartLenght = cartItems.length;
     if (cartItems.any((element) => element.isEmpty)) {
      return AppBar(
      title: Center(child: Text('Sepetim', style: TextStyle(color: Colors.black),)) ,
      backgroundColor: Colors.white
      );
     } 
     else {
      return AppBar(
      title: Center(child: Text('Sepetim ($cartLenght)', style: TextStyle(color: Colors.black),)) ,
      backgroundColor: Colors.white
      );
     }
    
  }

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    if (cartItems.any((element) => element.isEmpty)) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('Sepetin Boş',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.grey.shade700)),
                ),
                Text('Sepetinde ürün bulunmamaktadır.',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey.shade500)),
                Text('Hemen alışverişe başla!',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey.shade500)),
                Padding(
                  padding: const EdgeInsets.only(top: 36,left: 28,right: 28),
                  child: SizedBox(width: double.infinity,height: 60, child: ElevatedButton(onPressed: (){}, 
                  child: Text('Alışverişe Başla',
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18)),
                  style: 
                  ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.amber[800])
                  )
                  ,)),
                )
              ],
            ),
          );
    } else {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length+1,
                    itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return listTopCard(restaurantData[0]);
                    } else {
                      return listItem();
                    }
                   },
                  ),
                ),
              ],
            )
          );
    }  
  }

}

Card listTopCard(List<String> rData)
{
  return Card(child: 
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Image(
              image: NetworkImage(rData[2]),
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),

          ),
        )
        ,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:8.0,left: 3),
              child: Text(rData[0],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,color: Colors.grey.shade800),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:3.0),
              child: Row(
                children: [
                  Card(child: Row(children: [Icon(Icons.star_rate, size: 14,color: Colors.white,),Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(rData[3],style:TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                  )],), color: Colors.greenAccent[400],),
                            Icon(Icons.motorcycle),
                            Text(rData[1])

                ],
              ),
            )

          ],
        )
      ],
    )
  );
}

class listItem extends StatefulWidget {
  listItem({Key? key}) : super(key: key);

  @override
  _listItemState createState() => _listItemState();
}

class _listItemState extends State<listItem> {
  int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItems[0][0],style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w700),),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text('${cartItems[0][1]} TL',style: TextStyle(color: Colors.amber[800],fontWeight: FontWeight.w700,fontSize: 15),),
                )
              ],
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child:  Padding(
                padding: const EdgeInsets.only(left:10,right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     SizedBox(
                       width: 34,
                       height: 34,
                       child: IconButton(padding: EdgeInsets.only(right: 18),icon: Icon(Icons.remove,size: 20,color: Colors.amber[800]),onPressed: (){
                         setState(() {
                           _itemCount--;
                         });
                       }),
                     ),
                      Text(_itemCount.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),),
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: IconButton(padding: EdgeInsets.only(left: 18),icon: Icon(Icons.add,size: 20,color: Colors.amber[800]),onPressed: (){
                         setState(() {
                           _itemCount++;
                         });
                     }),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
