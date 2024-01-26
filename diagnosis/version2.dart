import 'dart:io';

void main() {
  // Define a simple symptom to disease mapping
  Map<String, List<String>> medicalDatabase = {
    "Common Cold": ["cough", "sneezing", "sore throat"],
    "Flu": ["cough", "fever", "headache", "muscle aches"],
    "Allergy": ["sneezing", "itchy eyes", "runny nose"]
  };

  print("Welcome to the Hospital Diagnosis App");
  print("Enter your symptoms, separated by commas: ");
  List<String> symptoms = stdin.readLineSync()!.split(',').map((symptom) => symptom.trim().toLowerCase()).toList();

  // Validate user input
  if (!allSymptomsValid(symptoms, medicalDatabase)) {
    print("Some symptoms are not recognized. Please try again.");
    return;
  }

  List<String> possibleConditions = diagnose(symptoms, medicalDatabase);
  print("Based on your symptoms, you might have: ${possibleConditions.join(', ')}");
}

bool allSymptomsValid(List<String> symptoms, Map<String, List<String>> medicalDatabase) {
  Set<String> allSymptoms = medicalDatabase.values.expand((symptoms) => symptoms).toSet();
  return symptoms.every((symptom) => allSymptoms.contains(symptom));
}

List<String> diagnose(List<String> symptoms, Map<String, List<String>> medicalDatabase) {
  List<String> possibleConditions = [];
  for (var condition in medicalDatabase.keys) {
    if (symptoms.every((symptom) => medicalDatabase[condition]!.contains(symptom))) {
      possibleConditions.add(condition);
    }
  }
  return possibleConditions.isNotEmpty ? possibleConditions : ["No matching condition found"];
}
