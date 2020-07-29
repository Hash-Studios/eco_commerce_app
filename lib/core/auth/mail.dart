import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:eco_commerce_app/core/keys/smtpKey.dart';

sendUserConfirmMail(String email, String name) async {
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add(email)
    ..subject =
        'Welcome to the gang! || Eco-Friendly App' //subject of the email
    ..text =
        'Hello $name,\n\nWe’re happy that another great person just joined our incredible community of innovators and forward thinkers, who came forward to save mother nature.\n\nStart with the basics:\nTo get you started, try out these three simple tasks that will help you understand our platform:\nTask 1: Login in the app\nTask 2: Search for yor favourite products\nTask 3: Order them\n\nBeyond the basics:\nRemember to check out our huge catalog of eco-friendly products.\nYou can bulk order with cash on delivery.\n\nThank you for joining, let’s make great things happen together!\n\nCheers,\nEco-Friendly App'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}

sendOrderConfirmMail(String email, String name) async {
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add(email)
    ..subject = 'Order Confirmed! || Eco-Friendly App' //subject of the email
    ..text =
        'Hello $name,\nThank you for your purchase! Your order will be shipped within 30 days. We will send you an email as soon as your parcel is on its way.\n\nThank you for your purchase,\n\nBest Regards,\nEco-Friendly App'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}

sendForgotPasswordMail(String email, String code) async {
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add(email)
    ..subject = 'Reset Password! || Eco-Friendly App' //subject of the email
    ..text =
        'We received a request to reset your password with this email address $email .\nThe code for resetting the password is:\n\n$code\n\nIf you did not request a password reset, please ignore this email or contact support, if you have questions.\n\nBest Regards,\nEco-Friendly App'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}

sendContactUsMail(String email, String phone, String name, String msg) async {
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add("akshaymaurya3006@gmail.com")
    ..subject =
        '$email wants to Contact! || Eco-Friendly App' //subject of the email
    ..text =
        'Hey,\nI am $name ($email) and I wanted to contact you regarding the message below:\n\n$msg\nHere is my contact number $phone.\n\nStay Awesome,\nEco-Friendly App'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}

sendOrderMail(String email, String phone, String name, String msg, String qty,
    String price, String date, String productname, String orgPrice) async {
  final smtpServer = gmail(username, password);
  final message = Message()
    ..from = Address(username)
    ..recipients.add("akshaymaurya3006@gmail.com")
    ..subject =
        '$email wants to Order! || Eco-Friendly App' //subject of the email
    ..text =
        'Hey,\nI am $name ($email) and I wanted to order $productname ($qty units) for a price of ₹$price which was originally priced for ₹$orgPrice for $qty units. I expect the delivery to be done by $date:\n\n$msg\nHere is my contact number $phone.\n\nStay Awesome,\nEco-Friendly App'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent. \n' + e.toString());
  }
}
