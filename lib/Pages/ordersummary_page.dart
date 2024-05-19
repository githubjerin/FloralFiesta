import 'package:floral_fiesta/Pages/payment_page.dart';
import 'package:floral_fiesta/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class OrderSummaryPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const OrderSummaryPage({super.key, required this.cartItems});

  @override
  State<OrderSummaryPage> createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  int currentStep = 2; 
  
  late List<int> quantities;

  @override
  void initState() {
    super.initState();
    quantities = List.generate(widget.cartItems.length, (index) => widget.cartItems[index].quantity);
  }

  

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    for (int i = 0; i < widget.cartItems.length; i++) {
      totalAmount += widget.cartItems[i].plant.plantPrice * quantities[i];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepIndicator(currentStep: currentStep),
              const SizedBox(height: 25,),
              const Text("APPLY PROMO CODE",
              style: TextStyle(fontWeight: FontWeight.w600),),
              const SizedBox(height: 15,),
              const TextField(
                    decoration: InputDecoration(
                    labelText: 'Enter promo code', 
                    hintText: 'Promo code', 
                    hintStyle: TextStyle(color: Colors.grey), 
                    border: OutlineInputBorder(), 
                    focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green), 
                    ),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 4, 100, 7)),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                     color: kDarkGreenColor,
                     borderRadius: BorderRadius.circular(15),
                ),
               
                child:const Row(
                    children: [
                      Expanded(
                        child: Center(child: Text("APPLY CODE",
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
              const SizedBox(height: 25,),
              const Text(
                'Order Details',
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 100, 7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  color: const Color.fromARGB(255, 222, 232, 226),
                  child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = widget.cartItems[index];
                    return ListTile(
                      leading: Image.asset(
                      cartItem.plant.image, 
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      ),
                      title: Text(cartItem.plant.plantName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),),
                      subtitle: Row(
                        children: [
                          const Text('Quantity: ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 100, 7),
                            
                          ),),
                          DropdownButton<int>(
                            value: quantities[index],
                            onChanged: (value) {
                              setState(() {
                                quantities[index] = value!;
                              });
                            },
                            items: List.generate(
                              10 ,
                              (index) => DropdownMenuItem<int>(
                                value: index + 1,
                                child: Text((index + 1).toString()),
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Text('\₹${cartItem.plant.plantPrice * quantities[index]}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),),
                    );
                  },
                ),
              ),
              const Divider(),
              Container(
                decoration: BoxDecoration(
                    color: kDarkGreenColor,
                    borderRadius: BorderRadius.circular(5)
                ),       
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\₹$totalAmount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: kDarkGreenColor,
                    elevation: 20.0,
                    textStyle: GoogleFonts.poppins(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: kDarkGreenColor,
                    disabledForegroundColor: kGinColor,
                    disabledBackgroundColor: kGinColor,
                    shadowColor: kGinColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10.0),
                      Text(
                        'Confirm',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
                  },
                )
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

  const StepIndicator({super.key, required this.currentStep});

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
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
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
