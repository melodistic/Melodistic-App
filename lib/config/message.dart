import 'package:get/route_manager.dart';

class MelodisticMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en_US': <String, String>{
          'Try now': 'Try now',
          'Username': 'Username',
          'Password': 'Password',
          'Log in': 'Log in',
        },
        'th_TH': <String, String>{
          'Try now': 'เริ่มต้นใช้งาน',
          'Username': 'ชื่อผู้ใช้',
          'Password': 'รหัสผ่าน',
          'Log in': 'เข้าสู่ระบบ',
        },
      };
}
