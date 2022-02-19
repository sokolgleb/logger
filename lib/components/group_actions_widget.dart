import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_group/edit_group_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupActionsWidget extends StatefulWidget {
  const GroupActionsWidget({
    Key key,
    this.group,
    this.groupIndex,
    this.userGroupsCount,
  }) : super(key: key);

  final GroupsRecord group;
  final int groupIndex;
  final int userGroupsCount;

  @override
  _GroupActionsWidgetState createState() => _GroupActionsWidgetState();
}

class _GroupActionsWidgetState extends State<GroupActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).bGColor2,
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Comfortaa',
                                      color: FlutterFlowTheme.of(context)
                                          .bGColor2Text1,
                                    ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Change group data',
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
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.edit_sharp,
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditGroupWidget(
                              userGroupsCount: widget.userGroupsCount,
                              currentGroup: widget.group,
                              groupIndex: widget.groupIndex,
                            ),
                          ),
                        );
                      },
                    ),
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Comfortaa',
                                      color: FlutterFlowTheme.of(context)
                                          .bGColor2Text1,
                                    ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: AutoSizeText(
                            'Move all your measurements from current group to the archive',
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
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
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
                              title: Text('Archive group'),
                              content: Text(
                                  'Are you sure you want to archive this group?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);

                                    final groupsUpdateData =
                                        createGroupsRecordData(
                                      status: 'ARCHIVED',
                                      updatedAt: getCurrentTimestamp,
                                    );
                                    await widget.group.reference
                                        .update(groupsUpdateData);
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
                              'Un-archive group',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                  ),
                            ),
                            duration: Duration(milliseconds: 5000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).tertiaryColor,
                            action: SnackBarAction(
                              label: 'Yes, return',
                              textColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              onPressed: () async {
                                final groupsUpdateData = createGroupsRecordData(
                                  status: 'ACTIVE',
                                  updatedAt: getCurrentTimestamp,
                                );
                                await widget.group.reference
                                    .update(groupsUpdateData);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            if ((widget.userGroupsCount) > 1)
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .bGColor2Text1,
                                  ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                            ),
                            child: AutoSizeText(
                              'All your measurements also will be deleted',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .bGColor2Text2,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
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
                                title: Text('Delete group'),
                                content: Text(
                                    'Are you sure you want to delete this group?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
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
                                      await widget.group.reference
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                    ),
                              ),
                              duration: Duration(milliseconds: 5000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).tertiaryColor,
                              action: SnackBarAction(
                                label: 'Yes, restore',
                                textColor:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                onPressed: () async {
                                  final groupsUpdateData =
                                      createGroupsRecordData(
                                    status: 'ACTIVE',
                                    updatedAt: getCurrentTimestamp,
                                  );
                                  await widget.group.reference
                                      .update(groupsUpdateData);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
