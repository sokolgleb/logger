import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main/main_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditGroupWidget extends StatefulWidget {
  const EditGroupWidget({
    Key key,
    this.userGroupsCount,
    this.currentGroup,
    this.groupIndex,
  }) : super(key: key);

  final int userGroupsCount;
  final GroupsRecord currentGroup;
  final int groupIndex;

  @override
  _EditGroupWidgetState createState() => _EditGroupWidgetState();
}

class _EditGroupWidgetState extends State<EditGroupWidget> {
  TextEditingController groupTitleController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    groupTitleController =
        TextEditingController(text: widget.currentGroup.title);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MeasurementIndicatorTypesRecord>>(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 24,
              ),
            ),
          );
        }
        List<MeasurementIndicatorTypesRecord>
            editGroupMeasurementIndicatorTypesRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).bGColor1,
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
                          color: FlutterFlowTheme.of(context).bGColor1,
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
                                    color: FlutterFlowTheme.of(context)
                                        .bGColor1Text2,
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
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .bGColor1Text1,
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
                                            'group',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .bGColor1Text2,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).bGColor2,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 60),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: TextFormField(
                                    controller: groupTitleController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      hintText: 'title',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: FlutterFlowTheme.of(context)
                                                .bGColor2Text2,
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
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.of(context)
                                              .bGColor2Text1,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if ((widget.userGroupsCount) > 1)
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 10,
                                buttonSize: 60,
                                fillColor: Colors.transparent,
                                icon: Icon(
                                  Icons.delete,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('Delete group'),
                                        content: Text(
                                            'Are you sure you want to delete this group?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(alertDialogContext);

                                              final groupsUpdateData =
                                                  createGroupsRecordData(
                                                status: 'DELETED',
                                                updatedAt: getCurrentTimestamp,
                                              );
                                              await widget
                                                  .currentGroup.reference
                                                  .update(groupsUpdateData);
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 5000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                      action: SnackBarAction(
                                        label: 'Yes, restore',
                                        textColor: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        onPressed: () async {
                                          final groupsUpdateData =
                                              createGroupsRecordData(
                                            status: 'ACTIVE',
                                            updatedAt: getCurrentTimestamp,
                                          );
                                          await widget.currentGroup.reference
                                              .update(groupsUpdateData);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 10,
                              buttonSize: 60,
                              fillColor: Colors.transparent,
                              icon: Icon(
                                Icons.check_outlined,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                final groupsUpdateData = createGroupsRecordData(
                                  title: groupTitleController.text,
                                  updatedAt: getCurrentTimestamp,
                                );
                                await widget.currentGroup.reference
                                    .update(groupsUpdateData);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
