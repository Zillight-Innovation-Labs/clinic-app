import 'package:flutter/material.dart';
import 'package:kivicare_patient/models/get_all_test_detail_model.dart';
import 'package:kivicare_patient/screens/service/test_services.dart';
import 'package:kivicare_patient/screens/tests/insomnia/insomnia_test_result.dart';

enum TestState { loading, initial, error, success }

enum TestScoreRecommendation { first, second, third, fourth }

enum SelectedTest {
  initial,
  insomnia,
  hostility,
  addiction,
  personality,
  anxiety,
  sleepApnea,
  phobia,
  paranoia
}

class UserTestProvider extends ChangeNotifier {
  // final testService = serviceLocator<TestService>();
  final TestService _testService = TestServiceImpl();

  int selectedIndex = 0;
  double selectedBorderWidth = 2;
  double borderWidth = 1;

  String _message = '';
  String get message => _message;

  final String insomniaTestId = '631f00eb46157aab83ebeb69';
  final String hostilityTestId = '631f2c5c96a041173fe28ce3';
  final String addictionTestId = '631f197e96a041173fe28cdd';
  final String personalityTestId = '63282868056c7c8dc7424c1d';
  final String anxietyTestId = '631f2b8a96a041173fe28ce2';
  final String sleepApneaTestId = '631f23ae46157aab83ebeb93';
  final String phobiaTestId = '631f2cf996a041173fe28ce4';
  final String paranoiaTestId = '631f2dc396a041173fe28ce5';
  final String psychosisTestId = '631f487a90b6d70d9607028b';
  final String neurosisTestId = '631f578790b6d70d960702c1';
  final String liveEventOrStressTestId = '631f12e696a041173fe28cdb';
  final String personalPatientTestId = '631f169396a041173fe28cdc';
  final String somatizationTestId = '631f1af796a041173fe28cde';
  final String obsessiveTestId = '631f1cd496a041173fe28cdf';
  final String interpersonalTestId = '631f224096a041173fe28ce0';
  final String depressionTestId = '631f242796a041173fe28ce1';
  final String childSymptomParentTestId = '632104326b82e559073663fe';
  final String childSymptomChecklistTestId = '63246717cf2bdd769fa80260';
  final String dassTestId = '63dd4e4276cb1e571fe4275f';

  //Child Symptom Checklist for Parent

  TestState _state = TestState.initial;
  TestState get state => _state;

  bool _disableTouch = false;
  bool get disableTouch => _disableTouch;

  double? totalSteps;
  double currentStep = 1;
  Map<String, dynamic> testInputData = {};

  GetAllTestModel getTestModel = GetAllTestModel();
  List<Test> testDetails = [];

  List insomniaTestCommentOne = [];
  List insomniaTestCommentTwo = [];

  List hostilityTestCommentOne = [];
  List hostilityTestCommentTwo = [];
  String hostilityTestDesc = "";
  String hostilityTestName = "";
  String hostilityTestInfoOne = "";
  String hostilityTestInfoTwo = "";
  //addiction
  List addictionTestCommentOne = [];
  List addictionTestCommentTwo = [];
  String addictionTestDesc = "";
  String addictionTestName = "";
  String addictionTestInfoOne = "";
  String addictionTestInfoTwo = "";
  //anxiety
  List anxietyTestCommentOne = [];
  List anxietyTestCommentTwo = [];
  String anxietyTestDesc = "";
  String anxietyTestName = "";
  String anxietyTestInfoOne = "";
  String anxietyTestInfoTwo = "";

  //sleep apnea
  List sleepApneaTestCommentOne = [];
  List sleepApneaTestCommentTwo = [];
  String sleepApneaTestDesc = "";
  String sleepApneaTestName = "";
  String sleepApneaTestInfoOne = "";
  String sleepApneaTestInfoTwo = "";

  //phobia
  List phobiaTestCommentOne = [];
  List phobiaTestCommentTwo = [];
  String phobiaTestDesc = "";
  String phobiaTestName = "";
  String phobiaTestInfoOne = "";
  String phobiaTestInfoTwo = "";

  //paranoia
  List paranoiaTestCommentOne = [];
  List paranoiaTestCommentTwo = [];
  String paranoiaTestDesc = "";
  String paranoiaTestName = "";
  String paranoiaTestInfoOne = "";
  String paranoiaTestInfoTwo = "";

