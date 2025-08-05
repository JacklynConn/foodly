import '/constants/constants.dart';
import '/models/api_error.dart';
import '/models/food_model.dart';
import '/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllFoods(String code) {
  final foodItems = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/byCode/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foodItems.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
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

  return FetchHook(
    data: foodItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
