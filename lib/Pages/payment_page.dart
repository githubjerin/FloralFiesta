import 'package:floral_fiesta/Pages/order_confirmation.dart';
import 'package:floral_fiesta/Pages/ordersummary_page.dart';
import 'package:floral_fiesta/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int currentStep = 3; 
  String? _selectedPaymentMethod;
  bool _isGiftCardChecked = false;

  void _navigateToOrderSuccessPage() {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderConfirmation()));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderConfirmation()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a payment method"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              StepIndicator(currentStep: currentStep),
              SizedBox(height: 25,),
              Container(
                height: 85,
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 222, 232, 226)
                ),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(8.0)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.local_offer,
                          color: Colors.orange,),
                          SizedBox(width: 8), 
                          Expanded(
                            child: Text(
                            "Set up Fiesta Pay UPI and Get rewards up to ₹250",
                            style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                          ),
                         ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 4, 100, 7),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: GestureDetector(
                  onTap: _navigateToOrderSuccessPage,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(child: Text("Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
             SizedBox(height: 20,),
             Align(
              alignment: Alignment.centerLeft,
               child: Text('RECOMMENDED',
               style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 66, 66, 66),
               ),),
             ),
             SizedBox(height: 20,),
             Column(
              children: [
                PaymentOptionContainer(
                title: 'Credit or Debit Card',
                value: 'credit_or_debit_card',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              SizedBox(height: 10),
              PaymentOptionContainer(
                title: 'EMI',
                value: 'emi',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              SizedBox(height: 10),
              PaymentOptionContainer(
                title: 'Net Banking',
                value: 'net_banking',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              SizedBox(height: 10),
              PaymentOptionContainer(
                title: 'Cash on Delivery',
                value: 'Cash on Delivery',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              ],
             ),
            //  SizedBox(height: 20,),
            AddGiftCardCheckbox(
                isChecked: _isGiftCardChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isGiftCardChecked = value ?? false;
                  });
                },
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 4, 100, 7),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: 
                GestureDetector(
                  onTap: _navigateToOrderSuccessPage,
                  child: Row(
                    
                    children: [
                      Expanded(
                        
                        child: Center(child: Text("Continue",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            ],
            
            
          ),
          
          ),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({Key? key, required this.currentStep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStep(context, '1', 'Address', isActive: currentStep >= 1),
        _buildStep(context, '2', 'Order Summary', isActive: currentStep >= 2),
        _buildStep(context, '3', 'Payment', isActive: currentStep >= 3),
      ],
    );
  }

  Widget _buildStep(BuildContext context, String stepNumber, String stepTitle, {bool isActive = false}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: isActive ? const Color.fromARGB(255, 4, 100, 7) : Colors.grey,
          child: Text(
            stepNumber,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 5),
        Text(
          stepTitle,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class PaymentOptionContainer extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const PaymentOptionContainer({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 222, 232, 226),
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile<String>(
        title: Text(title),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Color.fromARGB(255, 4, 100, 7), 
      ),
    );
  }
}

class AddGiftCardCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const AddGiftCardCheckbox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 222, 232, 226),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        title: Text(
          "Add a gift card",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13,
            color: Color.fromARGB(255, 4, 100, 7),
          ),
        ),
        value: isChecked,
        onChanged: onChanged,
        activeColor: Color.fromARGB(255, 4, 100, 7), 
        controlAffinity: ListTileControlAffinity.leading, 
      ),
    );
  }
}

