import 'dart:math';
import 'dart:ui';

import 'package:Clothes_ICTU/models/review.dart';

import '../models/clothes.dart';
import '../models/order.dart';
import '../models/Shop.dart';
import '../models/user.dart';

// clothes
//Mèo shop
final _aocamisolerapbeo = Clothes(
  id: 1,
  imageUrl: 'assets/images/aocamisolerapbeo.jpg',
  name: 'Áo camisole ráp bèo',
  shopName: 'Mèo shop',
  price: 990000,
);
final _aohaidayvailien = Clothes(
  id: 2,
  imageUrl: 'assets/images/aohaidayvailien.jpg',
  shopName: 'Mèo shop',
  name: 'Áo hai dây vải lien',
  price:560000,
);
final _aophongcoctay = Clothes(
  id: 3,
  imageUrl: 'assets/images/aophongcoctay.jpg',
  shopName: 'Mèo shop',
  name: 'Áo phông cộc tay',
  price: 990000,
);
final _aophongdetkiminhoatiet = Clothes(
  id: 4,
  imageUrl: 'assets/images/aophongdetkiminhoatiet.jpg',
  shopName: 'Mèo shop',
  name: 'Áo phông dệt kim in hoạt tiết',
  price: 1250000,
);
final _aophongdetkiminhoatietkhacmau = Clothes(
  id: 5,
  imageUrl: 'assets/images/aophongdetkiminhoatietkhacmau.jpg',
  shopName: 'Mèo shop',
  name: 'Áo phông dệt kim in hoạt tiết khác màu',
  price: 1025000,
);
//Quý ông shop
final _aophonghoatietkengang = Clothes(
  id: 6,
  imageUrl: 'assets/images/aophonghoatietkengang.jpg',
  name: 'Áo phông họa tiết kẻ ngang',
  shopName: 'Quý ông shop',
  price: 990000,
);
final _quanshortbermuda = Clothes(
  id: 7,
  imageUrl: 'assets/images/quanshortbermuda.jpg',
  name: 'Quần short bermuda',
  shopName: 'Quý ông shop',
  price: 550000,
);
final _quanshortbermudavailien = Clothes(
  id: 8,
  imageUrl: 'assets/images/quanshortbermudavailien.jpg',
  name: 'Quần short bermuda vải lien',
  shopName: 'Quý ông shop',
  price: 750000,
);
final _aosomioxfordcotru = Clothes(
  id: 9,
  imageUrl: 'assets/images/aosomioxfordcotru.jpg',
  name: 'Áo sơ mi oxford cổ trụ',
  shopName: 'Quý ông shop',
  price: 990000,
);
final _aosomivaidet = Clothes(
  id: 10,
  imageUrl: 'assets/images/aosomivaidet.jpg',
  name: 'Áo sơ mi vải dệt',
  shopName: 'Quý ông shop',
  price: 990000,
);
// Thời trang đơn giản
final _aophongkieucoban = Clothes(
  id: 11,
  imageUrl: 'assets/images/aophongkieucoban.jpg',
  name: 'Áo phông kiểu cơ bản',
  shopName: 'Thời trang kiểu đơn giản',
  price: 1250000,
);
final _aophongkieucobantrang = Clothes(
  id: 12,
  imageUrl: 'assets/images/aophongkieucobantrang.jpg',
  name: 'Áo phông kiểu cơ bản trắng',
  shopName: 'Thời trang kiểu đơn giản',
  price: 1000000,
);
final _aophonglung = Clothes(
  id: 13,
  imageUrl: 'assets/images/aophonglung.jpg',
  name: 'Áo phông lửng',
  shopName: 'Thời trang kiểu đơn giản',
  price: 690000,
);
final _aophongsmiley = Clothes(
  id: 14,
  imageUrl: 'assets/images/aophongsmiley.jpg',
  name: 'Áo phông smiley',
  shopName: 'Thời trang kiểu đơn giản',
  price: 799000,
);
final _aophongsmileyden = Clothes(
  id: 15,
  imageUrl: 'assets/images/aophongsmileyden.jpg',
  name: 'Áo phông smiley đen',
  shopName: 'Thời trang kiểu đơn giản',
  price: 899000,
);
// Ố Ồ shop
final _aophongtrang0 = Clothes(
  id: 16,
  imageUrl: 'assets/images/aophongtrang0.jpg',
  name: 'Áo phông thời trang trí lấp lánh',
  shopName: 'Ố Ồ shop',
  price: 799000,
);
final _aophongtrang1 = Clothes(
  id: 17,
  imageUrl: 'assets/images/aophongtrang1.jpg',
  name: 'Áo phông phong cách',
  shopName: 'Ố Ồ shop',
  price: 550000,
);
final _aophongtrang2 = Clothes(
  id: 18,
  imageUrl: 'assets/images/aophongtrang2.jpg',
  name: 'Áo phông thời trang mới',
  shopName: 'Ố Ồ shop',
  price: 599000,
);
final _jenanz1975monfitrachcapcao = Clothes(
  id: 19,
  imageUrl: 'assets/images/jenanz1975monfitrachcapcao.jpg',
  name: 'Jean z1975 mon fit rách cạp cao',
  shopName: 'Ố Ồ shop',
  price: 1299000,
);
final _jeanz1975palazzocapcao = Clothes(
  id: 20,
  imageUrl: 'assets/images/jeanz1975palazzocapcao.jpg',
  name: 'Jean z1975 palazzo cạp cao',
  shopName: 'Ố Ồ shop',
  price: 1299000,
);
// shop xinh
final _chanvaytuaruadangdai = Clothes(
  id: 21,
  imageUrl: 'assets/images/chanvaytuaruadangdai.jpg',
  name: 'Chân váy tua rua dáng dài',
  shopName: 'Shop xinh',
  price: 799000,
);
final _chanvayxeplilon = Clothes(
  id: 22,
  imageUrl: 'assets/images/chanvayxeplilon.jpg',
  name: 'Chân váy xếp lilon',
  shopName: 'Shop xinh',
  price: 899000,
);
final _aophongvaigancoyem = Clothes(
  id: 23,
  imageUrl: 'assets/images/aophongvaigancoyem.jpg',
  name: 'Áo phông vải gân có yếm',
  shopName: 'Shop xinh',
  price: 699000,
);
final _chanvaydenim_midi = Clothes(
  id: 24,
  imageUrl: 'assets/images/chanvaydenim_midi.jpg',
  name: 'Chân váy đen im midi',
  shopName: 'Shop xinh',
  price: 899000,
);
final _aophongtrang3 = Clothes(
  id: 25,
  imageUrl: 'assets/images/aophongtrang3.jpg',
  name: 'Áo phông trắng',
  shopName: 'Shop xinh',
  price: 7299000,
);
// userreview
final _review1 = Review(
  imageUrl: 'assets/images/IU.jpg',
  name: 'Shop rất nhiệt tình',
  star: 4,
);
final _review2 = Review(
  imageUrl: 'assets/images/Son-Tung-MPT .jpg',
  name: 'Hàng của shop đẹp và chất lượng',
  star: 5,
);
final _review3 = Review(
  imageUrl: 'assets/images/gd.jpg',
  name: 'Chất lượng sản phẩm cũng tạm được',
  star: 3,
);
final _review4 = Review(
  imageUrl: 'assets/images/nobita.jpg',
  name: 'Shop không có thái độ tôn trọng khách hàng',
  star: 2,
);
final _review5 = Review(
  imageUrl: 'assets/images/doraemon.jpg',
  name: 'Sẽ tiếp tục ủng hộ shop',
  star: 4,
);
final _review6 = Review(
  imageUrl: 'assets/images/loncon.jpg',
  name: 'Ụt ịt',
  star: 5,
);
final _review7 = Review(
  imageUrl: 'assets/images/loncon.jpg',
  name: 'Gâu gâu',
  star: 1,
);
final _review8 = Review(
  imageUrl: 'assets/images/meomeo.jpg',
  name: 'Meo meo',
  star: 4,
);
final _review9 = Review(
  imageUrl: 'assets/images/meomeo.jpg',
  name: 'Mèo méo meo mèo meo',
  star: 4,
);

