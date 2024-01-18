import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:test0/data/temp/temp.dart';
import 'package:test0/ui/view/screens/widgets/task_comment_card_menu.dart';

class CommentCard extends StatelessWidget {
  final comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          comment['author'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(comment['content']),
        trailing: GestureDetector(
            onTap: () {
              Temp.selectedComment = {
                'author': comment['author'],
                'content': comment['content'],
                'date': comment['date']
              };
              showPopover(
                  direction: PopoverDirection.left,
                  context: context,
                  height: 70,
                  width: 150,
                  bodyBuilder: (context) => TaskCommentCardMenu());
            },
            child: const Icon(Icons.more_vert)),
      ),
    );
  }
}
