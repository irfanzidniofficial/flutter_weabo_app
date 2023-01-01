import 'package:flutter/material.dart';
import 'package:flutter_weabo_app/route_argument/detail_arguments.dart';
import 'package:flutter_weabo_app/shared/style.dart';

class AnimeItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double score;
  final String status;
  final String synopsis;
  final int malId;

  const AnimeItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.score,
    required this.status,
    required this.synopsis,
    required this.malId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail',
            arguments: DetailArguments(title: title, id: malId));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            // Image
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: primaryColor,
                          ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "$score",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      status,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        synopsis,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.fade,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
