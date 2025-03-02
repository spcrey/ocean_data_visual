import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocean_data_visual/channel_select_menu.dart';
import 'package:ocean_data_visual/dataset_select_menu.dart';
import 'package:ocean_data_visual/inference_button.dart';
import 'package:ocean_data_visual/model_select_menu.dart';
import 'package:ocean_data_visual/visualize_function_select_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 12),
              SvgPicture.asset(
                'assets/icons/logo.svg',  // 引用SVG文件
                width: 72,
                height: 72,
              ),
              SizedBox(width: 12),
              Text(
                '海洋数据时空超分辨率可视化系统',
                style: TextStyle(
                  fontSize: 40, // 设置字体大小为40逻辑像素
                  fontWeight: FontWeight.bold, // 设置字体加粗
                  color: Colors.white, // 设置字体颜色为白色，可根据需要修改
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromRGBO(25, 27, 31, 1),
          toolbarHeight: 96,
          centerTitle: false,
          elevation: 0,
          titleSpacing: 0,
        ),
        body: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slide(),
              Expanded(
                child: TopMenu(),
              ),
            ],
        ),
      ),
    );
  }
}

class TopMenu extends StatefulWidget {
  const TopMenu({
    super.key,
  });

  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  
  String? _datasetName;
  String? _modelName;
  String? _channelName;
  String? _visualizeFuncutionName;

  void _getDatasetName(String name) {
    setState(() {
      _datasetName = name;
    });
  }

  void _getModeltName(String name) {
    setState(() {
      _modelName = name;
    });
  }

  void _getChannelName(String name) {
    setState(() {
      _channelName = name;
    });
  }

  void _getVisualizeFunctionName(String name) {
    setState(() {
      _visualizeFuncutionName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(14, 16, 17, 1),
      padding: EdgeInsets.only(left: 24,top: 24),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 536*2,
            height: 66*2,
            decoration: BoxDecoration(
              color: Color.fromRGBO(25, 27, 31, 1),
              borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 24,
                  child: Text('参数设定',
                    style: TextStyle(
                      fontSize: 20, // 设置字体大小为40逻辑像素
                      fontWeight: FontWeight.bold, // 设置字体加粗
                      color: Colors.white, // 设置字体颜色为白色，可根据需要修改
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DatasetSelectMenu(getDatasetName : _getDatasetName),
                    SizedBox(
                      width: 12,
                    ),
                    ModelSelectMenu(getModeltName: _getModeltName),
                    SizedBox(
                      width: 12,
                    ),
                    ChannelSelectMenu(getChannelName: _getChannelName),
                    SizedBox(
                      width: 12,
                    ),
                    VisualizeFunctionSelectMenu(getVisualizeFunctionName: _getVisualizeFunctionName),
                    SizedBox(
                      width: 12,
                    ),
                    // FloatWindowPageState(),
                    InferenceButton(
                      datasetName: _datasetName,
                      modelName: _modelName,
                      channelName: _channelName,
                      visualizeFuncutionName: _visualizeFuncutionName,
                    ),
                  ],
                ),
              ],
            )
          ),
          SizedBox(
            height: 24,
          ),
          // NoResult(),
          // WaitingResult(),
          Result(),
        ],
      )
    );
  }
}

class NoResult extends StatelessWidget {
  const NoResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 536*2,
      height: 182*2,
      child: Center(
        child: Text(
          '可视化结果待生成',
          style: TextStyle(
            fontSize: 20,
            height: 1.2,
            color: const Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
      ),
    );
  }
}

class WaitingResult extends StatelessWidget {
  const WaitingResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 536*2,
      height: 182*2,
      child: Center(
        child: Text(
          '可视化结果生成中...',
          style: TextStyle(
            fontSize: 20,
            height: 1.2,
            color: const Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
      ),
    );
  }
}


