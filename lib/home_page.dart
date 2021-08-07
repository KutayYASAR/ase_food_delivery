import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  var restaurantData = [
    ['Mc Donald\'s','Burger - Min. 20TL','https://bit.ly/3CmaCAR'],
    ['Hatay Döner','Döner - Min. 20TL','https://bit.ly/3rZNYt6'],
    ['Kısmet Pide','Pide - Min. 20TL','https://bit.ly/3AkvjuV'],
    ['Ali Lahmacun','Lahmacun - Min. 20TL','https://bit.ly/2VETYv5'],
    ['Gala Kokoreç','Kokoreç - Min. 20TL','https://bit.ly/3fHhJtF'],
    ['Oses Çiğköfte','Çiğköfte - Min. 20TL','https://bit.ly/2VAuH5N'],
    ['Green Salads','Salata - Min. 20TL','https://bit.ly/3xyz91I'],
    ['Dürümcü Mahmut','Kebap - Min. 20TL','https://bit.ly/3AlE8ow'],
    ['Aşk Waffle','Tatlı - Min. 20TL','https://bit.ly/3rYdT4i'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Anasayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: 'Sepetim'),
        BottomNavigationBarItem(icon: Icon(Icons.fastfood),label: 'Siparişlerim'),
      ], unselectedItemColor: Colors.grey[700],
      selectedItemColor: Colors.amber[800],
      showUnselectedLabels: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text('Kampanyalı Restoranlar',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                TextButton(onPressed: (){print(restaurantData);} , child: Text('Tümünü Gör',style: TextStyle(color: Colors.orange),))
              ],
            ),
            Flexible(
              flex: 4,
              child: SizedBox(
                height: 128,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                  return horizontalListCard(restaurantData[index][0],restaurantData[index][1],restaurantData[index][2]);
                 },
                 itemCount: restaurantData.length,
                ),
              ),
            ),
                Align(alignment: Alignment.centerLeft, child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text('Mutfaklar',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                )),

          ],
        ),
      ),
    );
  }

  Wrap horizontalListCard(String restaurantName,String description,String imageURL) {
    return Wrap(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                    children: [
                         
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(image: NetworkImage(imageURL),
                          height: 64,
                          width: 128,
                          fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Card(child: Row(children: [Icon(Icons.star_rate, size: 14,color: Colors.white,),Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
                              child: Text('4.2',style:TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                            )],), color: Colors.greenAccent[400],),
                          )
                        ],
                      ),
                      SizedBox(
                        
                           width:128,
                           child: ListTile(
                             dense: true,
                             visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                             contentPadding: EdgeInsets.symmetric(horizontal: 4,vertical: 0 ),
                              title: Text(restaurantName,style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800 
                              ),),
                              subtitle: Text(description, style: TextStyle(fontSize: 10),),),
                         ),
                    ],
                  ),
                  ),
                ],
              );
  }
}