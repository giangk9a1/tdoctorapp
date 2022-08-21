import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverhotel/arc/presentation/screens/chat/widgets/item_message.dart';
import 'package:riverhotel/arc/presentation/widgets/commons/common.dart';
import 'package:riverhotel/src/constants.dart';
import 'package:riverhotel/static_variable.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../../../main_prod.dart';
import '../../../../src/base_widget_state/base_cubit_stateful_widget.dart';
import '../../../../src/styles/style.dart';
import '../../../../src/utilities/utilities.dart';
import '../../../data/models/models.dart';
import '../../blocs/blocs.dart';
import '../../models/models.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class StreamSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream

class ChatDetailScreen extends BaseCubitStatefulWidget {
  final String roomID;
  final String title;
  const ChatDetailScreen({
    Key? key,
    required this.roomID,
    required this.title,
  }) : super(key: key);
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState
    extends BaseCubitStateFulWidgetState<ChatBloc, ChatDetailScreen> {
  final _messageController = TextEditingController();
  final _messageFocusNode = FocusNode();
  StreamSocket streamSocket = StreamSocket();
  bool _isComposing = false;

  @override
  void dispose() {
    super.dispose();
    streamSocket.dispose();
    socket.disconnect();
  }

  late IO.Socket socket;
  void connectAndListen() {
    try {
      socket = IO.io('wss://socketio.sanwp.com',
          OptionBuilder().setTransports(['websocket']).build());
      // Connect to websocket
      socket.connect();

      // Handle socket events
      socket.on('connect', (_) {
        LoggerUtils.d('connect: ${socket.id}');
        LoggerUtils.d(widget.roomID);
        socket.emit('join_to_group_app', 'room_${StaticVariable.user?.userId}');
        // socket.emit('join_to_group', widget.roomID);
      });

      //When an event recieved from server, data is added to the stream
      socket.on('join_to_group_app', (data) {
        final res = data;
        LoggerUtils.d(res);
        LoggerUtils.d('join_to_group_app');
      });
      socket.on('join_to_group', (data) {
        final res = data;
        LoggerUtils.d(res);
        LoggerUtils.d('join_to_group');
      });
      socket.on('send_to_groups', (data) {
        final res = data;
        LoggerUtils.d(res);
        LoggerUtils.d('send_to_groups');
        bloc.loadMessage(widget.roomID);
      });
      socket.on('send_to_groups_app', (data) {
        final res = data;
        LoggerUtils.d(res);
        LoggerUtils.d('send_to_groups_app');
      });
      socket.onDisconnect((_) => LoggerUtils.d('disconnect'));
    } catch (e) {
      LoggerUtils.d(e.toString());
    }
  }

  Future _sendMessage() async {
    final message = _messageController.text.trim();
    final chatTo =
        widget.roomID.replaceAll('_${StaticVariable.user?.userId}', '');
    setState(() {
      _messageController.clear();
      _isComposing = false;
    });
    bloc.sendMessage(SendMessageRequest(
      chatTo: chatTo,
      clientName: 'room_${StaticVariable.user?.fullname}',
      createRoom: widget.roomID,
      currentID: 'room_${StaticVariable.user?.userId}',
      message: message,
      myName: StaticVariable.user?.fullname,
    ));
  }

  Future _sendImage() async {
    final message = _messageController.text.trim();
    final chatTo =
        widget.roomID.replaceAll('_${StaticVariable.user?.userId}', '');
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _messageController.clear();
      _isComposing = false;
    });
    if (image != null) {
      bloc.sendImage(
        SendMessageRequest(
          chatTo: chatTo,
          clientName: 'room_${StaticVariable.user?.fullname}',
          createRoom: widget.roomID,
          currentID: 'room_${StaticVariable.user?.userId}',
          message: message,
          myName: StaticVariable.user?.fullname,
        ),
        image,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    bloc.loadMessage(widget.roomID);
    connectAndListen();
  }

  @override
  Widget buildContent(BuildContext context, state) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final model = state.model as ChatScreenModel;
    return Scaffold(
      appBar: CustomAppBar.withLeading(
        title: widget.title,
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: model.listMessage?.length ?? 0,
              reverse: true,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: Dimens.size10),
              itemBuilder: (context, index) => ItemMessage(
                messageModel: model.listMessage![index],
              ),
            ),
          ),
          const Divider(),
          _buildComposer(),
          const BottomSpace(),
          // Container(
          //   child: StreamBuilder(
          //     stream: streamSocket.getResponse,
          //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //       return Container(
          //         child: Text(snapshot.data.toString()),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildComposer() {
    return Container(
      height: Dimens.size64,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size10),
      child: Row(
        children: [
          IconButton(
            onPressed: _sendImage,
            icon: SvgPicture.asset(ImageAssetPath.icGallery),
          ),
          const SizedBox(width: Dimens.size10),
          Expanded(
            child: Container(
              height: Dimens.size40,
              padding: const EdgeInsets.only(left: Dimens.size16),
              decoration: BoxDecoration(
                color: MyColors.blue,
                borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Color(0xff808DB0)),
                decoration: InputDecoration.collapsed(
                  hintText: 'Your message here...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Color(0xff808DB0)),
                ),
                onChanged: (value) {
                  setState(() {
                    _isComposing = value.isNotEmpty;
                  });
                },
                onSubmitted: (String value) {
                  _sendMessage();
                },
              ),
            ),
          ),
          const SizedBox(width: Dimens.size10),
          IconButton(
            onPressed: _isComposing ? _sendMessage : null,
            icon: _isComposing
                ? SvgPicture.asset(ImageAssetPath.icSend)
                : SvgPicture.asset(ImageAssetPath.icSend, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
