import 'package:get/get.dart';
import 'package:pr_store/features/shop/screens/product_review/product_reviews.dart';
import 'package:pr_store/routes/routes.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forgot_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: PrRoutes.home, page: () => const HomeScreen()),
    GetPage(name: PrRoutes.store, page: () => const StoreScreen()),
    GetPage(name: PrRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: PrRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: PrRoutes.productReviews, page: () => const PrProductReviews()),
    GetPage(name: PrRoutes.order, page: () => const OrderScreen()),
    GetPage(name: PrRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: PrRoutes.cart, page: () => const CartScreen()),
    GetPage(name: PrRoutes.userProfile, page: () => const PrProfileScreen()),
    GetPage(name: PrRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: PrRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: PrRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: PrRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: PrRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: PrRoutes.onBoarding, page: () => const OnboardingScreen()),
    // Add more GetPage entries as needed
  ];
}
