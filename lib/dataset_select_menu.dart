import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';

String getFileNameWithoutExtension(String fileName) {
  if (fileName.contains('.')) {
    return fileName.split('.').sublist(0, fileName.split('.').length - 1).join('.');
  } else {
    return fileName; // 如果没有扩展名，直接返回原文件名
  }
}

class DatasetSelectMenu extends StatefulWidget {
  final Function(String) getDatasetName;

  const DatasetSelectMenu({
    super.key, required this.getDatasetName
  });

  @override
  State<DatasetSelectMenu> createState() => _DatasetSelectMenuState();
}

class _DatasetSelectMenuState extends State<DatasetSelectMenu> {

  String _fileName = '请选择';
  
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileName = getFileNameWithoutExtension(file.name);
      });
      widget.getDatasetName(_fileName);
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickFile();
      },
      child: DatasetSelectContainer(fileName: _fileName),
    );
  }
}

class DatasetSelectContainer extends StatefulWidget {
  final String fileName;

  const DatasetSelectContainer({
    super.key, required this.fileName,
  });

  @override
  State<DatasetSelectContainer> createState() => _DatasetSelectContainerState();
}

class _DatasetSelectContainerState extends State<DatasetSelectContainer> {
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
                  widget.fileName,
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
    );
  }
}
