import 'package:flutter/material.dart';

class MTSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MTSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  MTSwitchState createState() => MTSwitchState();
}

class MTSwitchState extends State<MTSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3.0),
        duration: const Duration(milliseconds: 200),
        width: 50.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: _value ? Colors.greenAccent[100] : Colors.grey[400],
        ),
        child: Row(
          mainAxisAlignment:
          _value ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 25.0,
              height: 25.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: _value
                    ? Icon(
                  Icons.check,
                  color: Colors.greenAccent[100],
                )
                    : Icon(
                  Icons.close,
                  color: Colors.grey[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
