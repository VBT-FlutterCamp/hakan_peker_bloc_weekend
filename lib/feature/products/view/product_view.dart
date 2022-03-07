import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

import '../service/product_service.dart';
import '../viewModel/product_cubit.dart';
import '../viewModel/product_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit(ProductService(NetworkManager(options: BaseOptions()))),
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text(context.watch<ProductCubit>().listCount.toString())),
              body: bodyListview(state),
            );
          },
        ));
  }

  Widget bodyListview(ProductState state) {
    if (state is ProductLoading) {
      return _buildProgress();
    } else if (state is ProductCompleted) {
      return ListView.builder(
        itemCount: state.items?.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(state, index, context);
        },
      );
    } else {
      return const Text("Error");
    }
  }

  Center _buildProgress() {
    return const Center(
      child: LinearProgressIndicator(),
    );
  }

  Padding _buildCard(ProductCompleted state, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Text(
              state.items?[index].category ?? "",
              style: context.textTheme.headline4,
            ),
            SizedBox(height: context.height * 0.5, child: Image.network(state.items?[index].image ?? "")),
            Text(
              state.items?[index].title ?? "",
              style: context.textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
