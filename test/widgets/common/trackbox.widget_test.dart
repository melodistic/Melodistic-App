import 'package:flutter_test/flutter_test.dart';
import 'package:melodistic/screens/home/track_mock_data.dart';
import 'package:melodistic/screens/home/widgets/trackbox.widget.dart';

import '../../utils.dart';

void main() {
  testWidgets('trackbox render correctly when get data',
      (WidgetTester tester) async {
    Track data = Track(
        trackId: '1',
        trackName: "It's long time ago",
        trackImageUrl: 'https://img.cscms.me/6b4X3LyVJOYaLd9UXVOq.png',
        muscleGroup: 'ABS',
        description: '12 minutes of abs workout',
        duration: 720,
        isPublic: true);
    await tester.pumpWidget(createScaffoldForTesting(
        child: TrackBox(
      track: data,
    )));
    final Finder trackName = find.text("It's long time ago");
    final Finder muscleGroup = find.text('ABS');
    final Finder description = find.text('12 minutes of abs workout');

    expect(trackName, findsOneWidget);
    expect(muscleGroup, findsOneWidget);
    expect(description, findsOneWidget);
  });
}
