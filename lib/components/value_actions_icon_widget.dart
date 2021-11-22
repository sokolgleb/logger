import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueActionsIconWidget extends StatefulWidget {
  ValueActionsIconWidget({
    Key key,
    this.currentValue,
  }) : super(key: key);

  final DocumentReference currentValue;

  @override
  _ValueActionsIconWidgetState createState() => _ValueActionsIconWidgetState();
}

class _ValueActionsIconWidgetState extends State<ValueActionsIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.bGColor2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.trnsparentMain,
                icon: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.primaryColor,
                  size: 30,
                ),
                onPressed: () async {
                  await widget.currentValue.delete();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
