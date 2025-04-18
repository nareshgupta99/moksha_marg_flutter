import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moksha_marg/bootom_navigation_controller.dart';
import 'package:moksha_marg/network/response/temple_data.dart';
import 'package:moksha_marg/reusable/navigation.dart';
import 'package:moksha_marg/util/colors_resources.dart';
import 'package:moksha_marg/util/dimensions.dart';
import 'package:moksha_marg/util/typography_resources.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveDarshanView extends StatefulWidget {
  final TempleData temple;
  LiveDarshanView({super.key, required this.temple});

  @override
  State<LiveDarshanView> createState() => _LiveDarshanViewState();
}

class _LiveDarshanViewState extends State<LiveDarshanView> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    Get.find<BootomNavigationController>().init();

    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              widget.temple.livelink??"") ??
          "",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isLandscape = orientation == Orientation.landscape;
        if (isLandscape) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: []);
        } else {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }

        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.redAccent,
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          builder: (context, player) {
            return Scaffold(
              appBar: isLandscape
                  ? null
                  : topNavigaton(text: "Live Darshan", isLeading: true),
              bottomNavigationBar: isLandscape ? null : bottomNavigaton(),
              backgroundColor: ColorsResources.backgroundColor,
              body: isLandscape
                  ? Center(child: player)
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.r, vertical: Dimensions.padding16),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadius9),
                            ),
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.padding12),
                                  child: player,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.padding16,
                                      left: Dimensions.padding16),
                                  child: Text(
                                    widget.temple.name??"",
                                    style: TextStyle(
                                      fontFamily: TypographyResources.roboto,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.padding16),
                                  child: Text(
                                    widget.temple.city ??"",
                                    style: TextStyle(
                                      color: ColorsResources.greyColor,
                                      fontFamily: TypographyResources.roboto,
                                      fontSize: Dimensions.font12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: Dimensions.padding16,
                                      left: Dimensions.padding16),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.eye_fill,
                                        color: ColorsResources.greyColor,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "2.4k watching",
                                        style: TextStyle(
                                          color: ColorsResources.greyColor,
                                          fontFamily:
                                              TypographyResources.roboto,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
