final Map<String,int> SymptomMapping = {
'select':-1,
'acidity': 0,
'indigestion': 1,
'headache': 2,
'blurred_and_distorted_vision': 3,
'excessive_hunger': 4,
'muscle_weakness': 5,
'stiff_neck': 6,
'swelling_joints': 7,
'movement_stiffness': 8,
'depression': 9,
'irritability': 10,
'visual_disturbances': 11,
'painful_walking': 12,
'abdominal_pain': 13,
'nausea': 14,
'vomiting': 15,
'blood_in_mucus': 16,
'Fatigue': 17,
'Fever': 18,
'Dehydration': 19,
'loss_of_appetite': 20,
'cramping': 21,
'blood_in_stool': 22,
'gnawing': 23,
'upper_abdomain_pain': 24,
'fullness_feeling': 25,
'hiccups': 26,
'abdominal_bloating': 27,
'heartburn': 28,
'belching': 29,
'burning_ache': 30
};
final String med_uri = "http://192.168.1.38:5000/test-medicine";
final String disease_uri = "http://192.168.1.38:5000/test-disease";
final String test_uri = "http://192.168.1.38:5000/test";
final String image_pred_uri = "http://192.168.1.38:5000/search-image/v2";

final Map<String,String> gender = {
  "Select Gender":"-1",
  "Male":"1",
  "Female":"0"
};
final Map<String,String> severity = {
  "Select Severity":"-1",
  "Few days":"0",
  "A week":"1",
  "Few weeks or more":"2",

};
final Map<String,String> diseases = {
  "Select Disease":"-1",
  "Diarrhea":"0",
  "Gastritis":"1",
  "Arthritis":"2",
  "Migraine":"3"
};
