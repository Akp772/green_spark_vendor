class ApiConstant {
  /// Api URLS DEVELOPMENT

  ///dev
  static const urlDevServer = 'https://testingbackend.suhaani.co.in/api/';
  static const baseUrl = 'https://testingbackend.suhaani.co.in/';

  ///testing
  // static const urlDevServer = 'http://119.18.52.238:3003/api/';

  /// production
  // static const urlDevServer = 'http://119.18.52.238:3005/api/';

  static const devApiKey = '';

  /// Api URLS PRODUCTION
  static const urlProdServer = '';
  static const prodApiKey = '';

  /// Api URLS TESTING
  static const urlTestServer = '';
  static const testApiKey = '';

  static const String googleLink = "google.com";
  static const String refreshToken = "user/refreshtoken";
  static const String signIn = "login";
  static const String signUp = "vendor-register";
  static const String sendOTP = "otp/send";
  static const String verifyOtp = 'otp/verify';
  static const String getAccountTypes = 'user/getaccounttypes';
  static const String getDietType = 'user/getdiettypes';
  static const String getSubscriptionPlan = 'user/getsubscriptionplan';
  static const String onBoardingDetail = 'user/onboardingdetail';
  static const String resendOtp = 'user/resendotp';
  static const String socialLogIn = 'user/socialsignin';
  static const String socialSignup = 'user/socialsignup';
  static const String forgotPassword = 'auth/forgot_password';
  static const String changePassword = 'auth/change_password';
  static const String verifyResetPassword = 'user/verifyresetpasswordotp';
  static const String setNewPassword = 'user/setpassword';
  static const String signOut = 'user/signout';
  //home
  static const String getAllCatalogueProducts = 'product_all_data';
  static const String getCustomerCart = 'get-customer-cart';
  static const String getCustomerWishlist = 'get-customer-wishlist';
  static const String getAllAttribute = 'get-attributes';
  static const String addAllAttribute = 'store-attributes';

  /// stocks
  static const String stocksWithoutVariant = 'stocks/without_variant';
  static const String stocksWithVariant = 'stocks/with_variant';

  static  String getSingleProduct(id) => 'listings/$id/get';

  static  String getAllCoupons(id) => 'get-all-vendor-coupon/$id';
  static const String addCoupon = 'add-coupon';
  static  String editCoupon(id) => 'edit-coupon/$id';


  static const String getTrending = 'listings/trending';
  static const String getListings = 'listings/';
  static const String setMasterclassVideoLogURL =
      'course/updatelectureprogress';

  // post detail
  static String getPostComments(
      {required int postID, required int page, required int limit}) {
    return 'home/getcomments/$postID?page=$page&limit=$limit';
  }

  // post detail
  static String getPostDetailApi({required int postId}) {
    return 'post/postdetails/$postId';
  }

  static const String addLikeUnLike = 'post/addlike';
  static const String addComment = 'post/addcomment';

  static const String getUserProfile = 'accounts/profile';

  static String getUserPost({required int userId}) {
    return 'user/usersposts/$userId';
  }

  static String getFollowingList({required int userId}) {
    return 'user/followinglist/$userId';
  }

  // post detail
  static String unfollowAccount({required int followId}) {
    return 'user/unfollowingsaccount/$followId';
  }

  // post detail
  static String getOtherUserProfile({required int userId}) {
    return 'user/otheruserprofile/$userId';
  }

  static String getFollowerList({required int userId}) {
    return 'user/followerslist/$userId';
  }

  static const String addFollower = 'user/addfollowingsaccount';

  static String removeFollower({required int followId}) {
    return 'user/removefollower/$followId';
  }

  static const String createPost = 'post/addpost';

  static String deletePost({required int postId}) {
    return 'post/deletepost/$postId';
  }

  static const String updateProfile = 'user/updateprofile';

  static const String uploadImage = 'user/uploadimage';

  /// setting
  static const String changePhone = 'user/changephonenumber';
  static const String changeFoodPreference = 'user/changefoodpreference';
  static const String changeLanguage = 'user/changelanguage';

  /// master class
  static String getMasterClass({required int pageNo}) {
    return 'course?page=$pageNo&limit=20';
  }

  /// get all recipe
  static String getAllRecipe({required int pageNo}) {
    return 'recipe?page=$pageNo&limit=20';
  }

  static String getTrendingRecipe({required int pageNo}) {
    return 'recipe/trendingrecipes?page=$pageNo&limit=10';
  }

  static String getCategoryType({required int pageNo}) {
    return 'category/type?page=$pageNo&limit=20';
  }

  static String getSubCategory({required String id, required int page}) {
    return 'category/subcategory/$id?page=$page&limit=20';
  }

  static String getSubCategoryRecipe({required String id, required int page}) {
    return 'recipe/category/$id?page=$page&limit=20';
  }

  static String getMasterclassDetail({required String id}) {
    return 'course/$id';
  }

  static String getVideoUrl({required String id}) {
    return 'https://stream.mux.com/$id.m3u8';
  }

  static String getRecipeDetail({required String id}) {
    return 'recipe/recipedetails/$id';
  }

  static String getNewRecipeList({required int pageNo}) {
    return 'recipe/latestrecipes?page=$pageNo&limit=20';
  }

  static const String addTofavourite = 'recipe/addfavourite';

  static String removeFavourite({required String recipeId}) {
    return 'recipe/removefavourite/$recipeId';
  }

  static String getFavouriteRecipeList({required int pageNo}) {
    return 'recipe/favouriterecipes?page=$pageNo&limit=20';
  }

  static String searchApi(
      {required String type, required String searchItem, required int pageNo}) {
    return 'search?type=$type&keys=$searchItem&page=$pageNo&limit=10';
  }

  static String searchWithFilterApi(
      {required String type,
      required String searchItem,
      required int pageNo,
      required List<String> filterList}) {
    String filter = filterList.toString().replaceAll('[', "");
    filter = filter.toString().replaceAll(']', "");
    return 'search?type=$type&keys=$searchItem&filter=${filter.replaceAll(" ", "")}&page=$pageNo&limit=10';
  }

  static String getLatestSearchList(
      {required String type, required int pageNo}) {
    return 'search/latestsearch?type=$type&page=$pageNo&limit=20';
  }

  static String getWeeklyMenuList() {
    return 'weeklyplanner/getweeklymenuslist';
  }

  static String getMenuRecipe({required int id}) {
    return 'weeklyplanner/getmenurecipeslist/$id';
  }

  static String saveMenu() {
    return 'weeklyplanner/savemymenu';
  }

  static String getMyMenu({required int pageNo}) {
    return 'weeklyplanner/getsavedmenuslist?page=$pageNo&limit=20';
  }

  static String getMyMenuList({required int id}) {
    return 'weeklyplanner/getsavedmenusdetails/$id';
  }

  static const String removeRecipe = 'weeklyplanner/removerecipe';
  static const String getSearchFilter = 'search/filterslist';
}

class ApiConstraint {
  static const String google = 'google';
  static const String apple = 'apple';
  static const String facebook = 'fb';
  static const String postId = 'post_id';
  static const String recipe = 'recipe';
  static const String course = 'course';
  static const String people = 'people';
  static const String all = 'all';
}
