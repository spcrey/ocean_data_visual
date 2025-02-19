import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Root widget
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
                '海洋数据可视化系统',
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
                child: Container(
                  color: const Color.fromRGBO(14, 16, 17, 1),
                  padding: EdgeInsets.only(left: 24,top: 24),
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                                Container(
                                  width: 216,
                                  height: 72,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                  color: Color.fromRGBO(47, 49, 53, 1),
                                    borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/dataset.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '请选择',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 20, // 固定高度为20
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2), // 设置内边距
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(219, 122, 69, 1), // 背景颜色
                                              borderRadius: BorderRadius.circular(2), // 圆角
                                            ),
                                            child: Text(
                                              '数据集选择',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 1.2,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  width: 216,
                                  height: 72,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                  color: Color.fromRGBO(47, 49, 53, 1),
                                    borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/model.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '请选择',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 20, // 固定高度为20
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2), // 设置内边距
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(219, 122, 69, 1), // 背景颜色
                                              borderRadius: BorderRadius.circular(2), // 圆角
                                            ),
                                            child: Text(
                                              '模型选择',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 1.2,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  width: 216,
                                  height: 72,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                  color: Color.fromRGBO(47, 49, 53, 1),
                                    borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/channel.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '请选择',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 20, // 固定高度为20
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2), // 设置内边距
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(219, 122, 69, 1), // 背景颜色
                                              borderRadius: BorderRadius.circular(2), // 圆角
                                            ),
                                            child: Text(
                                              '通道选择',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 1.2,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  width: 216,
                                  height: 72,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                  color: Color.fromRGBO(47, 49, 53, 1),
                                    borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/visual_method.svg',
                                        width: 48,
                                        height: 48,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 20,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '请选择',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            height: 20, // 固定高度为20
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2), // 设置内边距
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(219, 122, 69, 1), // 背景颜色
                                              borderRadius: BorderRadius.circular(2), // 圆角
                                            ),
                                            child: Text(
                                              '可视化方式选择',
                                              style: TextStyle(
                                                fontSize: 12,
                                                height: 1.2,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  width: 132,
                                  height: 72,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                  color: Color.fromRGBO(12, 181, 149, 1),
                                    borderRadius: BorderRadius.circular(6), // 设置圆角大小为10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/inference.svg',
                                        width: 48,
                                        height: 48,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('推理',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white, 
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      )
                    ],
                  )
                ),
              ),
            ],
        ),
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