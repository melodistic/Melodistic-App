import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/models/track.model.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:melodistic/singleton/controller.dart';
import '../../utils.dart';

void main() {
  Controller.setup();
  testWidgets('trackbox render correctly when get data',
      (WidgetTester tester) async {
    Track data = Track(
        trackId: '1',
        trackName: "It's long time ago",
        trackImageUrl: 'https://img.cscms.me/6b4X3LyVJOYaLd9UXVOq.png',
        muscleGroup: 'ABS',
        description: '12 minutes of abs workout',
        duration: 720,
        isPublic: true,
        isFav: false,
        tag: 'Running');
    await mockNetworkImagesFor(() => tester.pumpWidget(createScaffoldForTesting(
            child: TrackBox(
          track: data,
        ))));
    final Finder trackName = find.text("It's long time ago");
    final Finder muscleGroup = find.text('ABS');
    final Finder description = find.text('12 minutes of abs workout');
    // final Image image = getWidgetByType(tester, Image) as Image;
    expect(trackName, findsOneWidget);
    expect(muscleGroup, findsOneWidget);
    expect(description, findsOneWidget);
    // expect((image.image as NetworkImage).url, data.trackImageUrl);
  });
}
