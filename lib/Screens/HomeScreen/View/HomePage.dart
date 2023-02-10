import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_rating/Screens/HomeScreen/Controller/HomeController.dart';
import 'package:movies_rating/Screens/HomeScreen/Model/MoviesModel.dart';
import 'package:movies_rating/Utils/Api_Http.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black87,
                Colors.black54,
                Colors.black38,
                Colors.black12,
                Colors.white10,
                Colors.white60,
              ]
            ),
          ),
          child: Column(
            children: [
              Container(
                height: Get.height/12,
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: Get.width/30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Get.height/21,
                      width: Get.width/2.6,
                      child: Text(
                        "Movie's Rating",
                        style: GoogleFonts.caveatBrush(
                          fontSize: 21.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Obx(
                      () => AnimatedContainer(
                        width: homeController.isOn.value?Get.width/2.6:0.0,
                        height: Get.height/21,
                        duration: Duration(seconds: 3),
                        child: TextField(
                          style: GoogleFonts.caveatBrush(color: Colors.white),
                          controller: homeController.txtSearch.value,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            hintText: "Search Ex. bahubali",
                              hintStyle: GoogleFonts.caveatBrush(color: Colors.white),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 1.5),),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 1.5),),
                          ),
                          onSubmitted: (value) {
                            homeController.Search();
                            ApiHttp().GetMovieData(homeController.search.value);
                          },
                        ),
                        // color: Colors.red,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        homeController.Search();
                        homeController.isOn.value = !homeController.isOn.value;
                        ApiHttp().GetMovieData(homeController.search.value);
                      },
                      child: Container(
                        height: Get.height/21,
                        width: Get.height/21,
                        child: Icon(Icons.search,color: Colors.white,size: 21.sp,),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => FutureBuilder<MoviesModel?>(
                  future: ApiHttp().GetMovieData(homeController.search.value==""?"bahubali":homeController.search.value),
                  // future: ApiHttp().GetMovieData("bahubali"),
                    builder: (context, snapshot) {
                      if(snapshot.hasError)
                        {
                          return Center(child: Text("${snapshot.error}"),);
                        }
                      else if(snapshot.hasData)
                        {
                          MoviesModel? data = snapshot.data;
                          return Expanded(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      height: Get.height/4,
                                      width: Get.height/4,
                                      margin: EdgeInsets.only(top: Get.height/30,left: Get.width/30),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border.all(color: Colors.white,width: 2),
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network("${data!.d![index].i!.imageUrl==null?"Not Available":data!.d![index].i!.imageUrl}",fit: BoxFit.fill,),
                                      ),
                                    ),
                                    Container(
                                        width: Get.width/1.1,
                                        height: Get.height/20,
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(top: Get.height/30,),
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "Name    :",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "${data!.d![index].l==null?"Not Available":data!.d![index].l}",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    Container(
                                        width: Get.width/1.1,
                                        height: Get.height/20,
                                        alignment: Alignment.topCenter,
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "Actor's    :",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "${data!.d![index].s==null?"Not Available":data!.d![index].s}",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  textStyle: TextStyle(overflow: TextOverflow.ellipsis)
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    Container(
                                        width: Get.width/1.1,
                                        height: Get.height/20,
                                        alignment: Alignment.topCenter,
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "Release Year    :",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "${data!.d![index].y==null?"Not Available":data!.d![index].y}",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    Container(
                                        width: Get.width/1.1,
                                        height: Get.height/20,
                                        alignment: Alignment.topCenter,
                                        child: ListTile(
                                          leading: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "Rank    :",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                          title: Padding(
                                            padding: EdgeInsets.only(bottom: Get.height/60),
                                            child: Text(
                                              "${data!.d![index].rank==null?"Not Available":data!.d![index].rank}",
                                              style: GoogleFonts.caveatBrush(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                    },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
