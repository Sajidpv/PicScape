var this_year = DateTime.now().year.toString();

class AppStrings {
  static const String appTitle = 'URACCA';
  static String copyright_text = "© $this_year HAASH INDIA EXPORTS PVT LTD";
  static const String login = 'Login';
  static const String loginGreetings = 'Hello there!\nLogin Now.';
  static const String signupGreetings = 'Create An Account.';
  static const String logout = 'Logout';
  static const String verify = 'Verify';

  static const String logoutConfirmation = 'Are you sure you want to logout?';
  static const String signup = 'Create Account';

  static const String featured = 'Featured';

  static const String todaydeal = 'Today\'s Deal';
  static const String wearstory = 'Wear Your Story';
  static const String policy = 'OUR POLICIES';
  static const String resend = 'Resend OTP';
  static const String contact = 'CONTACTS';
  static const String account = 'MY ACCOUNT';
  static const String myOrder = 'My Order';
  static const String profile = 'Profile';
  static const String reviews = 'Reviews';
  static const String reviewsrating = 'Rating & Reviews';
  static const String search = 'Search';
  static const String submit = 'SUBMIT';
  static const String myCart = 'My Cart';
  static const String wishList = 'Wishlist';
  static const String instock = 'In Stock';
  static const String outOfstock = 'Out of Stock';

  static const String newsletter = 'Enter your mail';
  static const String subscrib = 'subscribe';
  static const String filter = 'Filter';
  static const String bestSelling = 'Best Selling';
  static const String price = 'Price';
  static const String size = 'Size';
  static const String pinhint =
      'Please enter PIN code to check delivery availability';
  static const String returnpolicy = 'Easy Return Policy';
  static const String knowmore = 'Know More';
  static const String refund = 'Refund';
  static const String coupencodeTitle = 'Have Coupon Code? Apply here';
  static const String notapplicable = 'Not Applicable';

  static const String checkNow = 'Check Now';
  static const String checkavailability = 'Check Product Availability';

  static const String sizechart = 'Size Chart';
  static const String apply = 'Apply';
  static const String placeorder = 'Place Order';
  static const String buynow = 'buy now';
  static const String addtocart = 'add to cart';

  static const String reset = 'Reset';
  static const String color = 'Color';
  //////////////////ORDER MESSAGES///////////////////
  static const String orderProcessing = 'Order Processing';
  static const String orderPlaced = 'Your order successfully placed';
  static const String orderShiped = 'Shipped';
  static const String orderReady = 'Ready to Pickup';
  static const String orderDelivered = 'Delivered';
  static const String orderCancelled = 'Cancelled';
  static const String orderreturned = 'Returned';
  static const String orderexpected = 'Delivery expected by ';

  ///////////////ERROR messages////////////////////////
  static const String incorrectOtp = 'Invalid Otp';
  static const String netWorkError =
      'We’re unable to show results.\nPlease check your data\nconnection.';
  static const String retry = 'RETRY';
  static const String timeoutError = 'Network Request time out';
  static const String noInternet = 'No Internet Connection';
  static const String serverError =
      'Error occured while communicating with server';
  static const String communicationError = 'Error During Communication';
  static const String invalidRequest = 'Invalid request';
  static const String noContent = 'No Content found';
  static const String unauthorizedRequest = 'Unauthorised request';
  static const String invalidInput = 'Invalid Input';
  static const String unknownerror = 'Unknown error';
  static const String errorMessage = 'Something went wrong. Please try again.';

  static const List<String> footerTitles = [policy, contact, account];
  static const List<String> dynamicItems = [
    'Terms & Conditions',
    'Shipping & Delivery',
    'Return Policy',
    'Support Policy',
    'Privacy Policy',
    'Contact Us'
  ];
  static const List<String> address = [
    'Odio cradle 1',
    'Malayamma, NIT Campus',
    'Phone',
    '+919846012078',
    'Email',
    'support@ayaboo.in'
  ];
  static const List<String> staticLinks = [
    'Login',
    'Order History',
    'My Wishlistone',
    'Track Order',
  ];
}
