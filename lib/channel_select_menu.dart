import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChannelSelectMenu extends StatefulWidget {
  final Function(String) getChannelName;
  const ChannelSelectMenu({
    super.key, required this.getChannelName,
  });

  @override
  State<ChannelSelectMenu> createState() => _ChannelSelectMenuState();
}

class _ChannelSelectMenuState extends State<ChannelSelectMenu> {
  Offset? _menuPosition;
  String channelName = '请选择';

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
              value: '温度T',
              child: Text(
                '温度T',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            PopupMenuItem(
              height : 32,
              value: '压强p',
              child: Text(
                '压强p',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            PopupMenuItem(
              height : 32,
              value: '速度u',
              child: Text(
                '速度u',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            PopupMenuItem(
              height : 32,
              value: '速度w',
              child: Text(
                '速度w',
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
            channelName = value??'请选择';
            widget.getChannelName(channelName);
          });
        });
      },
      child: ChannelSelectMenuContainer(channelName: channelName),    
    );
  }
}

class ChannelSelectMenuContainer extends StatefulWidget {
  final String channelName;
  const ChannelSelectMenuContainer({
    super.key, required this.channelName,
  });

  @override
  State<ChannelSelectMenuContainer> createState() => _ChannelSelectMenuContainerState();
}

class _ChannelSelectMenuContainerState extends State<ChannelSelectMenuContainer> {
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
                  widget.channelName,
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
    );
  }
}