  //psychosis[0]
  List psychosisTestCommentOne = [];
  List psychosisTestCommentTwo = [];
  String psychosisTestDesc = "";
  String psychosisTestName = "";
  String psychosisTestInfoOne = "";
  String psychosisTestInfoTwo = "";

  //neurosis[1]
  List neurosisTestCommentOne = [];
  List neurosisTestCommentTwo = [];
  String neurosisTestDesc = "";
  String neurosisTestName = "";
  String neurosisTestInfoOne = "";
  String neurosisTestInfoTwo = "";

  //Somatization[7]
  List somatizationTestCommentOne = [];
  List somatizationTestCommentTwo = [];

  //Obsessive[8]
  List obsessiveTestCommentOne = [];
  List obsessiveTestCommentTwo = [];

  //Interpersonal[9]
  List interpersonalTestCommentOne = [];
  List interpersonalTestCommentTwo = [];

  //Depression[10]
  List depressionTestCommentOne = [];
  List depressionTestCommentTwo = [];

  //childSymptomParent[15]
  List childSymptomParentTestCommentOne = [];
  List childSymptomParentTestCommentTwo = [];

  //childSymptomParent[16]
  List childSymptomTestCommentOne = [];
  List childSymptomTestCommentTwo = [];

  //DassTestCommentOne[18]
  List dassDepressionTestCommentOne = [];
  List dassDepressionTestCommentTwo = [];
  List dassDepressionTestCommentThree = [];
  List dassDepressionTestCommentFour = [];
  List dassDepressionTestCommentFive = [];

  List dassAnxietyTestCommentOne = [];
  List dassAnxietyTestCommentTwo = [];
  List dassAnxietyTestCommentThree = [];
  List dassAnxietyTestCommentFour = [];

  List dassStressTestCommentOne = [];
  List dassStressTestCommentTwo = [];
  List dassStressTestCommentThree = [];
  List dassStressTestCommentFour = [];
  List dassStressTestCommentFive = [];

  //Personality[17]

  List passOpennessTestCommentOne = [];
  List passOpennessTestCommentTwo = [];

  List passConscientiousnessTestCommentOne = [];
  List passConscientiousnessTestCommentTwo = [];

  List passAgreeablenessTestCommentOne = [];
  List passAgreeablenessTestCommentTwo = [];

  List passExtraversionTestCommentOne = [];
  List passExtraversionTestCommentTwo = [];

  List passNeurosisTestCommentOne = [];
  List passNeurosisTestCommentTwo = [];

  //insomnia[4]
  List liveEeventTestCommentOne = [];
  List liveEeventTestCommentTwo = [];

  List liveEeventTestCommentThree = [];

  String liveEeventTestInfoOne = "";
  String liveEeventTestInfoTwo = "";
  String liveEeventTestInfoThree = "";

  //personal patinet[5]
  List personalPatientTestCommentOne = [];
  List personalPatientTestCommentTwo = [];
  List personalPatientTestCommentThree = [];
  List personalPatientTestCommentFour = [];
  List personalPatientTestCommentFive = [];

  String personalPatientTestInfoOne = "";
  String personalPatientTestInfoTwo = "";
  String personalPatientTestInfoThree = "";
  String personalPatientTestInfoFour = "";
  String personalPatientTestInfoFive = "";

  String personalPatientTestInterpOne = "";
  String personalPatientTestInterpTwo = "";
  String personalPatientTestInterpThree = "";
  String personalPatientTestInterpFour = "";
  String personalPatientTestInterpFive = "";

  //personality
  List personalityTestCommentOne = [];
  List personalityTestCommentTwo = [];
  String personalityTestDesc = "";
  String personalityTestName = "";

  String personalityTnterpretationOne = "";
  String personalityTnterpretationTwo = "";
  String personalityTnterpretationThree = "";
  String personalityTnterpretationFour = "";
  String personalityTnterpretationFive = "";
  String personalityTnterpretationSix = "";
  String personalityTnterpretationSeven = "";
  String personalityTnterpretationEight = "";
  String personalityTnterpretationNine = "";
  String personalityTnterpretationTen = "";

