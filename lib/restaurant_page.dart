import 'package:flutter/material.dart';

var restaurantData =[
  ['Burger King', 'Burger', '4.2', '20-30dk', '20 TL', '4.3', '4.2', '4.5', '11.30-22.00', 'https://bit.ly/37tXNpH']
];

var itemData = [
  ['Big King® Menü','Big King® + Büyük Boy Patates + Kutu İçecek','33.50 TL','https://bit.ly/3fLu4xg'],
  ['BK King Nuggets® (6’lı)','6\lı Nuggets','14.99 TL','https://bit.ly/3AtC2D8'],
  ['Whopper® Menü','Sandviç + Whopper® + Büyük Boy Patates + Kutu İçecek','37.50 TL','https://bit.ly/2Vwcfvd'],
  ['Dörtlü Big King® Fırsatı','4 Adet Big King® + Büyük Boy Patates + Litrelik İçecek','99.99 TL','https://bit.ly/3Cp6zn8'],
  ['Karışık Lezzet Kova','BK King Nuggets® (4\'lü) + Soğan Halkası (8\’li) + Chicken Tenders® (4\'lü) + Patates Kızartması (Orta)','22.99 TL','https://bit.ly/3jDtsdZ'],


];

AppBar appBarRestaurantPage()
{
  return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        title: Padding(
          padding: const EdgeInsets.only(left: 0,right: 60),
          child: Container(
            //  padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),   
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Material(
                color: Colors.grey[300],
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.search,color: Colors.orange),
                    Expanded(
                      child: TextField(
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Yemek Ara',
                          hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey)
                        ),
                        onChanged: (value) {

                        },
                      ),
                    ),
                    InkWell(
                      child: Icon(Icons.mic,color: Colors.grey,),
                      onTap: () {

                      },
                    )
                  ],
                ),
              ),
            )
          ),
        ),
        centerTitle: true,
  );
}

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRestaurantPage(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  color: Colors.deepOrange,
                ),
                Center(
                  child: Column(
                    children: [
                      restaurantListCardItem(restaurantData[0][0], restaurantData[0][1], restaurantData[0][2], restaurantData[0][3], restaurantData[0][4], restaurantData[0][5], restaurantData[0][6], restaurantData[0][7], restaurantData[0][8], restaurantData[0][9]),
                    ],
                  ),
                ),
              ],
            ),
            Column(
            children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return InkWell(child: horizontalListCardItem(itemData[index][0], itemData[index][1], itemData[index][2], itemData[index][3]),
                onTap:(){
                  print('Daha oluşmadı moruk nereye');
                  print(index);
                }
                );
              },
                
              itemCount: itemData.length,
            ),
            ],
            ),
          ],
        ),
        ),
        );
  }

  Padding restaurantListCardItem(String restaurantName, restaurantDescription, restaurantRating, restaurantMinTime, restaurantMinPrice, restaurantService, restaurantTaste, restaurantSpeed, restaurantOpenTime, imageURL) {
    return Padding(
                      padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image(
                                        image: NetworkImage(
                                            imageURL),
                                        height: 100,
                                        width: 130,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurantName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        restaurantDescription,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Card(
                                              clipBehavior: Clip.antiAlias,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 8, 4, 8),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star_rate,
                                                      size: 14,
                                                      color: Colors.white,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                                  .fromLTRB(
                                                              4, 0, 6, 0),
                                                      child: Text(
                                                        restaurantRating,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              color: Colors.greenAccent[400],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .motorcycle_outlined,
                                                      size: 16,
                                                    ),
                                                    Text('  '),
                                                    Text(restaurantMinTime),
                                                    Text('  '),
                                                    Icon(
                                                      Icons.info_outlined,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Min Tutar: '),
                                                    Text(restaurantMinPrice)
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Servis: '),
                                    Text(restaurantService),
                                    const VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                    Text('Lezzet: '),
                                    Text(restaurantTaste),
                                    VerticalDivider(
                                      thickness: 2,
                                    ),
                                    Text('Hız: '),
                                    Text(restaurantSpeed),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 5, 16, 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timer_outlined),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Çalışma Saatleri'),
                                              ],
                                            ),
                                            Row(
                                              children: [Text(restaurantOpenTime)],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.chat_bubble_outline),
                                        Text('Yorumlar'),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
  }

  Card horizontalListCardItem(String itemTitle, String itemDescription, String itemPrice, String imageURL) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                Text(itemTitle, 
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                SizedBox(
                  width: 250,
                  child: Text(itemDescription),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7), 
                  child: Row(
                    children: [
                      Icon(Icons.add_box,
                      color: Colors.deepOrange,
                      ),
                    Text(itemPrice,
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
              child: Image(
                image: NetworkImage(imageURL),
                fit: BoxFit.fill,
                height: 75,
                width: 100,),
            )
          ],
         ),
      ),
    );
  }
}
