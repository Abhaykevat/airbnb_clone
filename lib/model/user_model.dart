import 'package:airbnb_clone/model/booking_model.dart';
import 'package:airbnb_clone/model/contact_model.dart';
import 'package:airbnb_clone/model/posting_model.dart';
import 'package:airbnb_clone/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UserModel extends ContactModel{
  String? email;
  String? password;
  String? bio;
  String? city;
  String? country;
  bool? isHost;
  bool? isCurrentlyHosting;
  DocumentSnapshot? snapshot;

  List<BookingModel>? bookings;
  List<ReviewModel>? reviews;

  List<PostingModel>? savedPostings;
  List<PostingModel>? myPostings;

  UserModel({
    String? id="",
    String? firstName="",
    String? lastName="",
    String? fullName="",
    MemoryImage? displayImage,
    this.email="",
    this.bio="",
    this.city="",
    this.country="",
  }):super (id: id,firstName: firstName,lastName: lastName,displayImage: displayImage)
  {
    isHost=false;
    isCurrentlyHosting=false;

    bookings=[];
    reviews=[];

    savedPostings=[];
    myPostings=[];
  }

  addPostingToMyPostings(PostingModel posting) async
  {
     myPostings!.add(posting);
     List<String> myPostingIDsList=[];
     myPostings!.forEach((element)
     {
       myPostingIDsList.add(element.id!);
     });
     await FirebaseFirestore.instance.collection("users").doc(id).update(
         {
           'myPostingIds':myPostingIDsList,
         });
  }

  getMyPostingsFromFirestore() async
  {
    List<String> myPostingsIDs=List<String>.from(snapshot!["myPostingIDs"]) ?? [];

    for(String postingID in myPostingsIDs)
      {
        PostingModel posting=PostingModel(id: postingID);
        await posting.getPostingInfoFromFirestore();
        await posting.getAllImagesFromStorage();

        myPostings!.add(posting);
      }
  }
  addSavePosting(PostingModel posting) async
  {
    for(var savedPosting in savedPostings!)
      {
        if(savedPosting.id == posting.id)
          {
            return;
          }
      }
    savedPostings!.add(posting);
    List<String> savedPostingIDs=[];
    savedPostings!.forEach((savedPosting)
    {
      savedPostingIDs.add(savedPosting.id!);
    });
    await FirebaseFirestore.instance.collection("users").doc(id).update(
        {
          'savedPostingIDs':savedPostingIDs,
        });
    Get.snackbar("Marked as Favorite","Saved to your Favorite list");
  }
  removeSavedPosting(PostingModel posting) async
  {
    for(int i=0;i<savedPostings!.length;i++)
      {
        if(savedPostings![i].id==posting.id)
          {
            savedPostings!.removeAt(i);
            break;
          }

      }
    List<String> savedPostingIDs=[];
    savedPostings!.forEach((savedPosting)
    {
      savedPostingIDs.add(savedPosting.id!);
    });
    await FirebaseFirestore.instance.collection("users").doc(id).update(
        {
          'savedPostingIDs':savedPostingIDs,
        });
    Get.snackbar("Listing Removed","Listing removed from  your Favorite list");
  }
  Future<void> addBookingToFirestore(BookingModel booking,double totalPriceForAllNights,String hostID) async
  {

    Map<String,dynamic> data=
        {
          'data':booking.dates,
          'postingID':booking.posting!.id!,
        };
    await FirebaseFirestore.instance.doc('users/${id}/bookings/${booking.id}.').set(data);

    String earningOld="";
    await FirebaseFirestore.instance.collection("users").doc(hostID).get().then((dataSnap)
    {
      earningOld =dataSnap["earnings"].toString();
    });

    await FirebaseFirestore.instance.collection("users").doc(hostID).update(
      {
        "earnings":totalPriceForAllNights +int.parse(earningOld),
      }
    );
    bookings!.add(booking);
    //await addBookingConversatiion(booking);
  }
   List<DateTime> getAllBookedDates()
   {
    List<DateTime> allBookedDates=[];

    myPostings!.forEach((posting) 
    {
      posting.bookings!.forEach((booking) 
      {
        allBookedDates.addAll(booking.dates!);
      });
    });
    return allBookedDates;
   }

}