List<Review> reviews1 = [
  _review1,
  _review2,
  _review3,
];
List<Review> reviews2 = [
  _review4,
  _review5,
  _review6,
];
List<Review> reviews3 = [
  _review7,
  _review8,
  _review9,
];
// int tinhsao(Restaurant restaurant) {
//   var tong = 0;
//   var trungbinh;
//   for (int i = 0; i < restaurant.reviews.length; i++) {
//     tong += restaurant.reviews[i].star;
//   }
//   trungbinh = (tong / restaurant.reviews.length) as int;
// }
final random = Random();
final _shop0 = Shop(
    imageUrl: 'assets/images/shop0.jpg',
    name: 'Mèo shop',
    address: 'KTPM-K20C',
    rating: 5,
    menu: [
      _aocamisolerapbeo,
      _aohaidayvailien,
      _aophongcoctay,
      _aophongdetkiminhoatiet,
      _aophongdetkiminhoatietkhacmau,
    ],
    reviews: [
      _review1,
      _review2,
      _review3,
    ]);
final _shop1 = Shop(
    imageUrl: 'assets/images/shop1.jpg',
    name: 'Quý ông shop',
    address: '26 Thịnh Đán',
    rating: 4,
    menu: [
      _aophonghoatietkengang,
      _quanshortbermuda,
      _quanshortbermudavailien,
      _aosomioxfordcotru,
      _aosomivaidet,

    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);
final _shop3 = Shop(
    imageUrl: 'assets/images/shop2.jpg',
    name: 'Thời trang đơn giản',
    address: '68 Tân Thịnh',
    rating: 3,
    menu: [
      _aophongkieucoban,
      _aophongkieucobantrang,
      _aophonglung,
      _aophongsmiley,
      _aophongsmileyden,

    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);

final _shop4 = Shop(
    imageUrl: 'assets/images/shop3.jpg',
    name: 'Ố Ồ shop',
    address: 'Ngõ 254 Quang Trung',
    rating: 3,
    menu: [
      _aophongtrang0,
      _aophongtrang1,
      _aophongtrang2,
      _jenanz1975monfitrachcapcao,
      _jeanz1975palazzocapcao,

    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);
final _shop5 = Shop(
    imageUrl: 'assets/images/shop4.jpg',
    name: 'Shop Xinh',
    address: '179 Quang Trung',
    rating:2,
    menu: [
      _chanvaytuaruadangdai,
      _chanvayxeplilon,
      _aophongvaigancoyem,
      _chanvaydenim_midi,
      _aophongtrang3,
    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);
final _shop6 = Shop(
    imageUrl: 'assets/images/logoictu.jpg',
    name: 'Thời trang Thanh Tuấn',
    address: 'Hà Nội',
    rating: 5,
    menu: [
      _jenanz1975monfitrachcapcao,
      _jeanz1975palazzocapcao,
      _aophongkieucoban,
      _aophongcoctay,
      _aophongtrang3,

    ],
    reviews: [
      _review1,
      _review2,
      _review3,
    ]);
final _shop7 = Shop(
    imageUrl: 'assets/images/shop5.jpg',
    name: 'Shop Mèo Đen',
    address: 'Đại Từ',
    rating: 3,
    menu: [
      _aophonghoatietkengang,
      _chanvayxeplilon,
      _aophongsmiley,
      _aophongvaigancoyem,
      _aosomivaidet,

    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);
final _shop2 = Shop(
    imageUrl: 'assets/images/shop6.jpg',
     name: 'Thời Trang Mới Thời Thượng',
    address: 'Thịnh Đán',
    rating: random.nextInt(5),
    menu: [
      _chanvaytuaruadangdai,
      _quanshortbermuda,
      _aophongtrang2,
      _chanvaydenim_midi,
      _aophongtrang3,
    ],
    reviews: [
      _review4,
      _review5,
      _review6,
    ]);


List<Shop> shop = [
  _shop0,
  _shop1,
  _shop2,
  _shop3,
  _shop4,
  _shop5,
  _shop6,
  _shop7,

];

final currentUser = User(
  name: 'Damon',
  orders: [
    Order(
      date: 'Nov 10,2019',
      clothes: _aophongdetkiminhoatiet,
      shop: _shop0,
      quantity: 1,
      price: 1250000,
    ),
    Order(
      date: 'Nov 10,2019',
      clothes: _aosomivaidet,
      shop: _shop1,
      quantity: 1,
      price: 990000,
    ),
    Order(
      date: 'Nov 10,2019',
      clothes: _chanvaytuaruadangdai,
      shop: _shop2,
      quantity: 1,
      price: 799000,
    ),
    Order(
      date: 'Nov 10,2019',
      clothes: _aophongsmiley ,
      shop: _shop3,
      quantity: 1,
      price: 799000,
    ),
    Order(
      date: 'Nov 10,2019',
      clothes: _jenanz1975monfitrachcapcao,
      shop: _shop4,
      quantity: 1,
      price: 1299000,
    ),
  ],
);
