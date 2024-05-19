import 'package:floral_fiesta/models/cart_item.dart';
import 'package:floral_fiesta/models/plant.dart';
import 'package:floral_fiesta/models/recently_viewed.dart';
import 'package:floral_fiesta/models/address.dart';

List<Plant> recommended = [
  Plant(
    plantType: 'Indoor',
    plantName: 'Snake Plant',
    plantPrice: 80.0,
    stars: 4.0,
    metrics: PlantMetrics('8.2"', '52%', '4.2"'),
    image: 'assets/images/snake_plant.png',
  ),
  Plant(
    plantType: 'Indoor',
    plantName: 'Palm',
    plantPrice: 480.0,
    stars: 3.5,
    metrics: PlantMetrics('8.2"', '52%', '4.2"'),
    image: 'assets/images/Palm.png',
  ),
  Plant(
    plantType: 'Outdoor',
    plantName: 'Ficus Alli',
    plantPrice: 600.0,
    stars: 3.0,
    metrics: PlantMetrics('8.2"', '52%', '4.2"'),
    image: 'assets/images/ficuss_alii.png',
  ),
  Plant(
    plantType: 'Outdoor',
    plantName: 'Money Bonsai',
    plantPrice: 4000.0,
    stars: 4.0,
    metrics: PlantMetrics('8.2"', '52%', '4.2"'),
    image: 'assets/images/money_bonsai.png',
  ),
  Plant(
    plantType: 'Outdoor',
    plantName: 'Juniper Bonsai',
    plantPrice: 2000.0,
    stars: 3.5,
    metrics: PlantMetrics('8.2"', '52%', '4.2"'),
    image: 'assets/images/Juniper_Bonsai.png',
  ),
];

List<ViewHistory> viewed = [
  ViewHistory('Calathea', 'It\'s spines don\'t grow.', 'assets/images/calathea.jpg'),
  ViewHistory('Cactus', 'It has spines.', 'assets/images/cactus.jpg'),
  ViewHistory('Stephine', 'It\'s spines do grow.', 'assets/images/stephine.jpg'),
];

List<CartItem> cartItems = [
  CartItem(
    Plant(
      plantType: 'Indoor',
      plantName: 'Calathea',
      plantPrice: 100,
      image: 'assets/images/calathea.jpg',
      stars: 3.5,
      metrics: PlantMetrics('', '', ''),
    ),
    2,
  ),
  CartItem(
    Plant(
      plantType: 'Indoor',
      plantName: 'Cactus',
      plantPrice: 100,
      image: 'assets/images/cactus.jpg',
      stars: 3.5,
      metrics: PlantMetrics('', '', ''),
    ),
    2,
  ),
];

List<Address> addresses = [
  Address(receiverName: "Keerthana J", address: "Door no: 3, Ganapathy Koil Street, Chennai, Tamil Nadu", mobileNumber: 7395930680),
  Address(receiverName: "Jerin BS", address: "Door no:5, Gandhi Nagar, Nehru Main Street, Porur, Tamil Nadu", mobileNumber: 6382261276),
  Address(receiverName: "Jeciyazhini J", address: "Kamaraj Nagar, 5/1 Street, Salem, Tamil Nadu", mobileNumber: 8248689565),
];