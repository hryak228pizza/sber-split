import 'package:image_cropper/image_cropper.dart';

class CropScreen extends StatelessWidget {
  final File imageFile;

  const CropScreen(this.imageFile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Выберите область')),
      body: Center(
        child: ElevatedButton(
          child: Text('Обрезать изображение'),
          onPressed: () async {
            final croppedFile = await ImageCropper().cropImage(
              sourcePath: imageFile.path,
              aspectRatioPresets: [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ],
              uiSettings: [
                AndroidUiSettings(
                  toolbarTitle: 'Обрезать изображение',
                  initAspectRatio: CropAspectRatioPreset.original,
                  lockAspectRatio: false,
                ),
              ],
            );

            if (croppedFile != null) {
              Navigator.pop(context, File(croppedFile.path));
            }
          },
        ),
      ),
    );
  }
}
