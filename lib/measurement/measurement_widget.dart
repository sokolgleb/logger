import '../add_indicator_value/add_indicator_value_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/measurement_indicator_valu_item_widget.dart';
import '../components/mesurement_actions_icons_widget.dart';
import '../components/value_actions_icon_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main/main_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementWidget extends StatefulWidget {
  const MeasurementWidget({
    Key key,
    this.currentMeasurementRef,
    this.returnTo,
    this.groupIndex,
  }) : super(key: key);

  final DocumentReference currentMeasurementRef;
  final String returnTo;
  final int groupIndex;

  @override
  _MeasurementWidgetState createState() => _MeasurementWidgetState();
}

class _MeasurementWidgetState extends State<MeasurementWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MeasurementsRecord>(
      stream: MeasurementsRecord.getDocument(widget.currentMeasurementRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 24,
              ),
            ),
          );
        }
        final measurementMeasurementsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).bGColor1,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).bGColor1,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 5,
                              buttonSize: 40,
                              fillColor: Color(0x00FFFFFF),
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                color:
                                    FlutterFlowTheme.of(context).bGColor1Text2,
                                size: 24,
                              ),
                              onPressed: () async {
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainWidget(
                                      groupIndex: widget.groupIndex,
                                    ),
                                  ),
                                  (r) => false,
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.08,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: AutoSizeText(
                                    measurementMeasurementsRecord.title,
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.of(context)
                                              .bGColor1Text1,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                            ),
                            child: Visibility(
                              visible: (measurementMeasurementsRecord.owner) ==
                                  (currentUserReference),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 5,
                                buttonSize: 40,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .bGColor1Text2,
                                  size: 24,
                                ),
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x80000000),
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: MesurementActionsIconsWidget(
                                            measurement:
                                                measurementMeasurementsRecord,
                                            returnTo: widget.returnTo,
                                            groupIndex: widget.groupIndex,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).bGColor2,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0x00FFFFFF),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, -0.6),
                              child: DefaultTabController(
                                length: 2,
                                initialIndex: 0,
                                child: Column(
                                  children: [
                                    TabBar(
                                      isScrollable: true,
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              30, 0, 30, 0),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                      indicatorWeight: 1,
                                      tabs: [
                                        Tab(
                                          icon: Icon(
                                            Icons.info_sharp,
                                          ),
                                          iconMargin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 1, 1, 1),
                                        ),
                                        Tab(
                                          icon: Icon(
                                            Icons.table_rows_sharp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 10, 20, 60),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    if (functions.isHasValue(
                                                            measurementMeasurementsRecord
                                                                .desc) ??
                                                        true)
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00EEEEEE),
                                                        ),
                                                        child: AutoSizeText(
                                                          measurementMeasurementsRecord
                                                              .desc,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Comfortaa',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bGColor2Text1,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 60),
                                                  child: StreamBuilder<
                                                      List<
                                                          MeasurementIndicatorValuesRecord>>(
                                                    stream:
                                                        queryMeasurementIndicatorValuesRecord(
                                                      queryBuilder: (measurementIndicatorValuesRecord) =>
                                                          measurementIndicatorValuesRecord
                                                              .where(
                                                                  'measurement',
                                                                  isEqualTo: widget
                                                                      .currentMeasurementRef)
                                                              .orderBy(
                                                                  'timestamp',
                                                                  descending:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 24,
                                                            height: 24,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 24,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<MeasurementIndicatorValuesRecord>
                                                          containerMeasurementIndicatorValuesRecordList =
                                                          snapshot.data;
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00EEEEEE),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if ((containerMeasurementIndicatorValuesRecordList
                                                                    .length) >
                                                                0)
                                                              SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x00EEEEEE),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x00EEEEEE),
                                                                              ),
                                                                              child: AutoSizeText(
                                                                                '#',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Comfortaa',
                                                                                      color: FlutterFlowTheme.of(context).bGColor2Text1,
                                                                                      fontSize: 14,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                6,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: Text(
                                                                                  'what',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Comfortaa',
                                                                                        color: FlutterFlowTheme.of(context).bGColor2Text1,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00EEEEEE),
                                                                                ),
                                                                                child: AutoSizeText(
                                                                                  'when',
                                                                                  textAlign: TextAlign.end,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Comfortaa',
                                                                                        color: FlutterFlowTheme.of(context).bGColor2Text1,
                                                                                        fontSize: 14,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      height:
                                                                          20,
                                                                      thickness:
                                                                          1,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bGColor2Text2,
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final measurementValues =
                                                                            containerMeasurementIndicatorValuesRecordList?.toList() ??
                                                                                [];
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(measurementValues.length, (measurementValuesIndex) {
                                                                              final measurementValuesItem = measurementValues[measurementValuesIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                child: InkWell(
                                                                                  onLongPress: () async {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x7F000000),
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return Padding(
                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.2,
                                                                                            child: ValueActionsIconWidget(
                                                                                              currentValue: measurementValuesItem.reference,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    constraints: BoxConstraints(
                                                                                      maxHeight: 100,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.transparent,
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0),
                                                                                        bottomRight: Radius.circular(5),
                                                                                        topLeft: Radius.circular(5),
                                                                                        topRight: Radius.circular(5),
                                                                                      ),
                                                                                      shape: BoxShape.rectangle,
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00EEEEEE),
                                                                                            ),
                                                                                            child: AutoSizeText(
                                                                                              functions.getHumanReadableIndex(measurementValuesIndex).toString(),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Comfortaa',
                                                                                                    color: FlutterFlowTheme.of(context).bGColor2Text1,
                                                                                                    fontSize: 14,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 6,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00EEEEEE),
                                                                                              ),
                                                                                              child: MeasurementIndicatorValuItemWidget(
                                                                                                currentValue: measurementValuesItem,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                                                            child: Container(
                                                                                              constraints: BoxConstraints(
                                                                                                maxHeight: 20,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: Color(0x00EEEEEE),
                                                                                              ),
                                                                                              child: AutoSizeText(
                                                                                                dateTimeFormat('d/M h:mm a', measurementValuesItem.timestamp),
                                                                                                textAlign: TextAlign.end,
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Comfortaa',
                                                                                                      color: FlutterFlowTheme.of(context).bGColor2Text1,
                                                                                                      fontSize: 14,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if ((containerMeasurementIndicatorValuesRecordList
                                                                    .length) ==
                                                                0)
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.7,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00EEEEEE),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/empty_values.png',
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 10,
                                        buttonSize: 40,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          size: 24,
                                        ),
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddIndicatorValueWidget(
                                                currentMeasurement:
                                                    measurementMeasurementsRecord,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'from ${dateTimeFormat('d/M/y', measurementMeasurementsRecord.createdAt)}',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: FlutterFlowTheme.of(context)
                                                .bGColor2Text2,
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
