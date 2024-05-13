class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({ required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Choose hotel',
      image: 'images/hotel.jpg',
      discription: "Book hotel is easy just in the\npalm of your hand "
  ),
  UnbordingContent(
      title: 'Fast Delevery',
      image: 'images/hotel1.jpg',
      discription: "Come find Your dream hotel with one click"
  ),
  UnbordingContent(
      title: 'Reward surprises',
      image: 'images/hotel2.jpg',
      discription: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the"
      ),
];