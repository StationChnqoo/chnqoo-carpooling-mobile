import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStores extends GetxController {
  /** 页面刷新 */
  /** 结构简单，直接修改value */
  var homePage = 0.obs;
  var myPage = 0.obs;

  /** 变量缓存 */
  /** 结构复杂，必须通过暴露出来的Set/Get接口修改 */
  final storage = GetStorage();

  /** 系统变量 */
  /** 无需缓存，原则上是只能在Stores内部进行修改 */
  var isSignIn = false.obs;

  GetStores() {
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // everAll([homePage, user, bingWallPaper, isSignIn], (callback) {});
  }
}