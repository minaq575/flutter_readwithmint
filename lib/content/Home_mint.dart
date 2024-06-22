// ignore_for_file: camel_case_types, unused_field, file_names

import 'package:flutter/material.dart';
import 'package:readwithmint/models/webtoons.api.dart';
import 'package:readwithmint/models/webtoons.dart';
import 'package:readwithmint/widgets/webtoons_card.dart';

class HomeMint extends StatefulWidget {
  const HomeMint({super.key});

  @override
  State<HomeMint> createState() => _HomeMintState();
}

class _HomeMintState extends State<HomeMint> {
  late List<Webtoons> _webtoonss;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    getWebtoons();
  }

  Future<void> getWebtoons() async {
    _webtoonss = await WebtoonsApi.getWebtoon();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _webtoonss.length,
                itemBuilder: (context, index) {
                  return WebtoonsCard(
                    title: _webtoonss[index].title,
                    thumbnailUrl: _webtoonss[index].coverURL,
                  );
                },
              ));
  }
}
