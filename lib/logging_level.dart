class LoggingLevel{

  static late bool simple_log_from_code_control;
  static late bool simple_log_from_firebase_control;
  static late bool debug_log_from_code_control;
  static late bool debug_log_from_firebase_control;

  // LoggingLevel({simple_log_from_code_control = true,simple_log_from_firebase_control=true,debug_log_from_code_control=true,debug_log_from_firebase_control = true}){

  //     this.simple_log_from_code_control = simple_log_from_code_control;
  //     print("hello ${this.simple_log_from_code_control}");
  //     this.simple_log_from_firebase_control = simple_log_from_firebase_control;
  //     print("h1 ${this.simple_log_from_firebase_control}");
  //     this.debug_log_from_code_control = debug_log_from_code_control;
  //     print("h2 ${this.debug_log_from_code_control}");
  //     this.debug_log_from_firebase_control = debug_log_from_firebase_control;
  //     print("h3 ${this.debug_log_from_firebase_control}");
  // }

  void simpleLog_from_code_control(bool value){

      simple_log_from_code_control = value;
  }

  void simpleLog_from_firebase_control(bool value){

      simple_log_from_firebase_control = value;
  }

  void debugLog_from_code_control(bool value){

      debug_log_from_code_control = value;
  }

  void debugLog_from_firebase_control(bool value){

     debug_log_from_firebase_control = value;
  }
}