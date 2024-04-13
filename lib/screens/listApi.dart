import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iapp_flutter/bloc/get_api/get_api_bloc.dart';
import 'package:iapp_flutter/models/api.dart';
import 'package:iapp_flutter/widgets/constants.dart';
import 'package:iapp_flutter/widgets/customCardAPI.dart';

class ListApi extends StatefulWidget {
  @override
  _ListApiState createState() => _ListApiState();
}

class _ListApiState extends State<ListApi> {
  ApiModel? apiModel;

  @override
  void initState() {
    super.initState();
    context.read<GetApiBloc>().add(LoadApiEvent());
  }

  Widget _buildCard(List<ApiModel> apiList) {
    return ListView.builder(
      itemCount: apiList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final api = apiList[index];
        return InkWell(
          onTap: () {},
          child: CustomCardApi(
            userId: api.userId,
            id: api.id,
            title: api.title,
            body: api.body,
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
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Text(
                'SUM API',
                style: TextStyle(
                  fontSize: 24,
                  color: Constants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
