import 'package:airbnb_clone/model/app_constants.dart';
import 'package:airbnb_clone/model/posting_model.dart';
import 'package:airbnb_clone/view/guestScreens/book_listing_screen.dart';
import 'package:airbnb_clone/view/widgets/posting_info_tile_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPostingScreen extends StatefulWidget
{
  PostingModel? posting;
  ViewPostingScreen({super.key,this.posting,});

  @override
  State<ViewPostingScreen> createState() => _ViewPostingScreenState();
}

class _ViewPostingScreenState extends State<ViewPostingScreen>
{
  PostingModel? posting;

  getRequiredInfo() async
  {
    await posting!.getAllImagesFromStorage();
    await posting!.getHostFromFirestore();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    posting =widget.posting;
    getRequiredInfo();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.pinkAccent,
                    Colors.amber
                  ],
                  begin: FractionalOffset(0.0,1.0),
                  end: FractionalOffset(1.0,0.0),
                  stops: [0.0,1.0],
                  tileMode: TileMode.clamp
              )
          ),
        ),
        title: const Text('Posting Information ',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: ()
              {
                AppConstants.currentUser.addSavePosting(posting!);
              },
              icon: const Icon(Icons.save,color: Colors.white,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //listing images
            AspectRatio(aspectRatio: 3/2,
              child: PageView.builder(
                itemCount: posting!.displayImages!.length,
                  itemBuilder:(context,index)
                  {
                    MemoryImage currentImage=posting!.displayImages![index];
                    return Image(image: currentImage,fit: BoxFit.fill,);
                  }
              ),

            ),
            //posting name button // book now button
            //description -profile pic
            //apartments -beds -bathrooms
            //amenities
            // the location
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14,14,0),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //posting name and price - book now btn
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //posting name
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.55,
                        child: Text(
                          posting!.name!.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 3,
                        ),
                      ),
                      //book now button-price
                      Column(
                        children: <Widget>[
                          Container(decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.pinkAccent,
                              Colors.amber,
                            ],
                              begin: FractionalOffset(0.0, 0.0),
                              end: FractionalOffset(1.0, 0.0),
                                stops: [0.0,1.0],
                                tileMode: TileMode.clamp,
                            )
                          ),
                            child: MaterialButton(
                              onPressed: ()
                              {
                                Get.to(BookListingScreen(postiing: posting,hostID:posting!.host!.id!));
                              },
                              child: const Text(
                                'Book Now',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Text('₹${posting!.price} /night',style: const TextStyle(fontSize: 14.0),)
                        ],
                      )
                    ],
                  ),
                  //description -profile pic and name
                  Padding(
                    padding: EdgeInsets.only(top: 25.0,bottom: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/1.75,
                          child: Text(
                            posting!.description!,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize:14 ),
                            maxLines: 5,
                          ),
                        ),
                        Column(children: [
                          GestureDetector(
                            onTap: (){

                            },
                            child: CircleAvatar(radius: MediaQuery.of(context).size.width/12.5,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(backgroundImage: posting!.host!.displayImage,radius: MediaQuery.of(context).size.width/13,),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0),
                            child: Text(posting!.host!.getFullNameOfUser(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],)
                      ],
                    ),
                  ),

                  //apartments -beds -bathrooms
                  Padding(padding: EdgeInsets.only(top: 25.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        PostingInfoTileUI(
                          iconData: Icons.home,
                          category: posting!.type!,
                          categoryInfo: '${posting!.getGuestsNumber()} guests',
                        ),
                        PostingInfoTileUI(
                          iconData: Icons.hotel,
                          category: 'Beds',
                          categoryInfo: posting!.getBedroomText(),
                        ),
                        PostingInfoTileUI(
                          iconData: Icons.wc,
                          category: 'Bathrooms',
                          categoryInfo: posting!.getBathroomText(),
                        ),
                      ],
                    ),
                  ),
                  //amenities
                  const Text(
                    'Amenities:',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 5.0,bottom: 25),
                    child:GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 3.6,
                      shrinkWrap: true,
                      children: List.generate(posting!.amenities!.length, (index) {
                        String currentAmenity=posting!.amenities![index];
                        return Chip(label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(currentAmenity,
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        backgroundColor: Colors.white10,);
                      })

                    ),
                  ),
                  //the location
                  const Text('The Location:',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Center(
                    child: Padding(padding: const EdgeInsets.only(top: 2.0,bottom: 8),
                      child: Text(
                        posting!.getFullAddress(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ) ,

            )
          ],
        ),
      ),
    );
  }
}
