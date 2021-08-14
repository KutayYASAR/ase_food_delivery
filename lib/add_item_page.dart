import 'package:flutter/material.dart';


List<FilterChip> createChip (){
  List<FilterChip> chipItems = [];
    
    for (var i = 0; i < ingredientData.length-1; i++) {
      var newItem = FilterChip(
      backgroundColor: Colors.white,
      label: Text(ingredientData[i]),
      shape: RoundedRectangleBorder(side: BorderSide()), 
      onSelected: (bool value) {
        print(i);
      },
    );
    chipItems.add(newItem);
    }
  return chipItems;
}

var ingredientData = [
  'Göbek Salata', 
  'Big King Sos', 
  'Turşu', 
  'Soğan'
];

var itemData = [
  ['Big King® Menü','Big King® + Büyük Boy Patates + Kutu İçecek','33.50 TL','https://bit.ly/3fLu4xg']
];

var otherOptionData = [
  ['Ekstra Malzeme'],
  ['Peynir Seçimi'],
  ['Menü Boyu'],
  ['Patates Seçimi'],
  ['içecek Seçimi']
];

class AddItem extends StatefulWidget {
  const AddItem({ Key? key }) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  

  String dropdownValue = '1';

  var items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
     title: Padding(
       padding: const EdgeInsets.only(right: 60),
       child: Center(child: Text('Burger King', style: TextStyle(color: Colors.white),)),
     ) ,
    backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                color: Colors.deepOrange,
              ),
              Center(
                child: Column(
                  children: [
                    itemCard(itemData[0][0], itemData[0][1], itemData[0][2], itemData[0][3])
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Malzemeler',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text('Lütfen çıkarmak istediğiniz malzemeleri seçiniz',),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: createChip(),
                    ),
                    Row(
                      children: [

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index){
                return InkWell(child: otherOptionCard(otherOptionData[index][0]),
                onTap:(){
                  
                },
                );
              },  
              itemCount: otherOptionData.length,
            ),
        ],
      ),
      ) 
    );
  }

  Padding otherOptionCard(String option) {
    return Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                children: [
                  Text(option,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Spacer(),
                  Icon(Icons.expand_more,
                  color: Colors.deepOrange,
                  ),
                ],
              ),
            ),
          ),
        );
  }

  Padding itemCard(String itemTitle, String itemDescription, String itemPrice, String imageURL) {
    return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Image(
                            image: NetworkImage(imageURL),
                            width: 200,
                            height: 200,
                          ),
                          SizedBox(
                            width: 250,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(itemTitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                                  ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: SizedBox(
                              width: 300,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(itemDescription,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15),
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DropdownButton(
                                  value: dropdownValue,
                                  onChanged: (String? newValue){
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: items.map<DropdownMenuItem<String>>((String value){
                                    return DropdownMenuItem<String>(value: value,
                                    child: Text(value),
                                    );
                                    }).toList()
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(itemPrice,
                                style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
  }
}
