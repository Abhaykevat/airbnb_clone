import 'package:airbnb_clone/model/contact_model.dart';
import 'package:airbnb_clone/model/posting_model.dart';

class BookingModel
{
  String id="";
  PostingModel? posting;
  ContactModel? contact;
  List<DateTime>? dates;

  BookingModel();
}