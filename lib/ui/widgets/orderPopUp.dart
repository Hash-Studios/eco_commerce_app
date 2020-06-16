// import 'package:flutter/material.dart';

// class OrderPopUp extends StatelessWidget {
//   const OrderPopUp({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Material(
//       color: Colors.black54,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: width * 0.8,
//                 height: height * 0.8,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF45B649), Color(0xFFDCE35B)],
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.clear, color: Colors.white70),
//                               onPressed: () {},
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Order Details',
//                             style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.normal),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
//                           child: TextFormField(
//                             style: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Color(0xFFFFFFFF),
//                             cursorRadius: Radius.circular(8),
//                             cursorWidth: 1.8,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 10),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFF0000), width: 1),
//                               ),
//                               errorText: null,
//                               hintText: "Quantity",
//                               hintStyle: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                               labelText: "Quantity",
//                               labelStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                             ),
//                             keyboardType: TextInputType.number,
//                             validator: (String value) {
//                               if (value.isEmpty) {
//                                 return 'Qty';
//                               }

//                               return null;
//                             },
//                             onSaved: (String value) {
//                               //  _name = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
//                           child: TextFormField(
//                             style: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Color(0xFF000000),
//                             cursorRadius: Radius.circular(8),
//                             cursorWidth: 1.8,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 10),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFF0000), width: 1),
//                               ),
//                               errorText: null,
//                               hintText: "Offerable Price",
//                               hintStyle: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                               labelText: "Offerable Price",
//                               labelStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                             ),
//                             keyboardType: TextInputType.number,
//                             validator: (String value) {
//                               if (value.isEmpty) {
//                                 return 'Price Offered';
//                               }

//                               return null;
//                             },
//                             onSaved: (String value) {
//                               //   _name = value;
//                             },
//                           ),
//                         ),
//                         // ]),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
//                           child: TextFormField(
//                             style: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                             textInputAction: TextInputAction.next,
//                             cursorColor: Color(0xFF000000),
//                             cursorRadius: Radius.circular(8),
//                             cursorWidth: 1.8,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 10),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(500),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFF0000), width: 1),
//                               ),
//                               errorText: null,
//                               hintText: "Expected Delivery Date",
//                               hintStyle: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                               labelText: "Expected Delivery Date",
//                               labelStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                             ),
//                             validator: (String value) {
//                               if (value.isEmpty) {
//                                 return 'Expected Date of Dilevery';
//                               }

//                               return null;
//                             },
//                             onSaved: (String value) {
//                               //  _name = value;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(31, 15.6, 31, 15.6),
//                           child: TextFormField(
//                             minLines: 3,
//                             maxLines: 12,
//                             style: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                             textInputAction: TextInputAction.done,
//                             cursorColor: Color(0xFF000000),
//                             cursorRadius: Radius.circular(8),
//                             cursorWidth: 1.8,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30, vertical: 10),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFFFFFF), width: 1),
//                               ),
//                               focusedErrorBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                                 borderSide: BorderSide(
//                                     color: Color(0xFFFF0000), width: 1),
//                               ),
//                               errorText: null,
//                               hintText: "Any Special Requests",
//                               hintStyle: Theme.of(context)
// .textTheme
// .headline6
// .copyWith(
//   color: Colors.white,
// ),
//                               labelText: "Any Special Requests",
//                               labelStyle: TextStyle(
//                                 color: Color(0xFFFFFFFF),
//                               ),
//                             ),
//                             validator: (String value) {
//                               if (value.isEmpty) {
//                                 return 'Your Message';
//                               }

//                               return null;
//                             },
//                             onSaved: (String value) {
//                               //    _name = value;
//                             },
//                           ),
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Checkbox(
//                                 value: true,
//                                 onChanged: (val) {},
//                                 activeColor: Colors.black26,
//                               ),
//                               Text('I agree with the Terms and Conditions')
//                             ]),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       offset: Offset(0, 3),
//                                       blurRadius: 10,
//                                       color: Color(0xFF004445).withOpacity(0.2))
//                                 ]),
//                             child: FlatButton(
//                               color: Color(0xFF004445),
//                               shape: StadiumBorder(),
//                               onPressed: () {},
//                               child: Text(
//                                 'Submit',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                             ),
//                           ),
//                         )
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
