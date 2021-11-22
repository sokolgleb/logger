import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_measurement/edit_measurement_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MesurementActionsWidget extends StatefulWidget {
  MesurementActionsWidget({
    Key key,
    this.measurement,
    this.returnTo,
    this.groupIndex,
  }) : super(key: key);

  final MeasurementsRecord measurement;
  final String returnTo;
  final int groupIndex;

  @override
  _MesurementActionsWidgetState createState() =>
      _MesurementActionsWidgetState();
}

class _MesurementActionsWidgetState extends State<MesurementActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.bGColor2,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Edit',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text1,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Update this measurement',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text2,
                            ),
                          ),
                        )
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.edit_sharp,
                        color: FlutterFlowTheme.tertiaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditMeasurementWidget(
                              currentMeasurement: widget.measurement,
                              returnTo: widget.returnTo,
                              groupIndex: widget.groupIndex,
                            ),
                          ),
                          (r) => false,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Archive',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text1,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Move this measurement to the archive',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text2,
                            ),
                          ),
                        )
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.archive_sharp,
                        color: FlutterFlowTheme.tertiaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Archive measurement'),
                              content: Text(
                                  'Are you sure you want to archive this measurement?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);

                                    final measurementsUpdateData =
                                        createMeasurementsRecordData(
                                      status: 'ARCHIVED',
                                      updatedAt: getCurrentTimestamp,
                                    );
                                    await widget.measurement.reference
                                        .update(measurementsUpdateData);
                                    ;
                                  },
                                  child: Text('Yes, archive'),
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Un-archive measurement',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Comfortaa',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                            duration: Duration(milliseconds: 5000),
                            backgroundColor: FlutterFlowTheme.tertiaryColor,
                            action: SnackBarAction(
                              label: 'Yes, return',
                              textColor: FlutterFlowTheme.secondaryColor,
                              onPressed: () async {
                                final measurementsUpdateData =
                                    createMeasurementsRecordData(
                                  status: 'ACTIVE',
                                  updatedAt: getCurrentTimestamp,
                                );
                                await widget.measurement.reference
                                    .update(measurementsUpdateData);
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Share',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Share this measurement with others',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text2,
                            ),
                          ),
                        )
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.share_sharp,
                        color: Color(0x7F7B7777),
                        size: 30,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00EEEEEE),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Delete',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text1,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Delete this measurement',
                            style: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Comfortaa',
                              color: FlutterFlowTheme.bGColor2Text2,
                            ),
                          ),
                        )
                      ],
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.primaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Delete measurement'),
                              content: Text(
                                  'Are you sure you want to delete this measurement?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);

                                    final measurementsUpdateData =
                                        createMeasurementsRecordData(
                                      status: 'DELETED',
                                      updatedAt: getCurrentTimestamp,
                                    );
                                    await widget.measurement.reference
                                        .update(measurementsUpdateData);
                                    ;
                                  },
                                  child: Text('Yes, delete'),
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Undo deletion',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Comfortaa',
                                color: FlutterFlowTheme.secondaryColor,
                              ),
                            ),
                            duration: Duration(milliseconds: 5000),
                            backgroundColor: FlutterFlowTheme.tertiaryColor,
                            action: SnackBarAction(
                              label: 'Yes, restore',
                              textColor: FlutterFlowTheme.secondaryColor,
                              onPressed: () async {
                                final measurementsUpdateData =
                                    createMeasurementsRecordData(
                                  status: 'ACTIVE',
                                  updatedAt: getCurrentTimestamp,
                                );
                                await widget.measurement.reference
                                    .update(measurementsUpdateData);
                              },
                            ),
                          ),
                        );
                      },
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
