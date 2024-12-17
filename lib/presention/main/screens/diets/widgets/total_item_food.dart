import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthystate/core/cubit/cubit.dart';
import 'package:healthystate/core/cubit/state.dart';
import 'package:healthystate/presention/main/screens/widgets/custom_search_delegate.dart';
import 'package:healthystate/presention/main/screens/widgets/model_meal.dart';

class TotalItemFood extends StatelessWidget {
  const TotalItemFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var totalItemFood = context.read<AppCubit>().totalItem;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Total Item Food'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: totalItemFood.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.green[300],
                  child: ListTile(
                    leading: Image.network(totalItemFood[index].icon,
                        width: 50, height: 50),
                    title: Text(totalItemFood[index].slug),
                    trailing: Text('Cals: ${totalItemFood[index].cals}'),
                  ),
                ),
              );
              // return ListTile(
              //   leading: Image.network(totalItemFood[index].icon,
              //       width: 50, height: 50),
              //   title: Text(totalItemFood[index].slug),
              //   trailing: Text('Cals: ${totalItemFood[index].cals}'),
              // );
            },
          ),
        );
      },
    );
  }
}
