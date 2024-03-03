import 'package:e_comerce_app/features/personalization/screen/address/address.dart';
import 'package:e_comerce_app/features/personalization/screen/profile/profile.dart';
import 'package:e_comerce_app/features/personalization/screen/settings/settings.dart';
import 'package:e_comerce_app/features/shop/authentication/forget_password/forget_password.dart';
import 'package:e_comerce_app/features/shop/authentication/login/login.dart';
import 'package:e_comerce_app/features/shop/authentication/screen%20onboarding/onboarding.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/signup.dart';
import 'package:e_comerce_app/features/shop/authentication/signup/verify_email.dart';
import 'package:e_comerce_app/features/shop/screens/screens/cart/cart.dart';
import 'package:e_comerce_app/features/shop/screens/screens/checkout/checkout.dart';
import 'package:e_comerce_app/features/shop/screens/screens/home/home.dart';
import 'package:e_comerce_app/features/shop/screens/screens/order/orders.dart';
import 'package:e_comerce_app/features/shop/screens/screens/product_reviews/product_reviews.dart';
import 'package:e_comerce_app/features/shop/screens/screens/store/store.dart';
import 'package:e_comerce_app/features/shop/screens/screens/wishlist/wish_list.dart';
import 'package:e_comerce_app/routes/routes.dart';
import 'package:get/get.dart';

//43
class AppRoutes {
  static final pages = [
    GetPage(name: JRoutes.home, page: () => const HomePage()),
    GetPage(name: JRoutes.store, page: () => const StoreScreen()),
    GetPage(name: JRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: JRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: JRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: JRoutes.order, page: () => const OrderScreen()),
    GetPage(name: JRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: JRoutes.cart, page: () => const CartScreen()),
    GetPage(name: JRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: JRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: JRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: JRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: JRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: JRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: JRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
