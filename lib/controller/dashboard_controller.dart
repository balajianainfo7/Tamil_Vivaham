import 'package:get/get.dart';
import 'package:thirumanam/controller/base_controller.dart';
import 'package:thirumanam/models/data_model.dart';

class DashboardController extends BaseController{
  var homePageData = <HomeProfileModel> [].obs;
  var itemList = <HomePageDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;
    setDummyHomeData();
  }

  setDummyHomeData(){
    HomeProfileModel model = HomeProfileModel(
      id: 1,
      name: "Sita",
      image: "https://w0.peakpx.com/wallpaper/332/718/HD-wallpaper-amrita-iyer-tamil-actress-model.jpg",
      designation: "Doctor",
      age: 24,
      isLiked: false
    );
    HomeProfileModel model2 = HomeProfileModel(
        id: 2,
        name: "Ram",
        image: "https://www.dazzlerr.com/API/assets/images/20029/profile/F038F442-86C1-8980-64E8-F1A20FA04371.jpg",
        designation: "Engineer",
        age: 28,
        isLiked: true
    );
    HomeProfileModel model3 = HomeProfileModel(
        id: 3,
        name: "Balaji",
        image: "https://modelsonly.in/wp-content/uploads/2018/12/1-3-480x580_t.jpeg",
        designation: "Doctor",
        age: 27,
        isLiked: false
    );
    HomeProfileModel model4 = HomeProfileModel(
        id: 4,
        name: "Priya",
        image: "https://i.pinimg.com/originals/da/3d/ea/da3dea35da177b381059555bff6a7ad8.jpg",
        designation: "Software Engineer",
        age: 24,
        isLiked: true
    );
    HomeProfileModel model5 = HomeProfileModel(
        id: 5,
        name: "Siddharth",
        image: "https://modelsonly.in/wp-content/uploads/2018/02/3-480x580_t.jpg",
        designation: "Architect",
        age: 26,
        isLiked: false
    );
    homePageData.value.add(model);
    homePageData.value.add(model2);
    homePageData.value.add(model3);
    homePageData.value.add(model4);
    homePageData.value.add(model5);

    HomePageDataModel dataModel1 = HomePageDataModel(
      title: "Near by you",
      itemList: homePageData.value
    );
    HomePageDataModel dataModel2 = HomePageDataModel(
        title: "Recently Viewed",
        itemList: homePageData.value
    );
    HomePageDataModel dataModel3 = HomePageDataModel(
        title: "Featured members",
        itemList: homePageData.value
    );
    HomePageDataModel dataModel4 = HomePageDataModel(
        title: "Recommanded members",
        itemList: homePageData.value
    );
    itemList.value.add(dataModel1);
    itemList.value.add(dataModel2);
    itemList.value.add(dataModel3);
    itemList.value.add(dataModel4);

    Future.delayed(const Duration(seconds: 3)).then((value) {
      isLoading.value = false;
    });

  }
}