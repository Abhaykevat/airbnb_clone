import 'package:airbnb_clone/model/contact_model.dart';
import 'package:airbnb_clone/model/review_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'booking_model.dart';

class PostingModel
{
  String? id;
  String? name;
  String? type;
  double? price;
  String? description;
  String? address;
  String? city;
  String? country;
  double? rating;

  ContactModel? host;
  List<String>? imageNames;
  List<MemoryImage>? displayImages;
  List<String>? amenities;

  Map<String,int>? beds;
  Map<String,int>? bathrooms ;

  List<BookingModel>? bookings;
  List<ReviewModel>? reviews;

  PostingModel({this.id ="",this.name ="",this.type ="",this.price =0,this.description ="",this.address ="",this.city ="",this.country ="",this.host})
  {
    displayImages=[];
    amenities=[];
    beds={};
    bathrooms={};
    rating=0;
    bookings=[];
    reviews=[];

  }

  setImagesNames()
  {
    imageNames=[];
    for(int i=0;i<displayImages!.length;i++)
      {
        imageNames!.add("image${i}.png");
      }
  }
  getPostingInfoFromFirestore() async
  {
    DocumentSnapshot snapshot= await FirebaseFirestore.instance.collection('postings').doc(id).get();
    getPostingInfoFromSnapshot(snapshot);
  }
  getPostingInfoFromSnapshot(DocumentSnapshot snapshot)
  {
    address=snapshot['address'] ?? "";
    amenities=List<String>.from(snapshot['amenities']) ?? [];
    bathrooms=Map<String,int>.from(snapshot['bathrooms']) ?? {};
    beds=Map<String,int>.from(snapshot['beds']) ?? {};
    city=snapshot['city'] ?? "";
    country=snapshot['country'] ?? "";
    description=snapshot['description'] ?? "";
    String hostID=snapshot['hostID'] ?? "";
    host=ContactModel(id: hostID);
    imageNames=List<String>.from(snapshot['imageNames']) ?? [];
    name=snapshot['name'] ?? "";
    price=snapshot['price'].toDouble() ?? 0.0;
    rating=snapshot['rating'].toDouble() ?? 2.5;
    type=snapshot['type'] ?? "";
  }
  getAllImagesFromStorage() async
  {
    displayImages=[];
    for(int i=0;i<imageNames!.length;i++)
      {
        final imageData=await FirebaseStorage.instance.ref().child("postingImages").child(id!).child(imageNames![i]).getData(1024*1024);
        displayImages!.add(MemoryImage(imageData!));
      }
    return displayImages;
  }

}