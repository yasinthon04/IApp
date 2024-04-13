import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/get_api/get_api_bloc.dart';
import 'package:iapp_flutter/models/api.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:iapp_flutter/widgets/customCardPriceAPI.dart';

class PriceApi extends StatefulWidget {
  @override
  State<PriceApi> createState() => _PriceApiState();
}

class _PriceApiState extends State<PriceApi> {
  ApiModel? apiModel;

  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(LoadApiEvent());
  }

  Widget _buildCard(List<ApiModel> apiList) {
    List<ApiModel> filteredList = [];
    Set<int> userIds = {1, 2}; // Specify the userIds
    for (var api in apiList) {
      if (userIds.contains(api.userId) && !filteredList.any((item) => item.userId == api.userId)) {
        filteredList.add(api);
      }
    }

    return ListView.builder(
      itemCount: filteredList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final api = filteredList[index];
        return InkWell(
          onTap: () {},
          child: CustomCardPriceApi(
            userId: api.userId,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GetApiBloc, GetApiState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ApiLoadedState) {
                    return _buildCard(state.apiList.data);
                  } else if (state is GetApiError) {
                    return const Center(
                      child: Text(
                        'Cannot load API data. Please try again later.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
