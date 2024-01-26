import 'dart:io';

void main() {
  Map<String, List<String>> medicalDatabase = {
    "Common Cold": ["cough", "sneezing", "sore throat"],
    "Flu": ["cough", "fever", "headache", "muscle aches"],
    "Allergy": ["sneezing", "itchy eyes", "runny nose"]
  };

  print("Welcome to the Hospital Diagnosis App");
  try {
    print("How many lists of symptoms do you have? ");
    int numLists = int.parse(stdin.readLineSync()!);
    List<String> allSymptoms = [];
    for (int i = 0; i < numLists; i++) {
      print("Enter symptoms from list ${i + 1}, separated by commas: ");
      List<String> symptomsInput = stdin.readLineSync()!.split(',').map((symptom) => symptom.trim().toLowerCase()).toList();
      allSymptoms.addAll(symptomsInput);
    }

    if (!allSymptomsValid(allSymptoms, medicalDatabase)) {
      print("Some symptoms are not recognized. Please try again.");
      return;
    }

    List<String> possibleConditions = diagnose(allSymptoms, medicalDatabase);
    print("Based on your symptoms, you might have: ${possibleConditions.join(', ')}");
    print("You will need to see a medical doctor");
  } catch (e) {
    print("An error occurred: $e");
  }
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