class Result extends StatelessWidget {
  const Result({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 252*2,
          height: 182*2,
          decoration: BoxDecoration(
            color: Color.fromRGBO(25, 27, 31, 1),
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                height: 24,
                child: Text(
                  '可视化对比（Frame=22）',
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 480,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/H_GT22.jpg',
                    width: 240,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 480,
                height: 20,
                child: Center(
                  child: Text(
                    'GT',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 480,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/H_Model22.jpg',
                    width: 240,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              SizedBox(
                width: 480,
                height: 20,
                child: Center(
                  child: Text(
                    'Model',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 272*2,
              height: 128*2,
              decoration: BoxDecoration(
                color: Color.fromRGBO(25, 27, 31, 1),
                borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    height: 24,
                    child: Text(
                      '全局PSNR折线图',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SvgPicture.asset(
                    'assets/images/rb2d_psnr.svg',
                    width: 508,
                    height: 168,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 16,
                    width: 508,
                    child: Center(
                      child: Text(
                        'Epoch Index',
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            ImageFrameController(),
          ],
        ),
      ],
    );
  }
}

class VideoController extends StatelessWidget {
  const VideoController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      height: 92,
      decoration: BoxDecoration(
        color: Color.fromRGBO(25, 27, 31, 1),
        borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 24,
            child: Text(
              '视频控制',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  width: 44,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(12, 181, 149, 1),
                    borderRadius: BorderRadius.circular(4), // 设置圆角大小为10
                  ),
                  child: Center(
                    child: Text(
                      '播放',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                child: Container(
                  width: 44,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 132, 75, 1),
                    borderRadius: BorderRadius.circular(4), // 设置圆角大小为10
                  ),
                  child: Center(
                    child: Text(
                      '暂停',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageFrameController extends StatelessWidget {
  const ImageFrameController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 92,
      decoration: BoxDecoration(
        color: Color.fromRGBO(25, 27, 31, 1),
        borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            width: 132,
            height: 24,
            child: Text(
              '图片帧控制',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(12, 181, 149, 1),
                    borderRadius: BorderRadius.circular(4), // 设置圆角大小为10
                  ),
                  child: Center(
                    child: Text(
                      '上一帧',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 132, 75, 1),
                    borderRadius: BorderRadius.circular(4), // 设置圆角大小为10
                  ),
                  child: Center(
                    child: Text(
                      '下一帧',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ParameterMenu extends StatelessWidget {
  const ParameterMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 72,
      decoration: BoxDecoration(
      color: Color.fromRGBO(47, 49, 53, 1),
        borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
      ),
      padding: EdgeInsets.all(12),
      child: Column(

      ),
    );
  }
}

class Slide extends StatefulWidget {
  const Slide({
    super.key,
  });

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {

  bool isVideoModeSelected = true;
    
  @override
  Widget build(BuildContext context) {

    return Container(
      width: 144,
      color: const Color.fromRGBO(25, 27, 31, 1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SlideMenu(
            svgAssetPath: 'assets/icons/video_mode.svg',
            text: '视频模式',
            backgroundColor: isVideoModeSelected ? Color.fromRGBO(47, 49, 53, 1) : Color.fromRGBO(25, 27, 31, 1),
            elementColor: isVideoModeSelected ?  Color.fromRGBO(12, 181, 149, 1) : Color.fromRGBO(255, 255, 255, 1),
            onTap: (){
              setState((){
                isVideoModeSelected = true;
              });
            },
          ),
          SlideMenu(
            svgAssetPath: 'assets/icons/image_mode.svg',
            text: '图片模式',
            backgroundColor: !isVideoModeSelected ? Color.fromRGBO(47, 49, 53, 1) : Color.fromRGBO(25, 27, 31, 1),
            elementColor: !isVideoModeSelected ?  Color.fromRGBO(12, 181, 149, 1) : Color.fromRGBO(255, 255, 255, 1),
            onTap: (){
              setState((){
                isVideoModeSelected = false;
              });
            },
          ),
        ],
      ),
    );
  }
}

class SlideMenu extends StatefulWidget {
  final String svgAssetPath;
  final String text;
  final Color backgroundColor;
  final Color elementColor;
  final VoidCallback onTap;

  const SlideMenu({
    super.key,
    required this.svgAssetPath,
    required this.text, 
    required this.backgroundColor, 
    required this.elementColor, required this.onTap,
  });

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 96,
        width: 144,
        color: widget.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              widget.svgAssetPath,
              width: 48,
              height: 48,
              color: widget.elementColor,
            ),
            SizedBox(
              height: 24,
              child: Text(widget.text,
              style: TextStyle(
                fontSize: 16,
                color: widget.elementColor,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


