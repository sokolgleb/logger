import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main/main_widget.dart';
import '../measurement/measurement_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditMeasurementWidget extends StatefulWidget {
  EditMeasurementWidget({
    Key key,
    this.currentMeasurement,
    this.returnTo,
    this.groupIndex,
  }) : super(key: key);

  final MeasurementsRecord currentMeasurement;
  final String returnTo;
  final int groupIndex;

  @override
  _EditMeasurementWidgetState createState() => _EditMeasurementWidgetState();
}

class _EditMeasurementWidgetState extends State<EditMeasurementWidget> {
  String dropDownValue;
  TextEditingController measurementTitleController;
  TextEditingController textController2;
  bool checkboxListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    measurementTitleController =
        TextEditingController(text: widget.currentMeasurement.title);
    textController2 =
        TextEditingController(text: widget.currentMeasurement.desc);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: StreamBuilder<List<MeasurementIndicatorTypesRecord>>(
        stream: queryMeasurementIndicatorTypesRecord(
          queryBuilder: (measurementIndicatorTypesRecord) =>
              measurementIndicatorTypesRecord
                  .where('active', isEqualTo: true)
                  .orderBy('order'),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.primaryColor,
                  size: 24,
                ),
              ),
            );
          }
          List<MeasurementIndicatorTypesRecord>
              editMeasurementMeasurementIndicatorTypesRecordList =
              snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.bGColor1,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.bGColor1,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 5,
                                  buttonSize: 40,
                                  fillColor: Color(0x00FFFFFF),
                                  icon: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: FlutterFlowTheme.bGColor1Text2,
                                    size: 24,
                                  ),
                                  onPressed: () async {
                                    await Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MeasurementWidget(
                                          returnTo: widget.returnTo,
                                          groupIndex: widget.groupIndex,
                                          currentMeasurementRef: widget
                                              .currentMeasurement.reference,
                                        ),
                                      ),
                                      (r) => false,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Edit',
                                        style: FlutterFlowTheme.title1.override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.bGColor1Text1,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, 0.22),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 5),
                                          child: Text(
                                            'measurement',
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Comfortaa',
                                              color: FlutterFlowTheme
                                                  .bGColor1Text2,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.bGColor2,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 60),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: TextFormField(
                                      controller: measurementTitleController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'title*',
                                        hintStyle:
                                            FlutterFlowTheme.title2.override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.bGColor2Text2,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Comfortaa',
                                        color: FlutterFlowTheme.bGColor2Text1,
                                      ),
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Title is required field';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  TextFormField(
                                    controller: textController2,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'desc',
                                      hintStyle: FlutterFlowTheme.bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.bodyText1,
                                    maxLines: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'This will be logged as',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.bodyText2
                                                .override(
                                              fontFamily: 'Comfortaa',
                                              color: FlutterFlowTheme
                                                  .bGColor2Text2,
                                            ),
                                          ),
                                          FlutterFlowDropDown(
                                            initialOption: dropDownValue ??=
                                                widget.currentMeasurement
                                                    .indicatorType,
                                            options: functions
                                                .prepareMeasurementIndicatorTypes(
                                                    editMeasurementMeasurementIndicatorTypesRecordList
                                                        .toList())
                                                .toList(),
                                            onChanged: (val) => setState(
                                                () => dropDownValue = val),
                                            width: 130,
                                            height: 40,
                                            textStyle: FlutterFlowTheme
                                                .bodyText1
                                                .override(
                                              fontFamily: 'Comfortaa',
                                              color: FlutterFlowTheme
                                                  .bGColor2Text1,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.bGColor2,
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 4, 8, 4),
                                            hidesUnderline: true,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: functions.isDefCheckboxAvailable(
                                            dropDownValue) ??
                                        true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 20),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x00EEEEEE),
                                        ),
                                        child: CheckboxListTile(
                                          value: checkboxListTileValue ??=
                                              widget.currentMeasurement
                                                  .usePreviousValue,
                                          onChanged: (newValue) => setState(
                                              () => checkboxListTileValue =
                                                  newValue),
                                          title: Text(
                                            'Use previous value as default',
                                            style: FlutterFlowTheme.bodyText2,
                                          ),
                                          tileColor: Color(0x00FF0000),
                                          activeColor:
                                              FlutterFlowTheme.primaryColor,
                                          checkColor:
                                              FlutterFlowTheme.secondaryColor,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 32, 0),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0x00EEEEEE),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 10,
                              buttonSize: 60,
                              fillColor: Colors.transparent,
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
                                          child: Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(alertDialogContext);

                                            final measurementsUpdateData =
                                                createMeasurementsRecordData(
                                              status: 'DELETED',
                                              updatedAt: getCurrentTimestamp,
                                            );
                                            await widget
                                                .currentMeasurement.reference
                                                .update(measurementsUpdateData);
                                            ;
                                          },
                                          child: Text('Yes, delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainWidget(
                                      groupIndex: functions
                                          .getGroupIndex(widget.groupIndex),
                                    ),
                                  ),
                                  (r) => false,
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10,
                                buttonSize: 60,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.check_outlined,
                                  color: FlutterFlowTheme.primaryColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  if (!formKey.currentState.validate()) {
                                    return;
                                  }
                                  final measurementsUpdateData =
                                      createMeasurementsRecordData(
                                    title: measurementTitleController.text,
                                    desc: textController2.text,
                                    updatedAt: getCurrentTimestamp,
                                    indicatorType: dropDownValue,
                                    usePreviousValue: checkboxListTileValue,
                                  );
                                  await widget.currentMeasurement.reference
                                      .update(measurementsUpdateData);
                                  await Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MeasurementWidget(
                                        returnTo: widget.returnTo,
                                        groupIndex: widget.groupIndex,
                                        currentMeasurementRef:
                                            widget.currentMeasurement.reference,
                                      ),
                                    ),
                                    (r) => false,
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
