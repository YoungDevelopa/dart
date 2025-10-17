import 'package:flutter/material.dart';

void main() => runApp(SendMoneyApp());

class SendMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money',
      home: SendMoneyPage(),
    );
  }
}

class SendButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SendButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        backgroundColor: Colors.blueAccent,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      child: Text(label),
    );
  }
}



class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String recipient = '';
  double amount = 0.0;
  String paymentMethod = 'Bank Transfer';
  bool isFavorite = false;
  bool showSuccess = false;

  final List<String> paymentOptions = ['Bank Transfer', 'Mobile Money', 'PayPal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Recipient Name
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Name cannot be empty' : null,
                onSaved: (value) => recipient = value!,
              ),
              SizedBox(height: 10),

              // Amount
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final num = double.tryParse(value ?? '');
                  return (num == null || num <= 0) ? 'Enter a valid amount' : null;
                },
                onSaved: (value) => amount = double.parse(value!),
              ),
              SizedBox(height: 10),

              // Payment Method
              DropdownButtonFormField<String>(
                initialValue: paymentMethod,
                items: paymentOptions
                    .map((method) => DropdownMenuItem(value: method, child: Text(method)))
                    .toList(),
                onChanged: (value) => setState(() => paymentMethod = value!),
                decoration: InputDecoration(labelText: 'Payment Method'),
              ),
              SizedBox(height: 10),

              // Favorite Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mark as Favorite'),
                  Switch(
                    value: isFavorite,
                    onChanged: (value) => setState(() => isFavorite = value),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Custom Send Button
              SendButton(
                label: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() => showSuccess = true);
                  }
                },
              ),
              SizedBox(height: 20),

              // Animated Success Message
              AnimatedOpacity(
                opacity: showSuccess ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Transaction Successful!',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
