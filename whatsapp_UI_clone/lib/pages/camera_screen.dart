import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';


// StatefullWidget: trạng thái có thể thay đổi theo tg
class CameraScreen extends StatefulWidget {
   final List<CameraDescription> cameras;

   // hàm dựng nhận ds các camera và 1 key
  const CameraScreen( this.cameras, {super.key});

  @override
  State<StatefulWidget> createState() { // pt tạo, trả về trạng thái widget
    return CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController controller; // biến điều khiển camera( late: sẽ được tạo sau)

  @override
  void initState() {  // pt được gọi khi widget được khởi tạo đầu tiên
    // TODO: implement initState
    super.initState();  // gọi pt initState của lớp cha

    controller =
        new CameraController(widget.cameras[0], ResolutionPreset.ultraHigh);
        // khởi tạo CameraController với: camera đầu tiên trong ds( [0] ), và độ phân giả siêu cao
    controller.initialize().then((_) {// khởi tạo bộ điều khiển camera
      if (!mounted) {  // nếu widget vẫn trong cây widget
        return;
      }
      setState(() {});
    });
  }

  void _handleTap(TapUpDetails details) async{
    final size = MediaQuery.of(context).size;
    final x = details.localPosition.dx /size.width;
    final y = details.localPosition.dy / size.height;
    await controller.setFocusPoint(Offset(x, y));
  }
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {  // nếu camera chưa được khởi tạo
      return Container();  // trả về widget rỗng
    }
    return AspectRatio(  // AspectRatio : duy trì tỷ lệ camera
      aspectRatio: controller.value.aspectRatio,
      child: GestureDetector(
          onTapUp: _handleTap,
          child: CameraPreview(controller)),
    );
  }
}
