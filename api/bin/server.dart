import 'dart:convert';
import 'dart:io';

import 'package:counter_core/counter_core.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/counter', _counterHandler)
  ..post('/counter', _counterHandler)
  ..get('/echo/<message>', _echoHandler);

final container = ProviderContainer();
final model = container.read(counterStateProvider);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

Future<Response> _counterHandler(Request request) async {
  await model.load();
  if (request.method == 'POST') {
    final body = await request.readAsString();
    final newValue = int.tryParse(body);
    if (newValue != null) {
      await model.set(newValue);
    } else {
      await model.increment();
    }
    final value = model.get().value;
    return Response.ok(jsonEncode({'counter': value}));
  } else {
    final value = model.get().value;
    return Response.ok(jsonEncode({'counter': value}));
  }
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
