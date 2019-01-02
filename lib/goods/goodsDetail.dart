import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gallery_photo_view_wrapper.dart';

class AppColors {
  static const borderColors = 0xffdddddd;
  static const mainColor = 0xff666666;
  static const mainBgColor = 0xffefefef;
}



class GoodsInfo extends StatefulWidget {
  @override
  GoodsInfoState createState() {
    return GoodsInfoState();
  }
}

class GoodsInfoState extends State<GoodsInfo> {
  var swiperList = [
    "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181129/foyv6tx0lnb1889210529",
    "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181213/p6qxecjact2557426482",
    "https://taoke-prod.oss-cn-hangzhou.aliyuncs.com/task/20181129/zxhz0vmh4391757955463"
  ];
  var sizeList = {'type':0,'lista':["M","L","XL","XXL"]};
  var colorList = {'type':1,'lista': ["黑色","红色","绿色"]} ;
  // var sizeList = ["M","L","XL","XXL"];
  // var colorList = ["黑色","红色","绿色"];
  var selectSizeIndex = null;
  var selectColorIndex = null;

  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Container cricleContainer(Color colors, String str1, String str2) {
    return new Container(
        width: 50.0,
        height: 50.0,
        decoration: new BoxDecoration(
            border: Border.all(color: colors),
            borderRadius: new BorderRadius.all(new Radius.circular(50.0))),
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              str1,
              style: new TextStyle(color: colors),
            ),
            new Text(
              str2,
              style: new TextStyle(color: colors),
            ),
          ],
        ));
  }

  SizedBox topReviewsSizedBox(double width, String text) {
    return new SizedBox(
      width: width,
      child: new OutlineButton(
        child: new Text(
          text,
          style: TextStyle(color: Color(0xff999999)),
        ),
        padding: EdgeInsets.all(0.0),
        borderSide: BorderSide(color: Color(0xff666666)),
        onPressed: () {
          print("xxxxxxx");
        },
      ),
    );
  }

  //喜欢
  bool favoriteStatus = false;
  void favoriteStatusFn() {
    setState(() {
      if (favoriteStatus) {
        favoriteStatus = false;
      } else {
        favoriteStatus = true;
      }
      // favoriteStatus= favoriteStatus?false:true;
    });
  }

  //选择颜色尺码状态
  void selectColorSizeStatusFn(type,index) {
    setState(() {
      if(type==0){
        selectSizeIndex = index;
      }else{
        selectColorIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //轮播图
    Widget swiperItem = Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 3,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          control: new SwiperControl(size: 0.0),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));

    //button
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    //价格
    Widget priceRow = new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "10.19",
              style: new TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
            new Text(
              "EUR",
              style: new TextStyle(color: Colors.red),
            ),
          ],
        ),
        new Padding(
          padding: EdgeInsets.only(left: 15.0),
        ),
        cricleContainer(Colors.red, '71 %', 'off'),
        new Padding(
          padding: EdgeInsets.only(left: 15.0),
        ),
        cricleContainer(Colors.blue, '717', 'sold'),
      ],
    );

    //商品描述
    Widget shopDescription = new Container(
      decoration: new BoxDecoration(
          border: Border(
              // bottom: BorderSide(
              //   width: 1.0,color: Colors.red
              // )
              )),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Oeschinen Lake Campground",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: new Text(
                    "Kandersteg, Switzerland",
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                priceRow,
              ],
            ),
          ),
        ],
      ),
    );

    //free shiping
    Widget freeShiping = new Container(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Color(AppColors.borderColors), width: 1.0),
              bottom: BorderSide(
                  color: Color(AppColors.borderColors), width: 1.0))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Icon(Icons.card_giftcard),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "我是谁岁阿苏斯都都",
                style: TextStyle(color: Colors.red),
              ),
              new Text(
                "我是谁岁阿苏斯都都",
                style: TextStyle(color: Color(AppColors.borderColors)),
              ),
              new Text(
                "我是谁岁阿苏斯都都",
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          new Icon(Icons.arrow_right)
        ],
      ),
    );

    //Select
    Widget shopColorSizeSelcet = new Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color(AppColors.borderColors), width: 1.0))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text('Cplor, Size'),
          new Row(
            children: <Widget>[
              new Text(
                'Select',
                style: TextStyle(color: Colors.blue),
              ),
              new Icon(Icons.arrow_right)
            ],
          )
        ],
      ),
    );

    //总述
    Widget reviewsContainer = new Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Color(AppColors.borderColors), width: 1.0),
              top: BorderSide(
                  color: Color(AppColors.borderColors), width: 1.0))),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Text('REVIEWS'),
              new Text(
                '|65Ratings',
                style: TextStyle(color: Color(0xff666666)),
              ),
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                '3.4 / 5.0',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
              new Row(
                children: <Widget>[
                  new Text(
                    '满意度',
                    style: TextStyle(color: Color(0xff666666)),
                  ),
                  new Text(
                    '3.0',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );

    //Top 评论select
    Widget topReviewsContainer = new Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Color(AppColors.borderColors), width: 1.0),
      )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('Top Reviews',
              style: TextStyle(fontWeight: FontWeight.w700)),
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          new Offstage(
              //控制显示隐藏
              offstage: false,
              child: new Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  topReviewsSizedBox(50.0, "全部"),
                  SizedBox(
                    width: 10.0,
                  ),
                  topReviewsSizedBox(50.0, "好评"),
                  SizedBox(
                    width: 10.0,
                  ),
                  topReviewsSizedBox(50.0, "晒图"),
                ],
              )),
        ],
      ),
    );

    List<Widget> starList = [
      new Text(
        '满意度',
        style: TextStyle(color: Color(0xff999999)),
      )
    ];
    starfun(int length) {
      for (int i = 0; i < length; i++) {
        starList.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
        ));
      }
      for (int i = 0; i < 5 - length; i++) {
        starList.add(Icon(
          Icons.star_border,
          color: Color(0xffbbbbbb),
        ));
      }
      return starList;
    }

    //查看大图的方法
    void openImg(BuildContext context, final int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPhotoViewWrapper(
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black87,
                  ),
                  imageProviders: List.generate(5, (gi) {
                    return CachedNetworkImageProvider(
                        "https://picsum.photos/350/500?image=${gi}");
                  }).toList(),
                  index: index,
                ),
          ));
    }

    //评价图
    List<Widget> widgetImgsFn() {
      return List<Widget>.generate(5, (gi) {
        return new Container(
            margin: EdgeInsets.only(top: 8, left: 8.0),
            child: GestureDetector(
                onTap: () {
                  openImg(context, gi);
                },
                child: new CachedNetworkImage(
                  // 图片层
                  // width: MediaQuery.of(context).size.width,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.fitWidth,
                  placeholder: new CircularProgressIndicator(),
                  imageUrl: 'https://picsum.photos/350/500?image=${gi}',
                  errorWidget: new Icon(Icons.error),
                )));
      }).toList();
    }

    //评价 Widget
    Widget reviewsItem = new Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Color(AppColors.borderColors), width: 1.0),
      )),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3463668003,3398677327&fm=58"),
                  ),
                  new SizedBox(width: 5.0),
                  new Text(
                    "S***IM",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              new Row(
                children: starfun(3),
              )
            ],
          ),
          //日期
          new Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: new Text(
              "2018 10 17",
              style: TextStyle(color: Color(AppColors.mainColor)),
            ),
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: new Text(
              "一般不是太好",
              style: TextStyle(color: Color(AppColors.mainColor)),
            ),
          ),
          new Wrap(children: widgetImgsFn())
        ],
      ),
    );

    //加入购物车

    // selec 选择 widget
    widgetSelectItemsFn(Map data) {
      List<Widget> widgetSelectItems = [];
      if(widgetSelectItems.length>0){
        return widgetSelectItems;
      }
      for (int i = 0;i<data['lista'].length;i++){
        print(data['lista'].length);
        widgetSelectItems.add(
          new InkWell(
            onTap: (){
              print('xxxxxxxxxxxxxxxxxxxxxxxxxxxx');
              print(data['type']);
              print(i);
              selectColorSizeStatusFn(data['type'],i);
              // Navigator.of(context).pop();
            },
            child: new Container(
              width: 40.0,
              height: 35.0,
              decoration:BoxDecoration(
                border: Border.all(color: Color(AppColors.borderColors)),
              ),
              child:Center(
                child:data['type']==0? new Text(data['lista'][i],style: TextStyle(color:selectSizeIndex==i? Colors.red:Color(AppColors.mainColor)),):new Text(data['lista'][i],style: TextStyle(color:selectColorIndex==i? Colors.red:Color(AppColors.mainColor)),) ,
              )
            ),)
        );
      }
      return widgetSelectItems;
    }

    // Widget showModalBottomSheet = new ShowMo;
    double money = 10.0;
    pouPopSelcetListFn() {
      //加入购物车弹层
      List<Widget> pouPopSelcetList = <Widget>[];
      if(pouPopSelcetList.length>0){
        return false;
      }
      pouPopSelcetList.add(
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: new Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: new CachedNetworkImage(
                    // 图片层
                    // width: MediaQuery.of(context).size.width,
                    // width: 60.0,
                    height: 100.0,
                    fit: BoxFit.fitWidth,
                    placeholder: new CircularProgressIndicator(),
                    imageUrl: 'https://picsum.photos/350/500?image=0',
                    errorWidget: new Icon(Icons.error),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Samsung/三星 GALAXY S8 SM-G9500 4+64GB 官方正品 全视曲面屏 双卡双待 虹膜识别 4G手机",
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 0.6),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: new Text(
                        "EUR $money",
                        style: TextStyle(
                            color: Color.fromRGBO(207, 97, 76, 1.0),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // child: new Stack(
          //   alignment: Alignment.topRight,
          //   children: <Widget>[
          //     new Positioned(
          //       child: GestureDetector(
          //         child:new Icon(Icons.close,size: 40.0,),
          //         onTap:(){
          //           Navigator.pop(context);
          //         },
          //       )
          //     ),
          //   ],
          // ),
        ),
      );
      pouPopSelcetList.add(
        new Expanded(child:
        new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Divider(),
              new Padding(
                padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("颜色",style: TextStyle(color: Color(AppColors.mainColor)),),
                  new Padding(padding: EdgeInsets.only(top: 10.0),),
                  new Wrap(
                    spacing: 15.0,
                    children: widgetSelectItemsFn(colorList),
                  ),
                ],
              ),
              ),
              new Divider(),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text("尺码",style: TextStyle(color: Color(AppColors.mainColor)),),
                      new Text("Size Chart>",style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(top: 10.0),),
                  new Wrap(
                      spacing: 15.0,
                      children: widgetSelectItemsFn(sizeList),
                  ),
                ],
              )

            ],
        ) ,)
      );

      pouPopSelcetList.add(
        new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton(
                  color: Color.fromRGBO(244, 85, 64, 1.0),
                  child:new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                    child:  new Text('确定',style: new TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0)),),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
            ),
          ],
        ),
      );
      // print(pouPopSelcetList.length);
      return pouPopSelcetList;
    }

    //底部
    Widget widgetBottom() {
      List<Widget> bottomlist = <Widget>[];

      bottomlist.add(
        new GestureDetector(
          onTap: favoriteStatusFn,
          child: new Row(
            children: <Widget>[
              new Icon(Icons.favorite,
                  color: favoriteStatus ? Colors.red : null),
              new Text(
                "喜欢",
                style: TextStyle(color: favoriteStatus ? Colors.red : null),
              )
            ],
          ),
        ),
      );
      bottomlist.add(new Padding(
        padding: EdgeInsets.only(left: 6.0),
      ));
      bottomlist.add(Expanded(
        child: new GestureDetector(
          onTap: () {
            print("xxxxxxxxxxxxxxxx");
          },
          child: new Row(
            children: <Widget>[new Icon(Icons.shopping_cart), new Text("0")],
          ),
        ),
      ));
      bottomlist.add(RaisedButton(
        textColor: Colors.white,
        color: Colors.orange[800],
        child: Text('加入购物车'),
        onPressed: () {
          showModalBottomSheet<Null>(
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Container(
                    color: Colors.white,
                    child: new Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pouPopSelcetListFn(),
                      ),
                    )
                  ),
                  onTap: () {
                    return false;
                  },
                );
              });
        },
      ));
      bottomlist.add(Container(
          margin: EdgeInsets.only(left: 8),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.red[500],
            child: Text('立即购买'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {}));
            },
          )));
      return BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: bottomlist),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: new ListView(
          // itemExtent:MediaQuery.of(context).size,
          children: [
            swiperItem,
            shopDescription,
            freeShiping,
            shopColorSizeSelcet,
            new Container(
              height: 10.0,
              color: Color(0xffdddddd),
            ),
            reviewsContainer,
            topReviewsContainer,
            reviewsItem,
            // new Container(
            //   margin: EdgeInsets.only(top: 10.0),
            //   height: 100.0,
            // )
            // new topReviewsContainer(),
            // buttonSection,
          ]),
      bottomNavigationBar: widgetBottom(),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      swiperList[index],
      fit: BoxFit.cover,
    ));
  }
}
