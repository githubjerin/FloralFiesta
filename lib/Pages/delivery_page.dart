import 'package:floral_fiesta/Pages/ordersummary_page.dart';
import 'package:floral_fiesta/data.dart';
import 'package:floral_fiesta/models/address.dart';
import 'package:flutter/material.dart';
import 'package:floral_fiesta/data.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const SizedBox(height: 25,),
            Container(
              
              decoration: BoxDecoration( 
                color: const Color.fromARGB(255, 222, 232, 226),
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: (){
                  _showAddressInputDialog(context);
                },
              
              child: const Row(
                children: [
                  Icon(Icons.add),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("Add a new address"),
                  )
                ],
              ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: AddressList(addresses: addresses)),
            const DeliverHereButton(),
          ],
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

class AddressList extends StatefulWidget {
  final List<Address> addresses;

  const AddressList({super.key, required this.addresses});

  @override
  State<AddressList> createState() => _AddressListState();
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
            color: _selectedIndex == index ? const Color.fromARGB(255, 222, 232, 226) : null,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        addresses[index].receiverName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Edit",
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                      "${addresses[index].address} Ph: ${addresses[index].mobileNumber}"
                  ),
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
  const DeliverHereButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummaryPage(cartItems: cartItems)));
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 4, 100, 7),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: 
        
        const Text(
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
          title: const Text("Add New Address",
          style: TextStyle(
            color: Color.fromARGB(255, 4, 100, 7),
            
          ),),
          backgroundColor: const Color.fromARGB(255, 222, 232, 226),
          content: const SingleChildScrollView(
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
              child: const Text('Cancel',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 100, 7)
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Save',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 100, 7)
              ),),
            ),
          ],
        );
      },
    );
  }
