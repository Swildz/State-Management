import 'package:flutter/material.dart';
import 'package:flutter_state_management/model/tourism_place.dart';
import 'package:flutter_state_management/src/detail_screen.dart';
import 'package:flutter_state_management/src/list_item.dart';

class TourismList extends StatefulWidget {
  final List<TourismPlace> doneTourismPlaceList;
  const TourismList({super.key, required this.doneTourismPlaceList});

  @override
  State<TourismList> createState() => _TourismListState(doneTourismPlaceList);
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> doneTourismPlaceList;
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda',
      imageAsset: 'images/surabaya-1.jpg',
      desk:
          'Surabaya Submarine Monument or as known as Monumen Kapal Selam (Monkasel) is the largest submarine monument in Asia, which was built in riverside of Kalimas, Surabaya. This monument was built by idea of Navy Veterans.',
    ),
    TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'images/surabaya-2.jpg',
      desk:
          'Kelenteng Sanggar Agung atau Klenteng Hong San Tang adalah sebuah klenteng di Kota Surabaya. Alamatnya berada di Jalan Sukolilo Nomor 100, Pantai Ria Kenjeran, Surabaya. Kuil ini, selain menjadi tempat ibadah bagi pemeluk Tridharma, juga menjadi tempat tujuan wisata bagi para wisatawan. Klenteng ini dibuka pada tahun 1999.',
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'images/surabaya-3.jpg',
      desk:
          'Museum rokok ini dulunya adalah pabrik rokok pertama Sampoerna. Saat ini bangunan bergaya kolonial Belanda yang dibangun sekitar tahun 1862 termasuk dalam situs bersejarah yang dilestarikan di Surabaya. Pada masa Belanda, bangunan ini adalah panti asuhan yang dikelola Belanda. Kemudian pada tahun 1932 dibeli oleh Liem Seeng Tee yang menjadi pendiri Sampoerna dan menjadi tempat pertama produksi rokok Sampoerna. Saat ini, bangunan ini termasuk dalam situs sejarah yang dilestarikan di Surabaya.',
    ),
    TourismPlace(
        name: 'Tugu Pahlawan',
        location: 'Alun-alun contong',
        imageAsset: 'images/surabaya-4.jpg',
        desk:
            'Tugu Pahlawan adalah salah satu peninggalan bersejarah di Surabaya. Mengutip dari situs Badan Perencanaan Pembangunan Kota Surabaya, Tugu Pahlawan berada di Jl. Pahlawan, Alun-alun Contong, Kec. Bubutan, Kota Surabaya, Jawa Timur.'),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'images/surabaya-5.jpg',
      desk: '',
    ),
  ];

  _TourismListState(this.doneTourismPlaceList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(place: place);
                },
              ),
            );
          },
          child: ListItem(
              place: place,
              isDone: doneTourismPlaceList.contains(place),
              onCheckBoxClick: (bool? value) {
                setState(() {
                  if (value != null) {
                    value
                        ? doneTourismPlaceList.add(place)
                        : doneTourismPlaceList.remove(place);
                  }
                });
              }),
        );
      }),
      itemCount: tourismPlaceList.length,
    );
  }
}
