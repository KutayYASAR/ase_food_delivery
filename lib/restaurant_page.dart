import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Sepetim'),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), label: 'Siparişlerim'),
          ],
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.amber[800],
          showUnselectedLabels: true,
        ),
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
                      Padding(
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
                                              'https://iasbh.tmgrup.com.tr/4e079c/650/344/0/52/750/447?u=https://isbh.tmgrup.com.tr/sbh/2019/05/31/burger-king-calisma-saatleri-burger-king-saat-kacta-aciliyor-kacta-kapaniyor-1559325837868.jpg'),
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Burgere Kingü',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'Burger',
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
                                                          '4.2',
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
                                                      Text('  20-30dk  '),
                                                      Icon(
                                                        Icons.info_outlined,
                                                        size: 16,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text('Min Tutar: 20 TL')
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
                                      Text('Servis: 4.4'),
                                      const VerticalDivider(
                                        color: Colors.grey,
                                        thickness: 1,
                                      ),
                                      Text('Lezzet: 4.3'),
                                      VerticalDivider(
                                        thickness: 2,
                                      ),
                                      Text('Hız: Go '),
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
                                                children: [Text('11.30-21.30')],
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
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Row(
                          children: [Text('Kampanyalı Menüler')],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )));
  }
}
