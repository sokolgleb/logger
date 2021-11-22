import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main/main_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGroupWidget extends StatefulWidget {
  AddGroupWidget({
    Key key,
    this.userGroupsCount,
    this.parentGroup,
  }) : super(key: key);

  final int userGroupsCount;
  final DocumentReference parentGroup;

  @override
  _AddGroupWidgetState createState() => _AddGroupWidgetState();
}

class _AddGroupWidgetState extends State<AddGroupWidget> {
  GroupsRecord newGroup;
  TextEditingController groupTitleController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    groupTitleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
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
                                Navigator.pop(context);
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add',
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Comfortaa',
                                      color: FlutterFlowTheme.bGColor1Text1,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.22),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 5),
                                      child: Text(
                                        'group',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Comfortaa',
                                          color: FlutterFlowTheme.bGColor1Text2,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 60),
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
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: TextFormField(
                                  controller: groupTitleController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'title',
                                    hintStyle: FlutterFlowTheme.title2.override(
                                      fontFamily: 'Comfortaa',
                                      color: FlutterFlowTheme.bGColor2Text2,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Comfortaa',
                                    color: FlutterFlowTheme.bGColor2Text1,
                                  ),
                                  textAlign: TextAlign.center,
                                  validator: (val) {
                                    if (val.isEmpty) {
                                      return 'Title is required field';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            )
                          ],
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 1),
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
                            final groupsCreateData = createGroupsRecordData(
                              title: groupTitleController.text,
                              user: currentUserReference,
                              createdAt: getCurrentTimestamp,
                              updatedAt: getCurrentTimestamp,
                              status: 'ACTIVE',
                              order: widget.userGroupsCount,
                              parentGroup: widget.parentGroup,
                              hasParentGroup: functions
                                  .isHasParentGroup(widget.parentGroup),
                            );
                            final groupsRecordReference =
                                GroupsRecord.collection.doc();
                            await groupsRecordReference.set(groupsCreateData);
                            newGroup = GroupsRecord.getDocumentFromData(
                                groupsCreateData, groupsRecordReference);
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainWidget(
                                  groupIndex: widget.userGroupsCount,
                                ),
                              ),
                              (r) => false,
                            );

                            setState(() {});
                          },
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
    );
  }
}
