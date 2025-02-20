import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class InferenceButton extends StatefulWidget {
  final String? datasetName;
  final String? modelName;
  final String? channelName;
  final String? visualizeFuncutionName;

  const InferenceButton({
    super.key, 
    required this.datasetName, required this.modelName, required this.channelName, required this.visualizeFuncutionName, 
  });

  @override
  State<InferenceButton> createState() => _InferenceButtonState();
}

class _InferenceButtonState extends State<InferenceButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.datasetName);
        print(widget.modelName);
        print(widget.channelName);
        print(widget.visualizeFuncutionName);
      },
      child: InferenceButtonContainer(),
    );
  }
}

class InferenceButtonContainer extends StatelessWidget {
  const InferenceButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
