import '../add_indicator_value/add_indicator_value_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/mesurement_actions_icons_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../measurement/measurement_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementItemWidget extends StatefulWidget {
  const MeasurementItemWidget({
    Key key,
    this.measurement,
    this.returnTo,
    this.groupIndex,
  }) : super(key: key);

  final MeasurementsRecord measurement;
  final String returnTo;
  final int groupIndex;

  @override
  _MeasurementItemWidgetState createState() => _MeasurementItemWidgetState();
}

class _MeasurementItemWidgetState extends State<MeasurementItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 40),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0x00FFFFFF),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (functions.isHasImage(widget.measurement.image) ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: widget.measurement.image,
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeasurementWidget(
                        returnTo: widget.returnTo,
                        groupIndex: widget.groupIndex,
                        currentMeasurementRef: widget.measurement.reference,
                      ),
                    ),
                  );
                },
                onDoubleTap: () async {
                  final measurementsUpdateData = createMeasurementsRecordData(
                    isFavorite: !(widget.measurement.isFavorite),
                  );
                  await widget.measurement.reference
                      .update(measurementsUpdateData);
                },
                onLongPress: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Color(0x80000000),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: MesurementActionsIconsWidget(
                            measurement: widget.measurement,
                            returnTo: widget.returnTo,
                            groupIndex: widget.groupIndex,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: 40,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                        child: AutoSizeText(
                          widget.measurement.title.maybeHandleOverflow(
                            maxChars: 30,
                            replacement: '…',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Comfortaa',
                                color:
                                    FlutterFlowTheme.of(context).bGColor2Text1,
                              ),
                        ),
                      ),
                      if (functions.isHasValue(widget.measurement.desc) ?? true)
                        Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxHeight: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            widget.measurement.desc.maybeHandleOverflow(
                              maxChars: 20,
                              replacement: '…',
                            ),
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Comfortaa',
                                      color: FlutterFlowTheme.of(context)
                                          .bGColor2Text2,
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.measurement.isFavorite ?? true)
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.playlist_add,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddIndicatorValueWidget(
                                    currentMeasurement: widget.measurement,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      if (!(widget.measurement.isFavorite) ?? true)
                        Align(
                          alignment: AlignmentDirectional(1, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            borderWidth: 1,
                            buttonSize: 40,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.playlist_add,
                              color: FlutterFlowTheme.of(context).bGColor2Text2,
                              size: 24,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddIndicatorValueWidget(
                                    currentMeasurement: widget.measurement,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
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
