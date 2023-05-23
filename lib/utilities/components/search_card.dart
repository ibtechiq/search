import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../common/api_constants.dart';
import '../../controllers/bloc.dart';
import '../../models/search_model.dart';

class SearchList extends StatelessWidget {
  final SearchModel data;
  final BLoC bLoC;

  const SearchList({Key? key, required this.data, required this.bLoC})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.circular(10),
                  child: Container(
                    color: Colors.grey[100],
                    child: CachedNetworkImage(
                      imageUrl: imageUrl+data.image,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      width: 170,
                      height: 170,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 50,
                   decoration: BoxDecoration(
                     color: Colors.blue[900],
                     borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),topRight: Radius.circular(15))
                   ),

                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:4.0),
                          child: Text('${data.rating.floorToDouble()}',style: const TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                        Icon(Icons.star_rounded,color: Colors.yellow[700],size: 18,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15,color: Colors.blue[900]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data.categoryName,
                    style:  TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12,color: Colors.grey[400]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
