import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      onViewModelReady: (model) {
        model.init(context);

      },
      onDispose: (model) {
      },
      builder: (context, viewModel, child) {
        viewModel.setdata();
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xff6175ED), Color(0xffffffff)])),
            child: Container(
              height: MediaQuery.of(context).size.height,
                child: viewModel.loading
                    ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const SizedBox(height: 80),
                      );
                    },
                  ),
                )
              : ListView.builder(
                  itemCount: viewModel.products!.length,
                  itemBuilder: (context, index) {
                    final product =  viewModel.products![index];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage('${product.thumbnail}',),),
                      title: Text('${product.title}'),
                      subtitle: Text("${product.title}"),
                      // Add more UI elements here to display product details
                    );
                  },
                )
              ),
            ),

        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}




class MyList extends ViewModelWidget<HomeViewModel> {
  MyList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    viewModel.fetch();


    return  viewModel.isBusy
        ? Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(''),),
            title: Text('******'),
            subtitle: Text("********"),
            // Add more UI elements here to display product details
          );
        },
      ),
    ) :
    ListView.builder(
      itemCount: viewModel.products!.length,
      itemBuilder: (context, index) {
        final product =  viewModel.products![index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage('${product.thumbnail}',),),
          title: Text('${product.title}'),
          subtitle: Text("${product.title}"),
          // Add more UI elements here to display product details
        );
      },
    );
  }
}
// void hideStatusBar(PointerEvent details) {
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
// }