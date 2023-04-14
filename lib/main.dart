import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nike/shoe_config/shoe_properties.dart';

void main()
{
  runApp(myapp());
}
class myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class homepage extends StatelessWidget
{
  List<shoe_properties> all_shoes=[
    shoe_properties(price: "\$240.67", name: "Nike Air Max Alpha Trainer 5", imagePath:"assets/images/nike_air_max_aplha_trainer5.jpg" ),
    shoe_properties(price: "\$140", name: "Nike Air Zoom", imagePath:"assets/images/nike_air_zoom.webp" ),
    shoe_properties(price: "\$110.39", name: "Nike Men Revolution", imagePath:"assets/images/nike_men_revolution.webp" ),
    shoe_properties(price: "\$340", name: "Nike WildHorse 7", imagePath:"assets/images/nike_wildhorse7.webp" ),


  ];
  List<shoe_properties> sale_shoes=[
    shoe_properties(price: "\$213", name: "Nike Dunk", imagePath: "assets/images/nike_dunk.jpg"),
    shoe_properties(price: "\$103", name: "Nike Gym", imagePath: "assets/images/nike_precision.png"),
    shoe_properties(price: "\$145", name: "Nike StreakFly", imagePath: "assets/images/nike_streakfly.png"),
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          activeColor: Colors.black,
          onTabChange: (value){

          },
          tabs: [
            GButton(icon: Icons.home_filled,iconSize: 30,),
            GButton(icon: Icons.search,iconSize: 30,),
            GButton(icon: Icons.favorite_border,iconSize: 30,),
            GButton(icon: Icons.person,iconSize: 30,),
          ],
        ),
      ) ,

      appBar: AppBar(

          backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: 15,),
          Text(" Nike\n Collection",style: TextStyle(height: 1.5,fontSize: 35,fontWeight: FontWeight.bold),),

          
          SingleChildScrollView(
            physics: BouncingScrollPhysics(
              
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for(int i=0;i<all_shoes.length;i++)
                  Container(
                    width: 400,
                    height: 300,


                    child: Stack(
                      children: [
                        Container(
                      margin: EdgeInsets.only(left: 20, top: 30),
                      width: 400,
                      height: 300,


                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(all_shoes[i].imagePath,
                         fit: BoxFit.fitWidth,alignment:Alignment(0.6,0.6), ),
                      ),

                        ),
                        
                          Positioned(
                              bottom: 35,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(all_shoes[i].name),
                              )),
                        Positioned(
                          bottom: 10,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(all_shoes[i].price),
                            ))
                        ],
                    ),
                  ),



              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10,top: 20,right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special Deal",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("see all",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.red.shade400),),
              ],
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(int i=0;i<3;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                      child: Container(
                      width: 200,height: 200,
                      decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(11),
                        
                    ),
                        child: Image.asset(sale_shoes[i].imagePath,fit: BoxFit.fitWidth,alignment: Alignment(0.6,0.6),),
                  ),
                )
              ],
            ),
          ),

        ],
      ) ,
    );
  }
}
