import 'dart:async';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }

  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lemon Squeezy'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await LemonSqueezyCheckout.openCheckout(
                  'https://codelessly.lemonsqueezy.com/buy/bb45229b-ae25-4bf5-92fa-d89b1b2b8e92?embed=1&enabled=494685');
            },
            child: const Text('Buy Now'),
          ),
        ),
      ),
    );
  }
}

class LemonSqueezyCheckout {
  static final _scriptLoaded = Completer<void>();

  static void injectScript() {
    if (_scriptLoaded.isCompleted) return; // Script already loaded

    final script = html.ScriptElement()
      ..src = 'https://assets.lemonsqueezy.com/lemon.js'
      ..defer = true
      ..onLoad.listen((event) {
        _scriptLoaded.complete();
      })
      ..onError.listen((event) {
        _scriptLoaded.completeError("Failed to load LemonSqueezy script.");
      });

    html.document.body?.append(script);
  }

  static Future<void> initialize() async {
    injectScript();
    await _scriptLoaded.future;

    if (js.context.hasProperty('createLemonSqueezy')) {
      js.context.callMethod('createLemonSqueezy');
    } else {
      throw Exception('LemonSqueezy script did not initialize correctly.');
    }
  }

  static Future<void> openCheckout(String url) async {
    await initialize();

    if (js.context.hasProperty('LemonSqueezy')) {
      final lemonSqueezy = js.context['LemonSqueezy'];
      if (lemonSqueezy.hasProperty('Url')) {
        final urlHandler = lemonSqueezy['Url'];
        if (urlHandler.hasProperty('Open')) {
          urlHandler.callMethod('Open', [url]);
        } else {
          throw Exception('Open method not found on Url object.');
        }
      } else {
        throw Exception('Url object not found on LemonSqueezy.');
      }
    } else {
      throw Exception('LemonSqueezy object not found.');
    }
  }
}
