// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:green_spark_vendor/src/data_layer/models/chat_models/chat_model.dart';
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key, required this.otherUserId, required this.myId}) : super(key: key);
//
//   final String otherUserId, myId;
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//
//   ///these are collection id's
//   final String _outerCollectionName = "my_chat";
//   final String _channelId = "chat";
//
//   ///stream controller to update send button state according to entered text
//   final StreamController<String> _messageStreamController =
//   StreamController.broadcast();
//
//   ///text message field
//   final TextEditingController _messageBoxController = TextEditingController();
//
//   ///reusable method to get outer collection reference
//   CollectionReference<Map<String, dynamic>> _getMostOuterCollection() {
//     return FirebaseFirestore.instance.collection(_outerCollectionName);
//   }
//
//   @override
//   void dispose() {
//     _messageBoxController.dispose();
//     _messageStreamController.close();
//     super.dispose();
//   }
//
//   ///method to set the message in firebase
//   ///most nested document name is date time instance in milliseconds epoch for uniqueness
//   void _setMessage(final String message) {
//     var timeNow = DateTime.now().millisecondsSinceEpoch;
//     _getMostOuterCollection()
//         .doc(_getSortedChannelId(widget.otherUserId, widget.myId))
//         .collection(_channelId)
//         .doc("$timeNow")
//         .set(ChatModel(
//         message: message,
//         hasSeen: false,
//         sentFrom: widget.myId,
//         time: timeNow)
//         .toJson())
//         .whenComplete(() => print("message added to the database"))
//         .catchError((e) => print(e));
//   }
//
//   ///this method returns a same channel id for both sender and receiver.
//   String _getSortedChannelId(String a, String b) {
//     return a.compareTo(b) == -1 ? a + b : b + a;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.otherUserId)),
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 10),
//         child: _getBody(),
//       ),
//     );
//   }
//
//   Widget _getBody() {
//     ///stream builder to update real time messages
//     ///stream listens for any change in the collection and document and rebuilds itself
//     return StreamBuilder<QuerySnapshot>(
//         stream: _getMostOuterCollection()
//             .doc(_getSortedChannelId(widget.otherUserId, widget.myId))
//             .collection(_channelId)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Center(child: Text("Error"));
//           } else if (snapshot.data == null) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           ///model parsing as List in reversed manner so that user see updated message from bottom.
//           List<ChatModel> _chatList = snapshot.data!.docs.reversed
//               .map((e) => ChatModel.fromJson(e.data() as Map<String, dynamic>))
//               .toList(growable: true);
//
//           ///method call to mark message as seen.
//           _markMessagesAsRead(_chatList, snapshot.data!.docs);
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     return _getChatWidget(_chatList, index);
//                   },
//                   reverse: true,
//                   itemCount: _chatList.length,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                             borderRadius:
//                             const BorderRadius.all(Radius.circular(12)),
//                             border: Border.all(color: Colors.grey, width: 0.8)),
//                         constraints: const BoxConstraints(
//                             maxWidth: double.infinity,
//                             minHeight: 30,
//                             maxHeight: 150),
//                         child: TextField(
//                           controller: _messageBoxController,
//                           maxLines: null,
//                           onChanged: (s) {
//                             _messageStreamController.add(s);
//                           },
//                           decoration: const InputDecoration(
//                               border: InputBorder.none,
//                               hintText: "Type a message ..."),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         if (_messageBoxController.text.trim().isNotEmpty) {
//                           _setMessage(_messageBoxController.text.trim());
//                           _messageBoxController.clear();
//                         }
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 2),
//                         padding: const EdgeInsets.only(
//                             left: 10, right: 2, top: 10, bottom: 10),
//                         child: StreamBuilder<Object>(
//                             stream: _messageStreamController.stream,
//                             builder: (context, snapshot) {
//                               return Icon(
//                                 Icons.send,
//                                 size: 24,
//                                 color:
//                                 _messageBoxController.text.trim().isNotEmpty
//                                     ? Colors.blue
//                                     : Colors.grey,
//                               );
//                             }),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           );
//         });
//   }
//
//   ///this widget method decides which view need to be shown on basis of message sender Id.
//   Widget _getChatWidget(List<ChatModel> chatList, int index) {
//     ChatModel chatObj = chatList[index];
//     return chatObj.sentFrom == widget.myId
//         ? _myMessageWidget(chatObj)
//         : _otherUserMessageWidget(chatObj);
//   }
//
//   ///widget to view messages sent my this user
//   Widget _myMessageWidget(ChatModel chatObj) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8, left: 30),
//       alignment: Alignment.centerRight,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Flexible(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.lime.withOpacity(0.5),
//                   borderRadius: const BorderRadius.all(Radius.circular(35))),
//               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     chatObj.message!,
//                     style: const TextStyle(
//                         color: Colors.black87,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(top: 5),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           _getTime(chatObj),
//                           style: const TextStyle(fontSize: 12),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.only(left: 5),
//                           child: Icon(
//                             Icons.check,
//                             color:
//                             chatObj.hasSeen! ? Colors.green : Colors.grey,
//                             size: 15,
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             height: 26,
//             width: 26,
//             margin: const EdgeInsets.only(bottom: 8),
//             decoration: const BoxDecoration(shape: BoxShape.circle),
//             child: const FittedBox(
//                 child: Icon(
//                   Icons.account_circle,
//                   color: Colors.lime,
//                 )),
//           )
//         ],
//       ),
//     );
//   }
//
//   ///widget to see messages sent by other user.
//   Widget _otherUserMessageWidget(ChatModel chatObj) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8, right: 30),
//       alignment: Alignment.centerLeft,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             height: 26,
//             width: 26,
//             margin: const EdgeInsets.only(bottom: 8),
//             decoration: const BoxDecoration(shape: BoxShape.circle),
//             child: FittedBox(
//                 child: Icon(
//                   Icons.account_circle,
//                   color: Colors.deepOrangeAccent.withOpacity(0.7),
//                 )),
//           ),
//           Flexible(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.deepOrangeAccent.withOpacity(0.35),
//                   borderRadius: const BorderRadius.all(Radius.circular(35))),
//               padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     chatObj.message!,
//                     style: const TextStyle(
//                         color: Colors.black87,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Container(
//                       margin: const EdgeInsets.only(top: 5),
//                       child: Text(_getTime(chatObj),
//                           style: const TextStyle(fontSize: 12))),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   ///method to get message sent time
//   String _getTime(ChatModel chatObj) {
//     var dateObj = DateTime.fromMillisecondsSinceEpoch(chatObj.time!);
//     var today = DateTime.now();
//     return today.day == dateObj.day &&
//         today.month == dateObj.month &&
//         today.year == dateObj.year
//         ? "${dateObj.hour} : ${dateObj.minute}"
//         : "${dateObj.day}/${dateObj.month}/${dateObj.year}";
//   }
//
//   ///method to mark message as seen on sender side.
//   void _markMessagesAsRead(
//       List<ChatModel> chatList, List<QueryDocumentSnapshot> docs) {
//     bool hasUnreadMessage = false;
//     chatList.map((e) {
//       if (!hasUnreadMessage && !e.hasSeen!) {
//         hasUnreadMessage = true;
//       }
//     }).toList(growable: true);
//     if (hasUnreadMessage) {
//       ///updating "hasSeen" field in document for all unread messages.
//       List<QueryDocumentSnapshot> filteredDocs = docs.where((element) {
//         return ((element.data() as Map<String, dynamic>)["hasSeen"] == false &&
//             (element.data() as Map<String, dynamic>)["sentFrom"] ==
//                 widget.otherUserId);
//       }).toList(growable: true);
//       for (var element in filteredDocs) {
//         element.reference.update({"hasSeen": true});
//       }
//     }
//   }
// }
