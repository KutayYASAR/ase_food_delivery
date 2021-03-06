import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

var restaurantCardData = [
  'Oses Çiğköfte (Siyavuşpaşa Mah)',
  '4.2',
  '4.0',  //Servis
  '4.1',  //Lezzet
  '3.8',  //Hız
  '10', //Değerlendirme
  '2', //Yorum
];

class OrderRating extends StatefulWidget {
  const OrderRating({ Key? key }) : super(key: key);

  @override
  _OrderRating createState() => _OrderRating();
}

class _OrderRating extends State<OrderRating> {
  var serviceValue = double.parse(restaurantCardData[2]);
  var tasteValue = double.parse(restaurantCardData[3]);
  var speedValue = double.parse(restaurantCardData[4]);

  TextEditingController commentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

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
            restaurantRatingCard(),
            commentCard(),
            
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){}, 
                  child: Text('Gönder',
                  style: TextStyle(color: Colors.white),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                    backgroundColor: Colors.amber[900],
                    minimumSize: Size(width-20,35),
                  )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding commentCard() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Yorum Yap',
                        style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: commentController,
                        textAlign: TextAlign.left,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Siparişinizle ilgili yorumunuzu buraya yazabilirsiniz.',
                          hintMaxLines: 2,
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        ),
                    ),
                  ],
                ),
              ),
              ),
          );
  }

  Padding restaurantRatingCard() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
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
                        RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 50,
                        unratedColor: Colors.grey[400],
                        itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.red,
                              );
                            case 1:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.redAccent,
                              );
                            case 2:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              );
                            case 3:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.lightGreen,
                              );
                            case 4:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.green,
                              );
                            default:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.orangeAccent,
                              );
                          }
                        },
                        onRatingUpdate: (ratingService) {
                          print(ratingService);
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
                        RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 50,
                        unratedColor: Colors.grey[400],
                        itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.red,
                              );
                            case 1:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.redAccent,
                              );
                            case 2:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              );
                            case 3:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.lightGreen,
                              );
                            case 4:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.green,
                              );
                            default:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.orangeAccent,
                              );
                          }
                        },
                        onRatingUpdate: (ratingTaste) {
                          print(ratingTaste);
                        },
                      ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                      child: Row(
                        children: [
                          Text('Kurye Hızı:'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 50,
                        unratedColor: Colors.grey[400],
                        itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.red,
                              );
                            case 1:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.redAccent,
                              );
                            case 2:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              );
                            case 3:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.lightGreen,
                              );
                            case 4:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.green,
                              );
                            default:
                              return Icon(
                              Icons.star_rounded,
                              color: Colors.orangeAccent,
                              );
                          }
                        },
                        onRatingUpdate: (ratingSpeed) {
                          print(ratingSpeed);
                        },
                      ),
                      ],
                    ),
                  ],
                ),
              ),),
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
                              Icons.star_rounded,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Servis:',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                            ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Text('Lezzet:',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                              ),
                            ),
                            Row(
                              children: [
                                Text('Hız:',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                            ],
                            ),
                          ],
                        ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                RatingBarIndicator(
                                rating: serviceValue,
                                itemBuilder: (context, index) => Icon(
                                     Icons.star_rounded,
                                     color: Colors.amber[900],
                                ),
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                ),
                                Text('   $service', style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                rating: tasteValue,
                                itemBuilder: (context, index) => Icon(
                                     Icons.star_rounded,
                                     color: Colors.amber[900],
                                ),
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                ),
                                Text('   $taste', style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                rating: speedValue,
                                itemBuilder: (context, index) => Icon(
                                     Icons.star_rounded,
                                     color: Colors.amber[900],
                                ),
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                ),
                                Text('   $speed', style: TextStyle(color: Colors.amber[900], fontWeight: FontWeight.bold, fontSize: 15),),
                              ],
                            )
                          ],
                        )
                    ],
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_rounded, color: Colors.grey.shade600,),
                          Text(' $evaluation Değerlendirme'),
                        ],
                      ),
                      VerticalDivider(
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Icon(Icons.chat_bubble_outline),
                          Text(' $comment Yorum    '),
                        ],
                      )
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