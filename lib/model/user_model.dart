import 'package:airbnb_clone/model/booking_model.dart';
import 'package:airbnb_clone/model/contact_model.dart';
import 'package:airbnb_clone/model/posting_model.dart';
import 'package:airbnb_clone/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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


}