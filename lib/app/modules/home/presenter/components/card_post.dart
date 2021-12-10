// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';

class CardPostComponent extends StatelessWidget {
  const CardPostComponent({required this.post});

  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      height: 120,
      decoration:
          const BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            blurRadius: 2,
            spreadRadius: 3,
            blurStyle: BlurStyle.outer,
            color: Colors.black26)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
                child: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
            Text(post.id),
          ]),
          const SizedBox(height: 12),
          Text(post.body, overflow: TextOverflow.ellipsis, maxLines: 4),
        ],
      ),
    );
  }
}
