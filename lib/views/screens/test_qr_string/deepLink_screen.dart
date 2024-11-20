import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'deepLing_bloc.dart';
import 'deepLing_repo.dart';
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
        home: DeepLinkScreen()
    );
  }
}

class DeepLinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeepLinkCubit(DeepLinkRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text('Banking Deep Link & QR Code')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<DeepLinkCubit, DeepLinkState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return CircularProgressIndicator();
                    }
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => context.read<DeepLinkCubit>().fetchAndOpenDeepLink(
                            platform: Theme.of(context).platform,
                          ),
                          child: Text('Fetch Deep Link & QR Code'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          state.statusMessage ?? '',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        if (state.qrString != null)
                          QrImageView(
                            data: "${state.qrString}",
                            version: QrVersions.auto,
                            size: 320,
                            gapless: false,

                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(80, 80),
                            ),
                          ),
                        SizedBox(height: 20),
                        if (state.qrString != null)
                          ElevatedButton(
                            onPressed: () => _showConfirmationDialog(context, state),
                            child: Text('Open or Redirect to Store'),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showConfirmationDialog(BuildContext context, DeepLinkState state) async {
    final platform = Theme.of(context).platform;

    final Uri appUri = Uri.parse(state.qrString ?? '');
    final Uri storeUri = Uri.parse(
      platform == TargetPlatform.iOS ? state.appStoreUrl ?? '' : state.playStoreUrl ?? '',
    );

    final action = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Open App or Store'),
          content: Text('Would you like to open the app or go to the App Store/Play Store?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context, 0), // 0 means Cancel
            ),
            TextButton(
              child: Text('Open'),
              onPressed: () {
                Navigator.pop(context, 1); // 1 means Open
              },
            ),
          ],
        );
      },
    );

    if (action == 1) {
      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Opening Deep Link')));
      } else if (await canLaunchUrl(storeUri)) {
        await launchUrl(storeUri);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Redirecting to the store')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Unable to open the app or store')));
      }
    }
  }
}
