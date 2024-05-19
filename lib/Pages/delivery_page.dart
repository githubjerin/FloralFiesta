import 'package:floral_fiesta/Pages/order_confirmation.dart';
import 'package:floral_fiesta/Pages/ordersummary_page.dart';
import 'package:floral_fiesta/Pages/payment_page.dart';
import 'package:floral_fiesta/data.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  int currentStep = 1; 
  List<String> addresses = [
    'Jerin B S, Door no:5, Gandhi Nagar, Nehru Main Street, Porur, Tamil Nadu',
    'Jeciyazhini J, Kamaraj Nagar, 5/1 Street, Salem, Tamil Nadu',
    'Keerthana J, Door no: 3, Ganapathy Koil Street, Chennai, Tamil Nadu'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Address",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            StepIndicator(currentStep: currentStep),
            SizedBox(height: 25,),
            Container(
              
              decoration: BoxDecoration( 
                color: Color.fromARGB(255, 222, 232, 226),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: (){
                  _showAddressInputDialog(context);
                },
              
              child: Row(
                children: [
                  Icon(Icons.add),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Add a new address"),
                  )
                ],
              ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: AddressList(addresses: addresses)),
            DeliverHereButton(),
          ],
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

class AddressList extends StatefulWidget {
  final List<String> addresses;

  const AddressList({Key? key, required this.addresses}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.addresses.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Card(
            elevation: 3,
            color: _selectedIndex == index ? Color.fromARGB(255, 222, 232, 226) : null, 
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.addresses[index].split(",")[0],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(widget.addresses[index]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



class DeliverHereButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummaryPage(cartItems: cartItems)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 4, 100, 7), 
          padding: EdgeInsets.symmetric(vertical: 16.0), 
        ),
        child: 
        
        Text(
          'Deliver Here',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16),
        ),
      ),
    );
  }
}

void _showAddressInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Address",
          style: TextStyle(
            color: Color.fromARGB(255, 4, 100, 7),
            
          ),),
          backgroundColor: Color.fromARGB(255, 222, 232, 226),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Door No.'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Street Name'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Area'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'State'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Pin Code'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 100, 7)
              ),),
            ),
            TextButton(
              onPressed: () {
                // Implement functionality to save the address details
                Navigator.of(context).pop();
              },
              child: Text('Save',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 100, 7)
              ),),
            ),
          ],
        );
      },
    );
  }
