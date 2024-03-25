// import 'dart:async';
// import 'package:background_fetch/background_fetch.dart';

// class BackgroundService {
//   static void start() {
//     BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
//   }

//   static void backgroundFetchHeadlessTask(HeadlessTask task) async {
//     // Arka planda koşulu kontrol et
//     if (kosuluSagla()) {
//       await showNotification();
//     }

//     BackgroundFetch.finish(task.taskId);
//   }

//   static bool kosuluSagla() {
//     // Koşulu burada kontrol et
//     // Örneğin, saat 8'e kadar bekleyen ve ardından koşulu kontrol eden bir kod burada olabilir
//     return true; // Koşulunuzu gerçek uygulamaya uygun şekilde değiştirin
//   }

//   static Future<void> showNotification() async {
//     // Bildirimi gösterme kodu buraya gelecek
//   }
// }
