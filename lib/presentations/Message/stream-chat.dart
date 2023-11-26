// import 'package:flutter/material.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// void main() async {
//   final client = StreamChatClient(
//     'rf46vwh4qqs2',
//     logLevel: Level.INFO,
//   );

//   final user = User(
//     id: '6ef9a369-c49a-4cf1-abd1-b898ebbfabd6',
//     extraData: {
//       'name': 'Hoàng Nhã Thy',
//       'image':
//           'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg',
//     },
//   );

//   await client.connectUser(
//       user, client.devToken('6ef9a369-c49a-4cf1-abd1-b898ebbfabd6').toString());
//   print(client.devToken('6ef9a369-c49a-4cf1-abd1-b898ebbfabd6').toString());
//   runApp(MyApp(client, user));
// }

// class MyApp extends StatelessWidget {
//   final StreamChatClient client;
//   final User user;

//   const MyApp(this.client, this.user);

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// class ChannelPage extends StatelessWidget {
//   const ChannelPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const StreamChannelHeader(),
//       body: Column(
//         children: const <Widget>[
//           Expanded(
//             child: StreamMessageListView(),
//           ),
//           StreamMessageInput(),
//         ],
//       ),
//     );
//   }
// }

// class ChannelListPage extends StatefulWidget {
//   const ChannelListPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ChannelListPage> createState() => _ChannelListPageState();
// }

// class _ChannelListPageState extends State<ChannelListPage> {
//   late final _listController = StreamChannelListController(
//     client: StreamChat.of(context).client,
//     filter: Filter.in_(
//       'members',
//       [StreamChat.of(context).currentUser!.id],
//     ),
//     sort: const [SortOption('last_message_at')],
//     limit: 20,
//   );

//   @override
//   void dispose() {
//     _listController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamChannelListView(
//         controller: _listController,
//         onChannelTap: (channel) {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) {
//                 return StreamChannel(
//                   channel: channel,
//                   child: const ChannelPage(),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // ignore: must_be_immutable
// class MessagePage extends StatefulWidget {
//   MessagePage({super.key});

//   @override
//   State<MessagePage> createState() => _MessagePageState();
// }

// class _MessagePageState extends State<MessagePage> {
//   final client = StreamChatClient(
//     'rf46vwh4qqs2',
//     logLevel: Level.INFO,
//   );
//   User? user;
//   Channel? channel;

//   StreamChannelListController? _listController;
// Future<void> getData() async {
//   user = User(
//     id: '6ef9a369-c49a-4cf1-abd1-b898ebbfabd6',
//     extraData: {
//       'name': 'Hoàng Nhã Thy',
//     },
//   );

//   if (user != null) {
//     await client.connectUser(user!,
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c');
//     // client.devToken('6ef9a369-c49a-4cf1-abd1-b898ebbfabd6').toString());

//     setState(() {
//       _listController = StreamChannelListController(
//         client: client,
//         filter: Filter.in_(
//           'members',
//           ['6ef9a369-c49a-4cf1-abd1-b898ebbfabd6'],
//         ),
//         limit: 20,
//       );
//     });
//   }
// }

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         builder: (context, widget) {
//           return StreamChat(
//             client: client,
//             child: widget,
//           );
//         },
//         home: StreamChannelListView(
//           controller: _listController!,
//           onChannelTap: (channel) {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return StreamChannel(
//                     channel: channel,
//                     child: const ChannelPage(),
//                   );
//                 },
//               ),
//             );
//           },
//         ));
//   }
// }

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late final StreamChatClient client = StreamChatClient(
    'rf46vwh4qqs2',
    logLevel: Level.INFO,
  );
  bool isConected = false;

  Future<void> getData() async {
    final user = User(
      id: '6ef9a369-c49a-4cf1-abd1-b898ebbfabd6',
      extraData: const {
        'name': 'Hoàng Nhã Thy',
      },
    );

    await client.connectUser(user,
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidHV0b3JpYWwtZmx1dHRlciJ9.S-MJpoSwDiqyXpUURgO5wVqJ4vKlIVFLSEyrFYCOE1c',);
    // client.devToken('6ef9a369-c49a-4cf1-abd1-b898ebbfabd6').toString());

    setState(() {
      isConected = true;
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (isConected == false) {
      return const SizedBox();
    }

    return MaterialApp(
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
      home: const ChannelListPage(),
    );
  }
}

class ChannelListPage extends StatefulWidget {
  const ChannelListPage({
    super.key,
  });

  @override
  State<ChannelListPage> createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  late final _listController = StreamChannelListController(
    client: StreamChat.of(context).client,
    filter: Filter.in_(
      'members',
      [StreamChat.of(context).currentUser!.id],
    ),
    sort: const [SortOption('last_message_at')],
    limit: 20,
  );

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamChannelListView(
        controller: _listController,
        onChannelTap: (channel) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return StreamChannel(
                  channel: channel,
                  child: const ChannelPage(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  const ChannelPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StreamChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamMessageListView(),
          ),
          StreamMessageInput(),
        ],
      ),
    );
  }
}
