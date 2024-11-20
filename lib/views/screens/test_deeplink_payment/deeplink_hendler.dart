import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'deepLing_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DeepLinkHandler()
    );
  }
}


class DeepLinkHandler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeepLinkCubit()..fetchDeepLink(), // Initialize deep link fetching
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deep Link Handler'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: BlocBuilder<DeepLinkCubit, DeepLinkState>(
              builder: (context, state) {
                if (state.isLoading) {
                  // Show loading indicator while processing the deep link
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        'Fetching deep link...',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  );
                }

                if (state.errorMessage != null) {
                  // Show error message if there was an issue with the deep link
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 40),
                      SizedBox(height: 16),
                      Text(
                        'Error: ${state.errorMessage}',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Show deep link message
                    Icon(Icons.link, color: Colors.blue, size: 40),
                    SizedBox(height: 16),
                    Text(
                      state.deepLinkMessage ?? 'No deep link received yet.',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    // Button to trigger the deep link action again
                    ElevatedButton(
                      onPressed: () => context.read<DeepLinkCubit>().fetchDeepLink(),
                      child: Text('Retry Deep Link'),
                    ),
                    ElevatedButton(
                      onPressed: () => context.read<DeepLinkCubit>().fetchDeeplinkFromAPI(),
                      child: Text('Fetch Deeplink from API'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