  String personalityTestNameOne = "";
  String personalityTestNameTwo = "";
  String personalityTestNameThree = "";
  String personalityTestNameFour = "";
  String personalityTestNameFive = "";
  String personalityTestNameSix = "";
  String personalityTestNameSeven = "";
  String personalityTestNameEight = "";
  String personalityTestNameNine = "";
  String personalityTestNameTen = "";

  String personalityTestInfoOne = "";
  String personalityTestInfoTwo = "";
  String personalityTestInfoThree = "";
  String personalityTestInfoFour = "";
  String personalityTestInfoFive = "";
  String personalityTestInfoSix = "";
  String personalityTestInfoSeven = "";
  String personalityTestInfoEight = "";
  String personalityTestInfoNine = "";
  String personalityTestInfoTen = "";

  //Recommendation

  List liveEventsQtn = [];
  List insomniaQtn = [];
  List sleepApneaQtn = [];
  List addictionQtn = [];
  List personalPatientQtn = [];
  List anxietytQtn = [];
  List hostilityQtn = [];
  List phobiaQtn = [];
  List psychosisQtn = [];
  List neurosisQtn = [];
  List paranoiaQtn = [];
  List somatizationQtn = [];
  List obsessiveQtn = [];
  List interpersonalQtn = [];
  List depressionQtn = [];
  List childSymptomParentQtn = [];
  List childSymptomQtn = [];
  List dassQtn = [];
  List personalityQtn = [];

  setAllTest(GetAllTestModel? test) {
    getTestModel = test!;


    notifyListeners();
  }

