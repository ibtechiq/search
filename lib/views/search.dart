import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search.dart';
import '../utilities/components/search_card.dart';
class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String query = '';
  final TextEditingController _textFieldController = TextEditingController();
  SearchDataController searchDataController = Get.put(SearchDataController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          query = '';
        });
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(backgroundColor:  Colors.white,elevation: 0,title: const Text('قلب وشرايين',style: TextStyle(color: Colors.black,fontSize: 16),),centerTitle: true,),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  elevation: 0,
                  color: Colors.grey[200],
                  child: TextField(
                    controller: _textFieldController,
                    autocorrect: false,
                    autofocus: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(right: 16,left: 16,top: 16),
                      hintText: 'ابحث عن طبيب, مثال: احمد',
                      hintStyle:
                      const TextStyle(fontSize: 14, color: Colors.black),
                      suffixIcon: _textFieldController.text.isEmpty
                          ? IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.blueGrey,
                        ),
                        onPressed: () {
                         searchDataController.fetchData(search: _textFieldController.text
                             .toLowerCase());
                          setState(() {
                            query =
                                _textFieldController.text.toLowerCase();
                          });
                          FocusScope.of(context)
                              .requestFocus(FocusNode());
                        },
                      )
                          : IconButton(
                        icon:  Icon(
                          Icons.close,
                          color: Colors.red[300],
                        ),
                        onPressed: () {
                          _textFieldController.clear();
                          FocusScope.of(context)
                              .requestFocus(FocusNode());
                          setState(() {
                            query = '';
                          });
                        },
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onChanged: (string) {
                      Future.delayed(const Duration(seconds: 3), () {
                        searchDataController.fetchData(search: string);
                      });
                        setState(() {
                          query = string;
                        });

                    },
                  ),
                ),
              ),
              query == ''
                  ? const SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 120,),
                      Image(
                        image: AssetImage(
                            'assets/images/search.png'),
                        width: 250,
                        height: 200,

                      ),
                      Text(
                        "ابدا البحث عن طبيبك الان",
                        style:  TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ),
              )
                  :  Obx(()=>searchDataController.isLoading.value==true?
                       SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height /
                                  12),
                          child: Center(
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(
                                      'assets/images/search.gif'),
                                  width: 250,
                                  height: 200,
                                  color: Colors.blueGrey,
                                ),
                                Text(
                                  " ${'جاري البحث عن'} ${_textFieldController.text}",
                                  style:  const TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    :SingleChildScrollView(
                        child: searchDataController.searchModel!.data.isNotEmpty
                            ? Column(
                          children: [
                            GridView(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.68
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: searchDataController.searchModel!.data
                                    .map<Widget>((e) => SearchList(
                                  data: e,
                                ))
                                    .toList()),
                          ],
                        )
                            : SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context)
                                        .size
                                        .height /
                                        3),
                                child: Center(
                                  child: Text(
                                    " ${'لا يوجد نتائج بحث عن'} ${_textFieldController.text}",
                                    style:  const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey),
                                  ),
                                ))))),
            ],
          ),
        ),
      ),
    );
  }
}
