import 'package:airbnb_clone/model/app_constants.dart';
import 'package:airbnb_clone/model/posting_model.dart';
import 'package:airbnb_clone/view/widgets/calender_ui.dart';
import 'package:airbnb_clone/view/widgets/posting_list_tile_ui.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> 
{
  List<DateTime> _bookedDates=[];
  List<DateTime> _allBookedDates=[];
  PostingModel? _selectedPosting;

  List<DateTime> _getSelectedDates()
  {
    return [];
  }

  _selectDate(DateTime date)
  {
    
  }

  _selectedAPosting(PostingModel posting)
  {
    _selectedPosting=posting;
    posting.getAllBookingsFromFirestore().whenComplete(()
    {
      _bookedDates=posting.getAllBookedDates();
      
    });
    _selectedPosting=posting;
    setState(() {
      
    });
  }

  _clearSelectedPosting()
  {
    _bookedDates=_allBookedDates;
    _selectedPosting=null;
    setState(() {
      
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bookedDates=AppConstants.currentUser.getAllBookedDates();
    _allBookedDates=AppConstants.currentUser.getAllBookedDates();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.fromLTRB(25,25,25,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Sun'),
                  Text('Mon'),
                  Text('Tues'),
                  Text('Wed'),
                  Text('Thur'),
                  Text('Fri'),
                  Text('Sat'),
      
                ],
              ),
              //Calendar
              Padding(padding: EdgeInsets.only(top: 15,bottom: 35),
              child: SizedBox(
                height: MediaQuery.of(context).size.height/1.8,
                child: PageView.builder(
                  itemCount: 12,
                  itemBuilder: (context,index)
                  {
                    return  CalenderUI(
                      monthIndex: index,
                      bookedDates: _bookedDates,
                      selectDate: _selectDate,
                      getSelecteDated: _getSelectedDates,
                    );
                  },
      
                ),
              ),
      
              ),
              //result
              Padding(
                padding: const EdgeInsets.fromLTRB(25,25,0,25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Filter by Listing',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    MaterialButton(onPressed: ()
                    {
                      _clearSelectedPosting();
                    },
                    child: Text("Reset",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 25),
                      child: Container(),
                    )
      
                  ],
                ),
              ),
              //display host listings
              ListView.builder(
                shrinkWrap: true,
                itemCount: AppConstants.currentUser.myPostings!.length,
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 26.0),
                    child: InkResponse(
                      onTap: ()
                      {
                        _selectedAPosting(AppConstants.currentUser.myPostings![index]);
                        
                      },
                      child:Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: _selectedPosting==AppConstants.currentUser.myPostings![index] ? Colors.blue : Colors.grey,
                          width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: PostingListTileUI(
                          posting: AppConstants.currentUser.myPostings![index],
                        ),
                      ) ,
                    ),
                  );
                },
              )
          ],
        ),
        ),
      ),
    );
  }
}
