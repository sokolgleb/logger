import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_measurement/edit_measurement_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MesurementActionsIconsWidget extends StatefulWidget {
  const MesurementActionsIconsWidget({
    Key key,
    this.measurement,
    this.returnTo,
    this.groupIndex,
  }) : super(key: key);

  final MeasurementsRecord measurement;
  final String returnTo;
  final int groupIndex;

  @override
  _MesurementActionsIconsWidgetState createState() =>
      _MesurementActionsIconsWidgetState();
}

class _MesurementActionsIconsWidgetState
    extends State<MesurementActionsIconsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).bGColor2,
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
                fillColor: FlutterFlowTheme.of(context).transparentTertiary,
                icon: Icon(
                  Icons.edit_sharp,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
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
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.of(context).transparentTertiary,
                icon: Icon(
                  Icons.archive_sharp,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
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
                            onPressed: () => Navigator.pop(alertDialogContext),
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                      ),
                      duration: Duration(milliseconds: 5000),
                      backgroundColor:
                          FlutterFlowTheme.of(context).tertiaryColor,
                      action: SnackBarAction(
                        label: 'Yes, return',
                        textColor: FlutterFlowTheme.of(context).secondaryColor,
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
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: FlutterFlowTheme.of(context).trnsparentMain,
                icon: Icon(
                  Icons.delete,
                  color: FlutterFlowTheme.of(context).primaryColor,
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
                            onPressed: () => Navigator.pop(alertDialogContext),
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
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Comfortaa',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                      ),
                      duration: Duration(milliseconds: 5000),
                      backgroundColor:
                          FlutterFlowTheme.of(context).tertiaryColor,
                      action: SnackBarAction(
                        label: 'Yes, restore',
                        textColor: FlutterFlowTheme.of(context).secondaryColor,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
