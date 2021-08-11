import 'package:flutter/material.dart';

var cartItems = [['1','2'],[]];

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
          return Column(
            children: [
              Text('xd')
            ],
          );
    } 
  }
}