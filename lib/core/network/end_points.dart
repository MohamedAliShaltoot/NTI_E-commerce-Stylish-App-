abstract class EndPoints {
  static const String baseUrl =
      'https://ntitodo-production-e01d.up.railway.app/api/';

  //user
  static const String register = 'register';
  static const String login = 'login';
  static const String getUserData = 'get_user_data';
  static const String updateUserProfile = 'update_profile';
  static const String getUser = 'delete_user';
  static const String refreshToken = 'refresh_token';

  //sliders

  static const String newSlider = 'new_slider';
  static const String editSlider = 'slider/';
  static const String deleteSlider = 'slider/';
  static const String getSliders = 'sliders';

  //categories
  static const String newCategory = 'new_category';
  static const String editCategory = 'category/';
  static const String deleteCategory = 'category/';
  static const String getCategories = 'categories';

  //orders
  static const String placeOrder = 'place_order';
  static const String cancelOrder = 'orders/cancel/';
  static const String completeOrder = 'orders/complete/';
  static const String getOrders = 'orders';

  //products
  static const String newProduct = 'new_product';
  static const String addToFavorite = 'add_to_favorite';
  static const String editProduct = 'product/';
  static const String deleteProduct = 'product/';
  static const String getProducts = 'products';
  static const String getProductByCategory = 'products/search?q=p';
  static const String bestSellerProduct = 'best_seller_products';
  static const String topRatedProduct = 'top_rated_products';
}





  //https://ntitodo-production-2096.up.railway.app/api/

  //my api base url
  //https://ntitodo-production-e01d.up.railway.app/api/

 //alla old base url : https://ntitodo-production-2096.up.railway.app/api/