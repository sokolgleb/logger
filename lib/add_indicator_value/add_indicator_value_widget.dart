import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddIndicatorValueWidget extends StatefulWidget {
  const AddIndicatorValueWidget({
    Key key,
    this.currentMeasurement,
  }) : super(key: key);

  final MeasurementsRecord currentMeasurement;

  @override
  _AddIndicatorValueWidgetState createState() =>
      _AddIndicatorValueWidgetState();
}

class _AddIndicatorValueWidgetState extends State<AddIndicatorValueWidget> {
  DateTime datePicked;
  String uploadedFileUrl1 = '';
  TextEditingController numberValueController;
  TextEditingController textValueController;
  double sliderValueValue;
  double ratingValueValue;
  bool switchValueValue;
  String uploadedFileUrl2 = '';
  TextEditingController daysController;
  TextEditingController hoursController;
  TextEditingController minutesController;
  TextEditingController secondsController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    daysController = TextEditingController(
        text: functions.addValueGetDefaultDaysValue(
            widget.currentMeasurement.usePreviousValue,
            widget.currentMeasurement.indicatorDefaultTimeValue));
    hoursController = TextEditingController(
        text: functions.addValueGetDefaultHoursValue(
            widget.currentMeasurement.usePreviousValue,
            widget.currentMeasurement.indicatorDefaultTimeValue));
    minutesController = TextEditingController(
        text: functions.addValueGetDefaultMinutesValue(
            widget.currentMeasurement.usePreviousValue,
            widget.currentMeasurement.indicatorDefaultTimeValue));
    secondsController = TextEditingController(
        text: functions.addValueGetDefaultSecondsValue(
            widget.currentMeasurement.usePreviousValue,
            widget.currentMeasurement.indicatorDefaultTimeValue));
    numberValueController = TextEditingController(
        text: functions.addValueGetDefaultNumberValue(
            widget.currentMeasurement.usePreviousValue,
            widget.currentMeasurement.indicatorDefaultNumberValue,
            widget.currentMeasurement.valuesCount,
            widget.currentMeasurement.indicatorType));
    textValueController = TextEditingController();
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
            addIndicatorValueMeasurementIndicatorTypesRecordList =
            snapshot.data;
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).bGColor1,
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .bGColor1Text2,
                                      size: 24,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
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
                                          maxHeight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0x00EEEEEE),
                                        ),
                                        child: AutoSizeText(
                                          widget.currentMeasurement.title,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .bGColor1Text1,
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
                          height: double.infinity,
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
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Number')
                                  TextFormField(
                                    controller: numberValueController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      hintText: 'value',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: FlutterFlowTheme.of(context)
                                                .bGColor2Text2,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context).title2,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Text')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 5),
                                    child: TextFormField(
                                      controller: textValueController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .bGColor2Text2,
                                            ),
                                        hintText: 'Add your text',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .bGColor2Text2,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: FlutterFlowTheme.of(context)
                                                .bGColor2Text1,
                                          ),
                                      textAlign: TextAlign.center,
                                      maxLines: 25,
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Slider')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((widget.currentMeasurement
                                                .indicatorType) ==
                                            'Slider')
                                          Slider.adaptive(
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            inactiveColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            min: 0,
                                            max: 10,
                                            value: sliderValueValue ??= functions
                                                .addValueGetDefaultSliderValue(
                                                    widget.currentMeasurement
                                                        .usePreviousValue,
                                                    widget.currentMeasurement
                                                        .indicatorDefaultSliderValue),
                                            label: sliderValueValue.toString(),
                                            divisions: 10,
                                            onChanged: (newValue) {
                                              setState(() =>
                                                  sliderValueValue = newValue);
                                            },
                                          ),
                                        Text(
                                          '${functions.getFixedDouble(sliderValueValue)} / 10',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Comfortaa',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Rating')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((widget.currentMeasurement
                                                .indicatorType) ==
                                            'Rating')
                                          RatingBar.builder(
                                            onRatingUpdate: (newValue) =>
                                                setState(() =>
                                                    ratingValueValue =
                                                        newValue),
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star_border_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                            direction: Axis.horizontal,
                                            initialRating: ratingValueValue ??=
                                                functions
                                                    .addValueGetDefaultRatingValue(
                                                        widget
                                                            .currentMeasurement
                                                            .usePreviousValue,
                                                        widget
                                                            .currentMeasurement
                                                            .indicatorDefaultRatingValue)
                                                    .toDouble()
                                                    .toDouble(),
                                            unratedColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiaryColor,
                                            itemCount: 5,
                                            itemSize: 40,
                                            glowColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Switch')
                                  Container(
                                    width: 60,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: SwitchListTile.adaptive(
                                      value: switchValueValue ??= functions
                                          .addValueGetDefaultSwitchValue(
                                              widget.currentMeasurement
                                                  .usePreviousValue,
                                              widget.currentMeasurement
                                                  .indicatorDefaultBooleanValue),
                                      onChanged: (newValue) => setState(
                                          () => switchValueValue = newValue),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryColor,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Image')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions
                                                .isHasValue(uploadedFileUrl1) ??
                                            true)
                                          CachedNetworkImage(
                                            imageUrl: uploadedFileUrl1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        FlutterFlowIconButton(
                                          borderColor: Color(0x00620F0F),
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.image_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .bGColor2,
                                              textColor:
                                                  FlutterFlowTheme.of(context)
                                                      .bGColor2Text1,
                                              pickerFontFamily: 'Comfortaa',
                                            );
                                            if (selectedMedia != null &&
                                                validateFileFormat(
                                                    selectedMedia.storagePath,
                                                    context)) {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              final downloadUrl =
                                                  await uploadData(
                                                      selectedMedia.storagePath,
                                                      selectedMedia.bytes);
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              if (downloadUrl != null) {
                                                setState(() =>
                                                    uploadedFileUrl1 =
                                                        downloadUrl);
                                                showUploadMessage(
                                                  context,
                                                  'Success!',
                                                );
                                              } else {
                                                showUploadMessage(
                                                  context,
                                                  'Failed to upload media',
                                                );
                                                return;
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Video')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (functions
                                                .isHasValue(uploadedFileUrl2) ??
                                            true)
                                          FlutterFlowVideoPlayer(
                                            path: uploadedFileUrl2,
                                            videoType: VideoType.network,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            autoPlay: false,
                                            looping: true,
                                            showControls: true,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: true,
                                          ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          fillColor: Colors.transparent,
                                          icon: Icon(
                                            Icons.video_collection_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: false,
                                              allowVideo: true,
                                            );
                                            if (selectedMedia != null &&
                                                validateFileFormat(
                                                    selectedMedia.storagePath,
                                                    context)) {
                                              showUploadMessage(
                                                context,
                                                'Uploading file...',
                                                showLoading: true,
                                              );
                                              final downloadUrl =
                                                  await uploadData(
                                                      selectedMedia.storagePath,
                                                      selectedMedia.bytes);
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar();
                                              if (downloadUrl != null) {
                                                setState(() =>
                                                    uploadedFileUrl2 =
                                                        downloadUrl);
                                                showUploadMessage(
                                                  context,
                                                  'Success!',
                                                );
                                              } else {
                                                showUploadMessage(
                                                  context,
                                                  'Failed to upload media',
                                                );
                                                return;
                                              }
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                if ((widget.currentMeasurement.indicatorType) ==
                                    'Time')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: TextFormField(
                                              controller: daysController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                hintText: 'DD',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: TextFormField(
                                              controller: hoursController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                hintText: 'HH\n',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: TextFormField(
                                              controller: minutesController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                hintText: 'MM\n',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 5, 0),
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x00EEEEEE),
                                            ),
                                            child: TextFormField(
                                              controller: secondsController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                hintText: 'SS',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              textAlign: TextAlign.center,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            functions
                                                .getCurrentDateTime(datePicked),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Comfortaa',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .bGColor2Text2,
                                                ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20,
                                            borderWidth: 1,
                                            buttonSize: 40,
                                            fillColor: Colors.transparent,
                                            icon: Icon(
                                              Icons.access_time_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                            onPressed: () async {
                                              await DatePicker
                                                  .showDateTimePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(
                                                      () => datePicked = date);
                                                },
                                                currentTime:
                                                    getCurrentTimestamp,
                                                minTime: DateTime(0, 0, 0),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
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
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 10,
                            buttonSize: 60,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.check_outlined,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 30,
                            ),
                            onPressed: () async {
                              final measurementIndicatorValuesCreateData =
                                  createMeasurementIndicatorValuesRecordData(
                                timestamp: functions.getTimestamp(datePicked),
                                type: widget.currentMeasurement.indicatorType,
                                user: currentUserReference,
                                measurement:
                                    widget.currentMeasurement.reference,
                                createdAt: getCurrentTimestamp,
                                updatedAt: getCurrentTimestamp,
                                numberValue: functions.getNumberValue(
                                    widget.currentMeasurement.indicatorType,
                                    double.parse(numberValueController.text)),
                                textValue: functions.getTextValue(
                                    widget.currentMeasurement.indicatorType,
                                    textValueController.text),
                                sliderValue: functions.getSliderValue(
                                    widget.currentMeasurement.indicatorType,
                                    sliderValueValue),
                                ratingValue: functions.getRatingValue(
                                    widget.currentMeasurement.indicatorType,
                                    ratingValueValue.round()),
                                switchValue: functions.getSwitchValue(
                                    widget.currentMeasurement.indicatorType,
                                    switchValueValue),
                                imageValue: functions.getImageValue(
                                    widget.currentMeasurement.indicatorType,
                                    uploadedFileUrl1),
                                videoValue: functions.getVideoValue(
                                    widget.currentMeasurement.indicatorType,
                                    uploadedFileUrl2),
                                timeValue: functions.getTimeValue(
                                    widget.currentMeasurement.indicatorType,
                                    daysController.text,
                                    hoursController.text,
                                    minutesController.text,
                                    secondsController.text),
                              );
                              await MeasurementIndicatorValuesRecord.collection
                                  .doc()
                                  .set(measurementIndicatorValuesCreateData);

                              final measurementsUpdateData = {
                                ...createMeasurementsRecordData(
                                  indicatorDefaultStringValue:
                                      functions.getTextValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          textValueController.text),
                                  indicatorDefaultNumberValue:
                                      functions.getNumberValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          double.parse(
                                              numberValueController.text)),
                                  indicatorDefaultSliderValue:
                                      functions.getSliderValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          sliderValueValue),
                                  indicatorDefaultRatingValue:
                                      functions.getRatingValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          ratingValueValue.round()),
                                  indicatorDefaultBooleanValue:
                                      functions.getSwitchValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          switchValueValue),
                                  indicatorDefaultTimeValue:
                                      functions.getTimeValue(
                                          widget
                                              .currentMeasurement.indicatorType,
                                          daysController.text,
                                          hoursController.text,
                                          minutesController.text,
                                          secondsController.text),
                                ),
                                'valuesCount': FieldValue.increment(1),
                              };
                              await widget.currentMeasurement.reference
                                  .update(measurementsUpdateData);
                              Navigator.pop(context);
                            },
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
