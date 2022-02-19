import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_group/edit_group_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupActionsIconsWidget extends StatefulWidget {
  const GroupActionsIconsWidget({
    Key key,
    this.group,
    this.groupIndex,
    this.userGroupsCount,
  }) : super(key: key);

  final GroupsRecord group;
  final int groupIndex;
  final int userGroupsCount;

  @override
  _GroupActionsIconsWidgetState createState() =>
      _GroupActionsIconsWidgetState();
}

class _GroupActionsIconsWidgetState extends State<GroupActionsIconsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).bGColor2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                      if ((widget.userGroupsCount) > 1) {
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
                      } else {
                        return;
                      }
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Undo deletion',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
            ],
          ),
        ],
      ),
    );
  }
}
