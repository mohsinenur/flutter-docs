class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Radison Blue',
    address: 'South Wall St.',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Green Park',
    address: 'North Wall St.',
    price: 165,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Le Meridian',
    address: 'South Hill Villa',
    price: 355,
  ),
];
