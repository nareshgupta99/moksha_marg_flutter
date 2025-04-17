import 'package:get/get.dart';
import 'package:moksha_marg/app/cart/order_cart_dataservice.dart';
import 'package:moksha_marg/app/cart/order_cart_repository.dart';
import 'package:moksha_marg/network/request/network_request_body.dart';
import 'package:moksha_marg/network/response/order_food_data.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCartController extends GetxController implements GetxService {
  final OrderCartRepository repository;
  final SharedPreferences sharedPreferences;
  OrderCartController(
      {required this.sharedPreferences, required this.repository});

  bool loading = true;

  OrderFoodData? foodOrderData;
  final Razorpay _razorpay = Razorpay();

  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void onClose() {
    _razorpay.clear(); // very important to prevent memory leaks
    super.onClose();
  }

  void createOrderForFood({required double amount}) {
    createFoodOrder(amount: amount);
  }

  void paymentVerificationForFood() {}

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    PaymentVerificationPayload payload = PaymentVerificationPayload();
    payload.paymentId = response.paymentId!;
    payload.razorpayOrderId = response.orderId!;
    payload.signature = response.signature!;
    // paymentVerificationForFood(payload:payload);
  }

  void _handlePaymentError(PaymentFailureResponse response) {}

  void initiatePayment() {
    print("payment inititiated");
    _razorpay.open({
      'key': 'rzp_test_D0chz2zvngmBQp',
      'amount': (foodOrderData?.amount?.toInt()) ?? 0 * 100, // in paise
      'currency': 'INR',
      'name': 'Moksha Marg',
      'order_id': foodOrderData?.razorpayOrderId,
      "email": foodOrderData?.userEmail
    });
  }
}
