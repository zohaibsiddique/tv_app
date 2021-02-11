import 'package:flutter/material.dart';
import 'package:tv_app/entities/channel.dart';
import 'package:tv_app/screens/video_player_sc.dart';
import 'package:tv_app/util/const.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:tv_app/util/util.dart';


class HomeSC extends StatefulWidget {
  static String route = '/homeScreen';
  @override
  _HomeSCState createState() => _HomeSCState();
}

class _HomeSCState extends State<HomeSC> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Const.APP_NAME),
      ),
      body: FutureBuilder<List<Channel>>(
        future: fetchChannels(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ChannelList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<Channel> parseChannel(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Channel>((json) => Channel.fromJson(json)).toList();
  }

  Future<List<Channel>> fetchChannels(http.Client client) async {
    var queryParameters = {
      'name': 'CNN',
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    var endpointUrl = 'https://iptv-org.github.io/iptv/channels.json';
    var requestUrl = endpointUrl + '?' + queryString;

    final response = await client.get(requestUrl);
    return parseChannel(response.body);
  }

  @override
  void initState() {
    super.initState();
  }
}

class ChannelList extends StatelessWidget {
  final List<Channel> photos;

  ChannelList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: FadeInImage.assetNetwork(
              placeholder: "assets/images/logo.png",
              image: photos[index].logo??" "
          ),
          onTap: (){Util.navigateWidget(context, VideoPlayerSC(url: photos[index].url,));},
        );
      },
    );
  }
}
