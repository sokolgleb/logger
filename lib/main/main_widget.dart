import '../add_group/add_group_widget.dart';
import '../add_measurement/add_measurement_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/group_actions_icons_widget.dart';
import '../components/measurement_item_widget.dart';
import '../components/right_drawer_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainWidget extends StatefulWidget {
  MainWidget({
    Key key,
    this.groupIndex,
    this.parentGroup,
  }) : super(key: key);

  final int groupIndex;
  final DocumentReference parentGroup;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GroupsRecord>>(
      stream: queryGroupsRecord(
        queryBuilder: (groupsRecord) => groupsRecord
            .where('user', isEqualTo: currentUserReference)
            .where('status', isEqualTo: 'ACTIVE')
            .orderBy('createdAt'),
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
        List<GroupsRecord> mainGroupsRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          endDrawer: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Drawer(
              elevation: 10,
              child: RightDrawerWidget(
                userGroupsCount: mainGroupsRecordList.length,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.bGColor1,
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                )
              ],
            ),
            child: Builder(
              builder: (context) {
                final userGroups = mainGroupsRecordList?.toList() ?? [];
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageViewController ??= PageController(
                            initialPage: min(
                                functions.getGroupIndex(widget.groupIndex),
                                userGroups.length - 1)),
                        scrollDirection: Axis.horizontal,
                        itemCount: userGroups.length,
                        itemBuilder: (context, userGroupsIndex) {
                          final userGroupsItem = userGroups[userGroupsIndex];
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent,
                                )
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.bGColor1,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.transparent,
                                      )
                                    ],
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 20, 20, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 8,
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                  width: 0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 20, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x80000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.2,
                                                                child:
                                                                    GroupActionsIconsWidget(
                                                                  group:
                                                                      userGroupsItem,
                                                                  groupIndex:
                                                                      userGroupsIndex,
                                                                  userGroupsCount:
                                                                      mainGroupsRecordList
                                                                          .length,
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: AutoSizeText(
                                                          userGroupsItem.title,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .title1
                                                                  .override(
                                                            fontFamily:
                                                                'Comfortaa',
                                                            color: FlutterFlowTheme
                                                                .bGColor1Text1,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x00EEEEEE),
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
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                        )
                                      ],
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        StreamBuilder<List<MeasurementsRecord>>(
                                          stream: queryMeasurementsRecord(
                                            queryBuilder: (measurementsRecord) =>
                                                measurementsRecord
                                                    .where('groups',
                                                        arrayContains:
                                                            userGroupsItem
                                                                .reference)
                                                    .where('status',
                                                        isEqualTo: 'ACTIVE')
                                                    .where('owner',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .orderBy('createdAt',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 24,
                                                  height: 24,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MeasurementsRecord>
                                                listViewMeasurementsRecordList =
                                                snapshot.data;
                                            if (listViewMeasurementsRecordList
                                                .isEmpty) {
                                              return Center(
                                                child: Image.asset(
                                                  'assets/images/empty_group.png',
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewMeasurementsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewMeasurementsRecord =
                                                    listViewMeasurementsRecordList[
                                                        listViewIndex];
                                                return MeasurementItemWidget(
                                                  measurement:
                                                      listViewMeasurementsRecord,
                                                  returnTo: 'MAIN',
                                                  groupIndex: userGroupsIndex,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 0.95),
                                          child: InkWell(
                                            onLongPress: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddGroupWidget(
                                                    userGroupsCount:
                                                        mainGroupsRecordList
                                                            .length,
                                                    parentGroup: userGroupsItem
                                                        .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 10,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              fillColor:
                                                  FlutterFlowTheme.primaryColor,
                                              icon: Icon(
                                                Icons.add,
                                                color: FlutterFlowTheme
                                                    .secondaryColor,
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddMeasurementWidget(
                                                      currentGroup:
                                                          userGroupsItem
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: SmoothPageIndicator(
                            controller: pageViewController ??= PageController(
                                initialPage: min(
                                    functions.getGroupIndex(widget.groupIndex),
                                    userGroups.length - 1)),
                            count: userGroups.length,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) {
                              pageViewController.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            effect: SlideEffect(
                              spacing: 8,
                              radius: 4,
                              dotWidth: 4,
                              dotHeight: 4,
                              dotColor: FlutterFlowTheme.tertiaryColor,
                              activeDotColor: FlutterFlowTheme.primaryColor,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
