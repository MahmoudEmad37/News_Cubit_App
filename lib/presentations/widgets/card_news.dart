import 'package:cubit_news_app/Services/fun.dart';
import 'package:cubit_news_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CardNews extends StatelessWidget {
  var imageUrl;
  var text;
  var link;

  CardNews(
      {Key? key,
      required this.imageUrl,
      required this.text,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Fun.openLink(link);
      },
      child: Card(
        //color: cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageUrl == null
                      ? const NetworkImage(
                          'https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png')
                      : NetworkImage("$imageUrl"),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "$text",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Fun.shareLink(link);
                    },
                    icon: const Icon(Icons.share,),
                  ),
                  IconButton(
                    onPressed: () {
                      Fun.copyLink(link);
                      Toast.show(
                        "Copying",
                        duration: Toast.lengthShort,
                        gravity: Toast.bottom,
                      );
                    },
                    icon: const Icon(Icons.copy_rounded,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