  setTestName(List<Test> test) {
    testDetails = test;

    //insomnia[2]
    insomniaQtn = testDetails[2].questionTypes;
    insomniaTestCommentOne = testDetails[2].recommendations[0].comment;
    insomniaTestCommentTwo = testDetails[2].recommendations[1].comment;

    //hostility[12]
    hostilityQtn = testDetails[12].questionTypes;
    hostilityTestCommentOne = testDetails[12].recommendations[0].comment;
    hostilityTestCommentTwo = testDetails[12].recommendations[1].comment;

    //addiction[6]
    addictionQtn = testDetails[6].questionTypes;
    addictionTestCommentOne = testDetails[6].recommendations[0].comment;
    addictionTestCommentTwo = testDetails[6].recommendations[1].comment;
    addictionTestDesc = testDetails[6].description;
    addictionTestName = testDetails[6].testName;
    addictionTestInfoOne = testDetails[6].recommendations[0].info;
    addictionTestInfoTwo = testDetails[6].recommendations[1].info;

    //anxiety[11]
    anxietytQtn = testDetails[11].questionTypes;
    anxietyTestCommentOne = testDetails[11].recommendations[0].comment;
    anxietyTestCommentTwo = testDetails[11].recommendations[1].comment;
    anxietyTestDesc = testDetails[11].description;
    anxietyTestName = testDetails[11].testName;
    anxietyTestInfoOne = testDetails[11].recommendations[0].info;
    anxietyTestInfoTwo = testDetails[11].recommendations[1].info;

    //sleepApnea[3]
    sleepApneaQtn = testDetails[3].questionTypes;
    sleepApneaTestCommentOne = testDetails[3].recommendations[0].comment;
    sleepApneaTestCommentTwo = testDetails[3].recommendations[1].comment;
    sleepApneaTestDesc = testDetails[3].description;
    sleepApneaTestName = testDetails[3].testName;
    sleepApneaTestInfoOne = testDetails[3].recommendations[0].info;
    sleepApneaTestInfoTwo = testDetails[3].recommendations[1].info;

    //phobia[13]
    phobiaQtn = testDetails[13].questionTypes;
    phobiaTestCommentOne = testDetails[13].recommendations[0].comment;
    phobiaTestCommentTwo = testDetails[13].recommendations[1].comment;
    phobiaTestDesc = testDetails[13].description;
    phobiaTestName = testDetails[13].testName;
    phobiaTestInfoOne = testDetails[13].recommendations[0].info;
    phobiaTestInfoTwo = testDetails[13].recommendations[1].info;

    //Paranoia[14]
    paranoiaQtn = testDetails[14].questionTypes;
    paranoiaTestCommentOne = testDetails[14].recommendations[0].comment;
    paranoiaTestCommentTwo = testDetails[14].recommendations[1].comment;
    paranoiaTestDesc = testDetails[14].description;
    paranoiaTestName = testDetails[14].testName;
    paranoiaTestInfoOne = testDetails[14].recommendations[0].info;
    paranoiaTestInfoTwo = testDetails[14].recommendations[1].info;

    //Neurosis[1]
    neurosisQtn = testDetails[1].questionTypes;
    neurosisTestCommentOne = testDetails[1].recommendations[0].comment;
    neurosisTestCommentTwo = testDetails[1].recommendations[1].comment;
    neurosisTestDesc = testDetails[1].description;
    neurosisTestName = testDetails[1].testName;
    neurosisTestInfoOne = testDetails[1].recommendations[0].info;
    neurosisTestInfoTwo = testDetails[1].recommendations[1].info;
    ////////////neurosisTestInfoTwo

    //live event[4]
    liveEeventTestCommentThree = testDetails[4].recommendations[0].comment;
    liveEeventTestCommentTwo = testDetails[4].recommendations[1].comment;
    liveEeventTestCommentOne = testDetails[4].recommendations[2].comment;

    //liveEeventTestInfoThree

    liveEeventTestInfoThree = testDetails[4].recommendations[0].info;
    liveEeventTestInfoTwo = testDetails[4].recommendations[1].info;
    liveEeventTestInfoOne = testDetails[4].recommendations[2].info;
    liveEventsQtn = testDetails[4].questionTypes;

    //Somatization[7]
    somatizationTestCommentOne = testDetails[7].recommendations[0].comment;
    somatizationTestCommentTwo = testDetails[7].recommendations[1].comment;
    somatizationQtn = testDetails[7].questionTypes;

    //Obsessive[8]
    obsessiveTestCommentOne = testDetails[8].recommendations[0].comment;
    obsessiveTestCommentTwo = testDetails[8].recommendations[1].comment;
    obsessiveQtn = testDetails[8].questionTypes;

    //Interpersonal[9]
    interpersonalTestCommentOne = testDetails[9].recommendations[0].comment;
    interpersonalTestCommentTwo = testDetails[9].recommendations[1].comment;
    interpersonalQtn = testDetails[9].questionTypes;

    //Depression[10]
    depressionTestCommentOne = testDetails[10].recommendations[0].comment;
    depressionTestCommentTwo = testDetails[10].recommendations[1].comment;
    depressionQtn = testDetails[10].questionTypes;

    //Child Symptom-parent[15]
    childSymptomParentTestCommentOne =
        testDetails[15].recommendations[0].comment;
    childSymptomParentTestCommentTwo =
        testDetails[15].recommendations[1].comment;
    childSymptomParentQtn = testDetails[15].questionTypes;

    //Child Symptom-parent[16]
    childSymptomTestCommentOne = testDetails[16].recommendations[0].comment;
    childSymptomTestCommentTwo = testDetails[16].recommendations[1].comment;
    childSymptomQtn = testDetails[16].questionTypes;

    //DASS[18]
    dassDepressionTestCommentOne = testDetails[18].recommendations[0].comment;
    dassDepressionTestCommentTwo = testDetails[18].recommendations[1].comment;
    dassDepressionTestCommentThree = testDetails[18].recommendations[2].comment;
    dassDepressionTestCommentFour = testDetails[18].recommendations[3].comment;
    dassDepressionTestCommentFive = testDetails[18].recommendations[4].comment;
//DASS-Anxiety
    dassAnxietyTestCommentOne = testDetails[18].recommendations[5].comment;
    dassAnxietyTestCommentTwo = testDetails[18].recommendations[6].comment;
    dassAnxietyTestCommentThree = testDetails[18].recommendations[7].comment;
    dassAnxietyTestCommentFour = testDetails[18].recommendations[8].comment;
    //DASSstress
    dassStressTestCommentOne = testDetails[18].recommendations[9].comment;
    dassStressTestCommentTwo = testDetails[18].recommendations[10].comment;
    dassStressTestCommentThree = testDetails[18].recommendations[11].comment;
    dassStressTestCommentFour = testDetails[18].recommendations[12].comment;
    dassStressTestCommentFive = testDetails[18].recommendations[13].comment;

    dassQtn = testDetails[18].questionTypes;

    //Personality-openess[17]
    passOpennessTestCommentTwo = testDetails[17].recommendations[0].comment;
    passOpennessTestCommentOne = testDetails[17].recommendations[1].comment;

//Personality-Conscientiousness
    passConscientiousnessTestCommentTwo =
        testDetails[17].recommendations[2].comment;
    passConscientiousnessTestCommentOne =
        testDetails[17].recommendations[3].comment;

    //Personality-Agreeableness
    passAgreeablenessTestCommentTwo =
        testDetails[17].recommendations[4].comment;
    passAgreeablenessTestCommentOne =
        testDetails[17].recommendations[7].comment;

    //personality-Extraversion
    passExtraversionTestCommentTwo = testDetails[17].recommendations[5].comment;
    passExtraversionTestCommentOne = testDetails[17].recommendations[6].comment;

    //Personality-Neurosis
    passNeurosisTestCommentTwo = testDetails[17].recommendations[8].comment;
    passNeurosisTestCommentOne = testDetails[17].recommendations[9].comment;

    personalityQtn = testDetails[17].questionTypes;

    //personal patient
    personalPatientQtn = testDetails[5].questionTypes;
    personalPatientTestCommentOne = testDetails[5].recommendations[0].comment;
    personalPatientTestCommentTwo = testDetails[5].recommendations[1].comment;
    personalPatientTestCommentThree = testDetails[5].recommendations[2].comment;
    personalPatientTestCommentFour = testDetails[5].recommendations[3].comment;
    personalPatientTestCommentFive = testDetails[5].recommendations[4].comment;

    personalPatientTestInfoOne = testDetails[5].recommendations[0].info;
    personalPatientTestInfoTwo = testDetails[5].recommendations[1].info;
    personalPatientTestInfoThree = testDetails[5].recommendations[2].info;
    personalPatientTestInfoFour = testDetails[5].recommendations[3].info;
    personalPatientTestInfoFive = testDetails[5].recommendations[4].info;

    personalPatientTestInterpOne =
        testDetails[5].recommendations[0].interpretation ?? '';
    personalPatientTestInterpTwo =
        testDetails[5].recommendations[1].interpretation ?? '';
    personalPatientTestInterpThree =
        testDetails[5].recommendations[2].interpretation ?? '';
    personalPatientTestInterpFour =
        testDetails[5].recommendations[3].interpretation ?? '';
    personalPatientTestInterpFive =
        testDetails[5].recommendations[4].interpretation ?? '';

    //Psychosis[0]
    psychosisQtn = testDetails[0].questionTypes;
    psychosisTestCommentTwo = testDetails[0].recommendations[0].comment;
    psychosisTestCommentOne = testDetails[0].recommendations[1].comment;
    psychosisTestDesc = testDetails[0].description;
    psychosisTestName = testDetails[0].testName;
    psychosisTestInfoTwo =
        testDetails[0].recommendations[0].interpretation ?? "";
    psychosisTestInfoOne =
        testDetails[0].recommendations[1].interpretation ?? "";

    //
    notifyListeners();
  }

