import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:miked_care/features/appointment/models/payment.dart';
import 'package:miked_care/providers/appointment_provider.dart';
import 'package:provider/provider.dart';

import '../models/appointment.dart';
import '../widgets/dashboard_button.dart';

class MakePaymentPage extends StatefulWidget {
  const MakePaymentPage({Key? key}) : super(key: key);

  @override
  State<MakePaymentPage> createState() => _MakePaymentPageState();
}

class _MakePaymentPageState extends State<MakePaymentPage> {
  late int selectedRadioTile;
  late int selectedRadio;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  Payment payment = Payment();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
    selectedRadioTile = 1;

  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
 // appointmentProvider.getAppointmentId
  void moveAppointment(appointmentProvider){
     // appointmentProvider.getAppointmentId.toString();
     payment.appointmentId =  appointmentProvider.getAppointmentId.toString();
     payment.time = TimeOfDay.now().toString();
     payment.date = DateTime.now().toString();
     payment.amount = "\$10.00";
     appointmentProvider.makePayment(payment);
    Navigator.pushNamed(context, 'home');
  }

  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(

                  child: IconButton(onPressed:(){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: Image.asset("assets/logo_black.png",
                        height: 200, width: 300),

                    //Image.asset("assets/img.png")
                  ),
                ),

                Align(
                    alignment: Alignment.center,
                    child: Text("Make Payment",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold)),
                  ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Enter your card details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedRadioTile,
                  contentPadding: EdgeInsets.all(0),
                  title: Text("Credit Card",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 20)),
                  dense: true,

                  // subtitle: Text("Radio 1 Subtitle"),
                  onChanged: (val) {
                    print("Radio Tile pressed $val");
                    setSelectedRadioTile(val!);
                  },
                  activeColor: Colors.cyanAccent,
                  // secondary: OutlineButton(
                  //   child: Text("Say Hi"),
                  //   onPressed: () {
                  //     print("Say Hello");
                  //   },
                  // ),
                  selected: true,
                ),
                CreditCardForm(
                  formKey: formKey,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  themeColor: Colors.cyanAccent,
                  textColor: Colors.black,
                  cardNumberDecoration: InputDecoration(

                    labelText: 'Card Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(width: 3, color: Colors.greenAccent),
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  expiryDateDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(width: 3, color: Colors.cyanAccent),
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'Expired Date',
                    hintText: 'MM/YY',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(width: 3, color: Colors.greenAccent),
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(width: 3, color: Colors.greenAccent),
                    ),
                    focusedBorder: border,
                    enabledBorder: border,
                    labelText: 'Card Holder',
                  ),
                  onCreditCardModelChange: onCreditCardModelChange,
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                      height: 55,
                      child:
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(
                                55), // fromHeight use double.infinity as width and 40 is the height
                          ),
                          onPressed: () {
                            moveAppointment(appointmentProvider);
                          },
                          child:  Text(
                            'Start Therapy',
                            style: TextStyle(color: Colors.white,fontSize: 24),
                          ))),
                      // LargeButton(title: "Start Therapy",callback: moveAppointment)),
                ),
                SizedBox(height: 20,),
                Align(
                    alignment:Alignment.center,
                    child: Text("Apply For Financial Aid"))
              ],
            ),
          ),
        ),
      ),
    );

  }
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
