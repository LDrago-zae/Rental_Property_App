import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rent_app/Screens/consts.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment() async {
    try {
      // Create payment intent and get client secret
      String? result = await _createPaymentIntent(10, 'usd');
      // You would normally use the client secret here for further confirmation
      if (result != null) {
        print('Payment Intent Created: $result');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();

      // Prepare the data for creating payment intent
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount), // Use the calculated amount here
        "currency": currency,
      };

      // Await the dio POST request to ensure response is fully received
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":
                "Bearer $stripeSecretKey", // Replace with actual secret key
            "Content-Type": "application/x-www-form-urlencoded",
          },
        ),
      );

      // Check if response has the required data
      if (response.data != null) {
        print('Response Data: ${response.data}');
        // Return the client secret from the response
        return response.data['client_secret'];
      }

      // If no valid response, return null
      return null;
    } catch (e) {
      print('Error creating payment intent: $e');
      return null;
    }
  }

  // Helper method to calculate amount in cents (Stripe uses cents, not dollars)
  String _calculateAmount(int amount) {
    return (amount * 100).toString(); // Convert dollars to cents
  }
}
