import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementIndicatorValuItemWidget extends StatefulWidget {
  const MeasurementIndicatorValuItemWidget({
    Key key,
    this.currentValue,
  }) : super(key: key);

  final MeasurementIndicatorValuesRecord currentValue;

  @override
  _MeasurementIndicatorValuItemWidgetState createState() =>
      _MeasurementIndicatorValuItemWidgetState();
}

class _MeasurementIndicatorValuItemWidgetState
    extends State<MeasurementIndicatorValuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if ((widget.currentValue.type) == 'Number')
            AutoSizeText(
              functions.getFixedDouble(widget.currentValue.numberValue),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
          if ((widget.currentValue.type) == 'Text')
            AutoSizeText(
              widget.currentValue.textValue.maybeHandleOverflow(
                maxChars: 30,
                replacement: '…',
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
          if ((widget.currentValue.type) == 'Slider')
            Text(
              '${functions.getFixedDouble(widget.currentValue.sliderValue)} / 10',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
          if ((widget.currentValue.type) == 'Rating')
            Text(
              '${widget.currentValue.ratingValue.toString()} / 5',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
          if ((widget.currentValue.type) == 'Image')
            ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: CachedNetworkImage(
                imageUrl: widget.currentValue.imageValue,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          if ((widget.currentValue.type) == 'Video')
            FlutterFlowVideoPlayer(
              path: widget.currentValue.videoValue,
              videoType: VideoType.network,
              width: 50,
              height: 50,
              autoPlay: false,
              looping: false,
              showControls: false,
              allowFullScreen: false,
              allowPlaybackSpeedMenu: false,
            ),
          if ((widget.currentValue.type) == 'Switch')
            Text(
              functions
                  .getHumanReadableSwitchValue(widget.currentValue.switchValue),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
          if ((widget.currentValue.type) == 'Time')
            Text(
              functions
                  .getHumanReadableTimeValue(widget.currentValue.timeValue),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Comfortaa',
                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                    fontSize: 14,
                  ),
            ),
        ],
      ),
    );
  }
}
