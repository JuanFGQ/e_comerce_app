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
import 'package:e_comerce_app/features/shop/screens/screens/home/widgets/home.dart';
import 'package:e_comerce_app/features/shop/screens/screens/order/orders.dart';
import 'package:e_comerce_app/features/shop/screens/screens/product_reviews/product_reviews.dart';
import 'package:e_comerce_app/features/shop/screens/screens/store/store.dart';
import 'package:e_comerce_app/features/shop/screens/screens/wishlist/wish_list.dart';
import 'package:e_comerce_app/routes/routes.dart';
import 'package:get/get.dart';

//43
class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomePage()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
