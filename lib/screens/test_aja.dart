import 'package:flutter/material.dart';

class DragAndDropDemo extends StatefulWidget {
  @override
  _DragAndDropDemoState createState() => _DragAndDropDemoState();
}

class _DragAndDropDemoState extends State<DragAndDropDemo> {
  List<String> items = ['Item 1', 'Item 2'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Draggable<String>(
          data: items[0],
          child: _buildItem(items[0]),
          feedback: _buildItem(items[0], isDragging: true),
          childWhenDragging: Container(),
        ),
        Draggable<String>(
          data: items[1],
          child: _buildItem(items[1]),
          feedback: _buildItem(items[1], isDragging: true),
          childWhenDragging: Container(),
        ),
      ],
    );
  }

  Widget _buildItem(String text, {bool isDragging = false}) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          color: isDragging ? Colors.grey : Colors.blue,
          padding: EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
      onWillAccept: (data) {
        // This function is called when an item is dragged over the target.
        // Return true if the target is willing to accept the data.
        return true;
      },
      onAccept: (data) {
        // This function is called when an item is dropped on the target.
        // Update the state to switch the positions of the items.
        setState(() {
          int index = items.indexOf(data);
          items[items.indexOf(text)] = data;
          items[index] = text;
        });
      },
    );
  }
}
