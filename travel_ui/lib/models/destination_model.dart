import 'package:travelui/models/activity_model.dart';

class Destination {
  String imageUr;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUr,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour & Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '01:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano & Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '02:30 pm'],
    rating: 3,
    price: 250,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUr: 'assets/images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUr: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUr: 'assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUr: 'assets/images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an unforgettable experience.',
    activities: activities,
  ),
  Destination(
    imageUr: 'assets/images/newyork.jpg',
    city: 'New York',
    country: 'United State',
    description: 'Visit New York for an unforgettable experience.',
    activities: activities,
  ),
];
