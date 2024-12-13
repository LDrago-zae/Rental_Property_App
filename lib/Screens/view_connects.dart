import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rent_app/Screens/consts.dart';
import 'package:rent_app/services/stripe_service.dart';

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}

class ViewConnects extends StatefulWidget {
  const ViewConnects({super.key});

  @override
  _ViewConnectsState createState() => _ViewConnectsState();
}

class _ViewConnectsState extends State<ViewConnects> {
  String? _selectedValue = '50 for \$2.00';
  String? _selectedPaymentMethod =
      "Google Pay"; // Default selected payment method
  final TextEditingController _promoCodeController = TextEditingController();

  // Function to show the payment method popup
  void _showPaymentMethodPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle Bar
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Payment Method',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Payment Method Options
              ...[
                {"label": "Google Pay", "icon": Icons.g_mobiledata},
                {"label": "PayPal", "icon": Icons.payment},
                {"label": "Apple Pay", "icon": Icons.apple},
                {"label": "MasterCard", "icon": Icons.credit_card},
                {"label": "Stripe", "icon": Icons.payment},
                {"label": "Visa", "icon": Icons.credit_card},
              ].map(
                (method) => RadioListTile<String>(
                  value: method["label"] as String,
                  groupValue: _selectedPaymentMethod,
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 20,
                        child: Icon(
                          method["icon"] as IconData,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        method["label"] as String,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Order Button
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context); // Close the popup
                  try {
                    // Extract the amount from the dropdown (e.g., "50 for $2.00" -> "2.00")
                    double amountInUsd =
                        double.parse(_selectedValue!.split('\$').last);
                    int amountInCents = (amountInUsd * 100)
                        .toInt(); // Convert USD to cents for Stripe

                    // Call StripeService to process the payment
                    await StripeService.instance
                        .makePayment(amount: amountInCents, currency: "usd");

                    // Show the Stripe Payment Sheet
                    await Stripe.instance.presentPaymentSheet();

                    // Show success dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Payment Successful"),
                        content: const Text("Thank you for your purchase!"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  } catch (e) {
                    // Show error dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Payment Failed"),
                        content: Text("An error occurred: $e"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6DBF47),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Confirm Order',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff015c4e),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 229, 243, 230),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'View Connects',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your available Connects,',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 70, top: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: Text(
                      '35',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Select the amount to buy',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedValue,
                  items: <String>[
                    '50 for \$2.00',
                    '100 for \$4.00',
                    '200 for \$8.00',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your new Connects balance will be 85',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Promo code',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  controller: _promoCodeController,
                  decoration: InputDecoration(
                    hintText: 'Enter code',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _promoCodeController.clear();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showPaymentMethodPopup(context); // Show the popup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6DBF47),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Buy Connects',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff015c4e),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
