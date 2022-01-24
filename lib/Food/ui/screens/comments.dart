import 'dart:async';
import 'package:fire_sweet_app/Food/ui/screens/widgets.dart';
import 'package:fire_sweet_app/widgets/constants.dart';
import 'package:flutter/material.dart';

class CommentsMessage {
  CommentsMessage({required this.name, required this.message});
  final String name;
  final String message;
}

enum Like { yes, no, unknown }

class Comments extends StatefulWidget {
  const Comments({required this.addMessage, required this.messages});
  final FutureOr<void> Function(String message) addMessage;
  final List<CommentsMessage> messages;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_CommentsState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        for (var message in widget.messages)
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          contentPadding: EdgeInsets.all(15.0),
          leading: Icon(Icons.photo),
          title: Text(
        '${message.name}',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${message.message}',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato", fontSize: 16.0),
      ))

    ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: textInputDecoration.copyWith(hintText: 'Add a comment...'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your comment to continue';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                StyledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await widget.addMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.send),
                      SizedBox(width: 5),
                      Text('Post'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    )
    );
  }
}

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({required this.state, required this.onSelection});
  final Like state;
  final void Function(Like selection) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Like.yes:
        return Container(
          margin: EdgeInsets.only(left: 250.0),
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => onSelection(Like.no),
                icon: Icon(Icons.favorite, color: Colors.red,),
              ),
            ],
          ),
        ));
      case Like.no:
        return Container(
          margin: EdgeInsets.only(left: 250.0),
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => onSelection(Like.yes),
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
        ));
      default:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => onSelection(Like.no),
                icon: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        );
    }
  }
}
