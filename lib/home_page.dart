import 'package:flutter/material.dart';

 var restaurantData = [
    ['Mc Donald\'s','Burger - Min. 20TL','https://bit.ly/3CmaCAR','4.2'],
    ['Hatay Döner','Döner - Min. 20TL','https://bit.ly/3rZNYt6','4.4'],
    ['Kısmet Pide','Pide - Min. 20TL','https://bit.ly/3AkvjuV','4.6'],
    ['Ali Lahmacun','Lahmacun - Min. 20TL','https://bit.ly/2VETYv5','4.1'],
    ['Gala Kokoreç','Kokoreç - Min. 20TL','https://bit.ly/3fHhJtF','4.7'],
    ['Oses Çiğköfte','Çiğköfte - Min. 20TL','https://bit.ly/2VAuH5N','4.8'],
    ['Green Salads','Salata - Min. 20TL','https://bit.ly/3xyz91I','4.2'],
    ['Dürümcü Mahmut','Kebap - Min. 20TL','https://bit.ly/3AlE8ow','4.5'],
    ['Aşk Waffle','Tatlı - Min. 20TL','https://bit.ly/3rYdT4i','4.3'],
  ];
  var categoryData = [
    ['Burger','https://bit.ly/37qBgdt'],
    ['Kebap','https://bit.ly/3s2bzsZ'],
    ['Pide & Lahmacun','https://bit.ly/3yvg161'],
    ['Tatlı','https://bit.ly/37qfqXp'],
    ['Döner','https://bit.ly/3fIOlTV'],
    ['Sokak Lezzetleri','https://bit.ly/3fFvVDM'],
    ['Pizza','https://bit.ly/2VxDZiW'],
    ['Deniz Ürünleri','https://bit.ly/3CpMP2G'],
      ];
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text('Kampanyalı Restoranlar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ),
                TextButton(onPressed: (){print(restaurantData);} , child: Text('Tümünü Gör',style: TextStyle(color: Colors.orange),))
              ],
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SizedBox(
                  height: 128,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                    return horizontalListCard(restaurantData[index][0],restaurantData[index][1],restaurantData[index][2],restaurantData[index][3]);
                   },
                   itemCount: restaurantData.length,
                  ),
                ),
              ),
            ),
                Align(alignment: Alignment.centerLeft, child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                  child: Text('Mutfaklar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                )),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SizedBox(
                  height: 85,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                    return horizontalListCategory(categoryData[index][0],categoryData[index][1]);
                   },
                   itemCount: categoryData.length,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(alignment: Alignment.centerLeft, child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text('Restoranlar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.center,),
                      )),
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.format_list_bulleted,size: 16,), label: Text('Filtrele'),style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.orange)),)
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 1,
            ),
             Flexible(
              flex: 15,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                return verticalListCardBig(restaurantData[index][0],restaurantData[index][1],restaurantData[index][2],restaurantData[index][3]);
               },
               itemCount: restaurantData.length
              ),
            ),
          ],
        ),
      );
  }

  Wrap horizontalListCard(String restaurantName,String description,String imageURL,String rating) {
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
                              child: Text(rating,style:TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
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
  Wrap horizontalListCategory(String categoryName, String imageURL) {
    return Wrap(
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                    children: [                        
                      Image(image: NetworkImage(imageURL),
                      height: 50,
                      width: 64,
                      fit: BoxFit.scaleDown,
                      ),
                      SizedBox(height: 30 ,width:64 , child: Align(alignment: Alignment.center, child: Text(categoryName,textAlign: TextAlign.center, style: TextStyle(fontSize: 10))))
                     
                    ],
                  ),
                  ),
                ],
              );
  }
  Wrap verticalListCardBig(String restaurantName,String description,String imageURL,String rating) {
    return Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                           
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              child: Image(image: NetworkImage(imageURL),
                              fit: BoxFit.cover,
                              ),
                              height: 200,
                              width: 5000,
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Card(child: Row(children: [Icon(Icons.star_rate, size: 14,color: Colors.white,),Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
                                child: Text(rating,style:TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                              )],), color: Colors.greenAccent[400],),
                            )
                          ],
                        ),
                        SizedBox(
                          
                             child: Padding(
                               padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                               child: ListTile(
                                 dense: true,
                                 visualDensity: VisualDensity(horizontal: 0, vertical: -3),
                                 contentPadding: EdgeInsets.symmetric(horizontal: 4,vertical: 0 ),
                                 leading: Icon(Icons.motorcycle_outlined,size: 24,),
                                  title: Text(restaurantName,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800 
                                  ),),
                                  subtitle: Text(description, style: TextStyle(fontSize: 12),),),
                             ),
                           ),
                      ],
                    ),
                    ),
                  ),
                ],
              );
  }
}