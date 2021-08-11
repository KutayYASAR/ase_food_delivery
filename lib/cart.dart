import 'package:flutter/material.dart';

var cartItems = [['1','2']];

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
                  child: ListView(
                    children: [listItem()],
                        ),
                ),
              ],
            )
          );
    }  
  }


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
                Text('Ekstra Kıtır Dürüm'),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text('20.80 TL'),
                )
              ],
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   SizedBox(
                     width: 34,
                     height: 34,
                     child: IconButton(padding: EdgeInsets.only(right: 18),icon: Icon(Icons.remove,size: 18),onPressed: (){
                       setState(() {
                         _itemCount--;
                       });
                     }),
                   ),
                    Text(_itemCount.toString()),
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: IconButton(padding: EdgeInsets.only(left: 18),icon: Icon(Icons.add,size: 18,),onPressed: (){
                       setState(() {
                         _itemCount++;
                       });
                   }),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