  List testOptionOne = [
    {
      "id": "0",
      "name": "True",
      "bool": true,
      "boolean": "Yes",
      "imagePath": "assets/icons/thumbs_up.png",
    },
    {
      "id": "1",
      "name": "False",
      "bool": false,
      "boolean": "No",
      "imagePath": "assets/icons/thumbs_down.png",
    },
  ];
  final testOptionTwo = [
    {"id": "0", "name": "Not At All"},
    {"id": "1", "name": "A Little Bit"},
    {"id": "2", "name": "Moderately"},
    {"id": "3", "name": "Quite A Bit"},
    {"id": "4", "name": "Extremely"},
  ];

  final testOptionThree = [
    {"id": "0", "name": "Disagree Strongly"},
    {"id": "1", "name": "Disagree a little"},
    {"id": "2", "name": "Neither agree nor disagree"},
    {"id": "3", "name": "Agree a little"},
    {"id": "4", "name": "Agree strongly"},
  ];

  final testOptionFour = [
    {"id": "0", "name": "Never"},
    {"id": "1", "name": "Sometimes"},
    {"id": "2", "name": "Often"},
  ];
  final testOptionFive = [
    {"id": "0", "name": "Never"},
    {"id": "1", "name": "A little bit"},
    {"id": "2", "name": "Quite a bit"},
    {"id": "3", "name": "Extremely"},
  ];

