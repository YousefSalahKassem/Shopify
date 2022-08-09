class AppProperties {
  static String baseApiUrl = 'https://nehe-ecommerce-api.herokuapp.com/api/v1';

  static String productUrl = '$baseApiUrl/products/';

  static String categoryUrl = '$baseApiUrl/categories/';

  static String searchByCategoryOrNameUrl = '$baseApiUrl/products/search/';

  static String searchByCategoryUrl = '$baseApiUrl/products/search/category/';

  static String saveOrderUrl = '$baseApiUrl/cart/flutter/stripepayment';

  static String payPalRequestUrl = '$baseApiUrl/cart/braintree/paypalpayment/';

  static String signUpUrl = '$baseApiUrl/users/signup';

  static String signInUrl = '$baseApiUrl/users/signin';

  static String checkTokenExpiryUrl = '$baseApiUrl/users/checktokenexpiry';

  static String cartUrl = '$baseApiUrl/cart/';

  static String getOrdersUrl = '$baseApiUrl/cart/orders/user/';

  static String changeNameUrl = '$baseApiUrl/users/updatename/';

  static String changeMailUrl = '$baseApiUrl/users/updatemail/';

  static String forgotPasswordUrl = '$baseApiUrl/users/forgotpassword';

  static const viewOrderHistory = 'Viewing order history';
  static const viewSingleNewOrderHistory = 'Viewing single new order history';
  static const viewSingleAllOrderHistory = 'Viewing single all order history';
  static const viewProfile = 'Viewing profile';
  static const changingName = 'Changing name';
  static const changingEmail = 'Changing email';

  static const addToCart = 'ADD';
  static const removeFromCart = 'REMOVE';

  static const signInTitle = 'Welcome\n Back';

  static const signUpTitle = 'Create\nAccount';

  static const forgotPassword = 'Forgot\nPasword';
  static const orderHistoryScreen = 'Order History';
  static const profileTitle = 'Profile';
  static const paymentTitle = 'Order summary & Payment method';
  static const productListTitle = 'Store';
  static const shippingDetailTitle = 'Shipping details';
  static const shoppingCartTitle = 'Shopping cart';
  static const singleOrderTitle = 'Order';
  static const thanksTitle = 'Payment successfull';

  static const shoppingCarId = 'ShoppingCartScreen';
  static const productDetailId = 'ProductDetailsScreen';
  static const productListId = 'ProductListScreen';
  static const shippingId = 'ShippingScreen';
  static const paymentMethodId = 'PaymentMethodScreen';
  static const thankYouId = 'ThaankYouScreen';
  static const singleOrderId = 'SingleOrderScreen';
  static const authScreenId = 'AuthScreen';
  static const orderHistoryScreenId = 'OrderHistoryScreen';
  static const profileScreenid = 'ProfileScreen';

  static const stripepayment = 'Stripe';
  static const payPal = 'Pay pal';

  static const userRegistration = 'Registered user';
  static const userGuest = 'Guest user';

  static const String tableFavouriteProduct='favouriteProduct';
  static const String addressTable='addressTable';

  static const String columnCountry = 'country';
  static const String columnCity = 'city';
  static const String columnStreet = 'street';
  static const String columnPostcode = 'postcode';

  static const String columnName = 'name';

  static const String columnImage='image';

  static const String columnPrice='price';

  static const String columnDescription='description';

  static const String columnId='id';

  static const String tableCartProduct='cartProduct';

  static const String columnQuantity='quantity';

  // static const password = "123-Apple-$$$"
}
