import 'dart:convert';
import 'package:http/http.dart' as http;

class VpnServer {
  final String hostName;
  final String ip;
  final int ping;
  final double speed;
  final String country;
  final String openvpnConfig; // decoded .ovpn text

  VpnServer({
    required this.hostName,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.country,
    required this.openvpnConfig,
  });
}

Future<List<VpnServer>> fetchVpnGateServers() async {
  final resp = await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
  if (resp.statusCode != 200) {
    throw Exception('Failed to load VPN Gate list');
  }

  final lines = resp.body.split(RegExp(r'\r?\n')).skip(2);
  final servers = <VpnServer>[];

  for (var line in lines) {
    if (line.isEmpty) continue;
    final cols = line.split(','); // Use comma for CSV
    if (cols.length < 15) continue; // The CSV has 15 columns
    try {
      final configBase64 = cols[14];
      final configText = utf8.decode(base64.decode(configBase64));

      servers.add(
        VpnServer(
          hostName: cols[0],
          ip: cols[1],
          ping: int.parse(cols[3]),
          speed: double.parse(cols[4]),
          country: cols[5],
          openvpnConfig: configText,
        ),
      );
    } catch (e) {
      continue;
    }
  }

  return servers;
}
// Example usage
// void main() async {
//   try {
//     final servers = await fetchVpnGateServers();
//     for (var server in servers) {
//       print('Server: ${server.hostName}, IP: ${server.ip}, Country: ${server.country}');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
// This code fetches a list of VPN servers from the VPN Gate API, parses the response, and creates a list of VpnServer objects.
// The VpnServer class contains properties for the server's hostname, IP address, ping time, speed, country, and OpenVPN configuration.
// The fetchVpnGateServers function makes an HTTP GET request to the VPN Gate API, processes the response, and returns a list of VpnServer objects.
// The example usage at the end demonstrates how to call the fetchVpnGateServers function and print the server details.
// Note: The example usage is commented out to avoid executing it in a non-async context.
// You can uncomment it and run it in an async context to test the function.
// The code uses the http package to make HTTP requests and the dart:convert package to decode the base64-encoded OpenVPN configuration.
// Make sure to add the http package to your pubspec.yaml file:
// dependencies:
//   http: ^0.13.3
//   # Add other dependencies as needed