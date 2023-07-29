// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:uzaonline/src/business_layer/util/helper/log_helper.dart';
//
// class ChatListScreen extends StatefulWidget {
//   const ChatListScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatListScreen> createState() => _ChatListScreenState();
// }
//
// class _ChatListScreenState extends State<ChatListScreen> {
//
//   @override
//   void initState() {
//     _getList();
//     super.initState();
//   }
//
//   void _getList()async{
//     final QuerySnapshot result = await FirebaseFirestore.instance.collection('users').where('id', isNotEqualTo: "2").get();
//     final List <DocumentSnapshot > documents = result.docs;
//     if (documents.isEmpty) {
//         LogHelper.logData("documents =>$documents");
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
