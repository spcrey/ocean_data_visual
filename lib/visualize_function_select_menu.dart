import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisualizeFunctionSelectMenu extends StatefulWidget {
  final Function(String) getVisualizeFunctionName;
  const VisualizeFunctionSelectMenu({
    super.key, required this.getVisualizeFunctionName,
  });

  @override
  State<VisualizeFunctionSelectMenu> createState() => _VisualizeFunctionSelectMenuState();
}

class _VisualizeFunctionSelectMenuState extends State<VisualizeFunctionSelectMenu> {
  Offset? _menuPosition;
  String modelName = '请选择';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp : (details) {
        setState(() {
          _menuPosition = details.globalPosition;
          print(_menuPosition);
        });
        showMenu(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Color.fromRGBO(12, 181, 149, 1), width: 1),
          ),
          surfaceTintColor: Color.fromRGBO(47, 49, 53, 1),
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            details.globalPosition.dx,
            details.globalPosition.dy,
          ),
          color: Color.fromRGBO(25, 27, 31, 1),
          items: [
            PopupMenuItem(
              height : 32,
              value: '热力图',
              child: Text(
                '热力图',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            PopupMenuItem(
              height : 32,
              value: '等高线图',
              child: Text(
                '等高线图',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ).then((value){
          print(value);
          setState(() {
            modelName = value??'请选择';
            widget.getVisualizeFunctionName(modelName);
          });
        });
      },
      child: VisualizeFunctionSelectMenuContainer(visualizeFunctionName: modelName),    
    );
  }
}

class VisualizeFunctionSelectMenuContainer extends StatefulWidget {
  final String visualizeFunctionName;
  const VisualizeFunctionSelectMenuContainer({
    super.key, required this.visualizeFunctionName,
  });

  @override
  State<VisualizeFunctionSelectMenuContainer> createState() => _VisualizeFunctionSelectMenuContainerState();
}

class _VisualizeFunctionSelectMenuContainerState extends State<VisualizeFunctionSelectMenuContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  widget.visualizeFunctionName,
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
    );
  }
}
