import 'package:floral_fiesta/Pages/order_confirmation.dart';
import 'package:floral_fiesta/Pages/payment_page.dart';
import 'package:floral_fiesta/Pages/step_indicator.dart';
import 'package:floral_fiesta/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderSummaryPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const OrderSummaryPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
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
              SizedBox(height: 25,),
              Text("APPLY PROMO CODE",
              style: TextStyle(fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              TextField(
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
              SizedBox(height: 15,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(15),
                ),
               
                child:Row(
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
              SizedBox(height: 25,),
              Text(
                'Order Details',
                style: TextStyle(
                  color: Color.fromARGB(255, 4, 100, 7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                  color: Color.fromARGB(255, 222, 232, 226),
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
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),),
                      subtitle: Row(
                        children: [
                          Text('Quantity: ',
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
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),),
                    );
                  },
                ),
              ),
              Divider(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                ),       
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount:',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\₹$totalAmount',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
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
                          fontWeight: FontWeight.bold,
                          color: Colors.white
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

  void _navigateToOrderSuccessPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
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
