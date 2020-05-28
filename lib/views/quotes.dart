import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quotes_app/models/quote.dart';
import 'package:quotes_app/services/quoteService.dart';
import 'package:quotes_app/utils/generateGradient.dart';
import 'package:quotes_app/widgets/coloredContainers.dart';
import '../styleguides/text_style.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {

  LinearGradient _linearGradient;
  Future<List<Quote>> _futureQuotes;

  @override
  void initState() {
    super.initState();
    _futureQuotes = QuoteService.readJson();
    _linearGradient = GenerateGradient().generate();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: FutureBuilder(
          future: _futureQuotes,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Stack(
                  children: <Widget>[
                    ColoredContainers(grad: _linearGradient,),
                    PageView.builder(
                      //physics: BouncingScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _linearGradient = GenerateGradient().generate();
                        });
                      },
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int index) {
                        return Stack(
                          children: <Widget>[
                            Positioned(
                                left: size.width * 0.2,
                                top: size.height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 20.0,),
                                    Image.asset(
                                      'assets/iconquote.png',
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                    Container(
                                      width: size.width *0.8,
                                      height: size.height * 0.6,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(child: Text(snapshot.data[index].quoteText, style: textStyleQuote,)),
                                          //SizedBox(height: size.height * .4,),
                                          Text(snapshot.data[index].quoteAuthor, style: textStyleAuthor,)
                                        ],
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        );
                      }
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
