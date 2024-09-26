import 'package:challenge_2/screens/widgets/payment_success.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';

class OrderSummery extends StatefulWidget {
  const OrderSummery({super.key});

  @override
  State<OrderSummery> createState() => _OrderSummeryState();
}

class _OrderSummeryState extends State<OrderSummery> {
  String selectedPaymentMethod = 'credit'; // To track selected payment method
  bool checked = true;
  // Method to update selected payment method
  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Order Summary"),
            const SizedBox(height: 20),
            const PriceDetailRow(label: "Order", value: "\$16.48"),
            const PriceDetailRow(label: "Taxes", value: "\$0.30"),
            const PriceDetailRow(label: "Delivery Fees", value: "\$1.50"),
            const Divider(),
            const PriceDetailRow(
                label: "Total:", value: "\$18.19", isBold: true),
            // const SizedBox(height: 20),
            const PriceDetailRow(
                label: "Estimated delivery time:",
                value: "15 - 30mins",
                isBold: true),

            const SizedBox(height: 20),
            const SectionTitle(title: "Payment Methods"),
            const SizedBox(height: 20),
            // Payment methods with state handling for selection
            PaymentMethodCard(
              image: 'assets/mastercard.png',
              cardType: 'Credit card',
              cardNumber: '5105 **** **** 0505',
              isSelected: selectedPaymentMethod == 'credit',
              onTap: () => selectPaymentMethod('credit'),
            ),
            const SizedBox(height: 20),
            PaymentMethodCard(
              image: 'assets/visa.png',
              cardType: 'Debit card',
              cardNumber: '3566 **** **** 0505',
              isSelected: selectedPaymentMethod == 'debit',
              onTap: () => selectPaymentMethod('debit'),
            ),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Column(
                children: [
                  Checkbox(
                    activeColor: primaryColor,
                    value: checked,
                    onChanged: (value) {
                      setState(() {
                        checked = value!;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: InkWell(
                  child: Text(
                    'Save card details for future payments',
                    style: TextStyle(
                        overflow: TextOverflow.clip,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      bottomSheet: const BottomBar(totalPrice: "\$18.19"),
    );
  }
}

// Reusable PriceDetailRow widget
class PriceDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const PriceDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable PaymentMethodCard widget
class PaymentMethodCard extends StatelessWidget {
  final String image;
  final String cardType;
  final String cardNumber;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.image,
    required this.cardType,
    required this.cardNumber,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 37, 13, 13)
              : const Color.fromARGB(255, 239, 245, 250),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: .5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(image),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardType,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cardNumber,
                      style: TextStyle(
                        color: isSelected
                            ? Colors.grey.shade500
                            : Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.radio_button_checked,
              color: isSelected ? Colors.white : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable BottomBar widget
class BottomBar extends StatelessWidget {
  final String totalPrice;

  const BottomBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total price",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                totalPrice,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showPaymentSuccessDialog(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 37, 13, 13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: .5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Pay Now",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable SectionTitle widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

// Function to show the dialog
void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const PaymentSuccessDialog();
    },
  );
}
