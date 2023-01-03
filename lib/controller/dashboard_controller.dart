import 'package:get/get.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/models/data_model.dart';

class DashboardController extends BaseController{
  var homePageData = <HomePageModel> [].obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    setDummyHomeData();
  }

  setDummyHomeData(){
    HomePageModel model = HomePageModel(
      id: 1,
      name: "Sita",
      image: "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg",
      designation: "Doctor",
      age: 24,
      isLiked: false
    );
    HomePageModel model2 = HomePageModel(
        id: 2,
        name: "Ram",
        image: "https://modelsonly.in/wp-content/uploads/2018/02/3-480x580_t.jpg",
        designation: "Engineer",
        age: 28,
        isLiked: false
    );
    HomePageModel model3 = HomePageModel(
        id: 3,
        name: "Balaji",
        image: "https://modelsonly.in/wp-content/uploads/2018/12/1-3-480x580_t.jpeg",
        designation: "Doctor",
        age: 27,
        isLiked: false
    );
    HomePageModel model4 = HomePageModel(
        id: 4,
        name: "Priya",
        image: "https://i.pinimg.com/originals/da/3d/ea/da3dea35da177b381059555bff6a7ad8.jpg",
        designation: "Software Engineer",
        age: 24,
        isLiked: false
    );
    HomePageModel model5 = HomePageModel(
        id: 5,
        name: "Siddharth",
        image: "https://www.dazzlerr.com/API/assets/images/20029/profile/F038F442-86C1-8980-64E8-F1A20FA04371.jpg",
        designation: "Architect",
        age: 26,
        isLiked: false
    );
    homePageData.value.add(model);
    homePageData.value.add(model2);
    homePageData.value.add(model3);
    homePageData.value.add(model4);
    homePageData.value.add(model5);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isLoading.value = false;
    });

    homePageData.refresh();
  }
}