  void disableScreenTouch(bool touch) {
    _disableTouch = touch;
    notifyListeners();
  }

  void setState(TestState state) {
    _state = state;
    if (state == TestState.loading) {
      disableScreenTouch(true);
    } else {
      disableScreenTouch(false);
    }

    notifyListeners();
  }

  setSelectedTestName(String testId, testScore) {
    dynamic route;

    if (testId == insomniaTestId) {
      route = InsomniaTestResult(testScore: testScore);
    } 
    
    // else if (testId == hostilityTestId)
    //  {
    //   route = HostilityTestResult(testScore: testScore);
    // } else if (testId == addictionTestId) {
    //   route = AddictionTestResult(testScore: testScore);
    // } else if (testId == personalityTestId) {
    //   route = PersonalityTestResult(testScore: testScore);
    // } else if (testId == anxietyTestId) {
    //   route = AnxietyTestResult(testScore: testScore);
    // } else if (testId == sleepApneaTestId) {
    //   route = SleapApneaTestResult(testScore: testScore);
    // } else if (testId == phobiaTestId) {
    //   route = PhobiaTestResult(testScore: testScore);
    // } else if (testId == paranoiaTestId) {
    //   route = ParanoiaTestResult(testScore: testScore);
    // } else if (testId == psychosisTestId) {
    //   route = PsychosisTestResult(testScore: testScore);
    // } else if (testId == neurosisTestId) {
    //   route = NeurosisTestResult(testScore: testScore);
    // } else if (testId == liveEventOrStressTestId) {
    //   route = LifeEventOrStressTestResult(testScore: testScore);
    // } else if (testId == personalPatientTestId) {
    //   route = PersonalPatientHealthTestResult(testScore: testScore);
    // } else if (testId == somatizationTestId) {
    //   route = SomatizationTestResult(testScore: testScore);
    // } else if (testId == obsessiveTestId) {
    //   route = ObsessiveCompulsiveTestResult(testScore: testScore);
    // } else if (testId == interpersonalTestId) {
    //   route = InterpersonalSensitivityTestResult(testScore: testScore);
    // } else if (testId == depressionTestId) {
    //   route = DepressionTestResult(testScore: testScore);
    // } else if (testId == childSymptomParentTestId) {
    //   route = ChildSymptomParentTestResult(testScore: testScore);
    // } else if (testId == childSymptomChecklistTestId) {
    //   route = ChildSymptomChecklistTestResult(testScore: testScore);
    // } else if (testId == dassTestId) {
    //   route = DASSTestResult(testScore: testScore);
    // }
    notifyListeners();

    return route;

    // notifyListeners();
  }

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  // Method to update the response data
  void updateTestInput(Map<String, dynamic> newTestInput) {
    testInputData.addAll(newTestInput);

    notifyListeners();
  }

  Future<void> addTest(testId, context) async {
    setState(TestState.loading);


    final response = await _testService.addTest(testId, testInputData);


    if (response.isError) {
      var errorStr = response.data['data'];
      if (errorStr == "Incomplete response") {
        errorStr = errorStr + ", " + "you have omitted some option";
      }
      setState(TestState.error);
      setMessage(errorStr ?? "server error");
      // showSnackBar(context, message.toString());
    } else {
    

      // final testScore = response.data["test"]['data']['result'] ?? 10;
      getAllTest();

      setState(TestState.success);
      // CustomWidget.openTestDialog(
      //   context,
      //   setSelectedTestName(
      //     //re-direct to selected route
      //     testId, testScore,
      //   ),
      // );
      clearTestData();
      setMessage("You've completed your test");
    }
  }

  Future<void> getAllTest() async {
    final response = await _testService.getAllTest();


    if (response!.isError) {

    } else {
      setAllTest(response.data);

      setTestName(getTestModel.testDetails!.data.test);
    }
  }

  clearTestData() {
    currentStep = 1;
    testInputData = {};

    notifyListeners();
  }
}
