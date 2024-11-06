import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/models/addresses_response.dart';
import 'package:foodly/models/api_eror.dart';
import 'package:foodly/models/hook_models/addresses.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchAddresses useFetchAddresses() {
  final box = GetStorage();
  final addresses = useState<List<AddressResponse>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String accessToken = box.read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/address/all');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        addresses.value = addressResponseFromJson(response.body);
      } else {
        appiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchAddresses(
    data: addresses.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
