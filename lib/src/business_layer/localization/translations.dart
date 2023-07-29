import 'package:flutter/widgets.dart';
import 'package:green_spark_vendor/src/business_layer/localization/english_text.dart';
import 'package:green_spark_vendor/src/data_layer/res/strings.dart';

class AppLocalizations {
  static late AppLocalizations current;
  static late Locale locale;

  AppLocalizations._(Locale appLocale) {
    current = this;
  }

  static Future<AppLocalizations> load(Locale appLocale) {
    locale = appLocale;
    return Future.value(AppLocalizations._(appLocale));
  }

  /// Localizations are usually accessed using the InheritedWidget "of" syntax.
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Map of values of supported languages
  static final Map<String, Map<String, String>> _localizedValues = {
    /// English text
    "en": EnglishText.localizationValues,

    /// Norwegian text
    'no': {
      "title": "fotspor",
      "title": "Food Steps",
      "empty_string": "",
      "api_exception":
          "We are working on your request. Please try after sometime.",
      "timeout_exception":
          "We detect slow internet connection at your end. Please go to a good internet zone and try again.",
      "socket_exception": "Please check your internet connection.",
      "parse_exception":
          "There is a problem while fetching data. Please contact support.",
      "login": "LOGIN",
      "user_not_found": "User not found",
      "cancelCapital": "CANCEL",
      "want_to_logout": "Are you sure, you want to logout?",
      "logoutCapital": "Logout",
      "session_expired": "Session expired",
      "ok": "Ok",
      "welcome": "Welcome!",
      "login_info":
          "Kindly login to the GO-Share App using your registered email address.",
      "email": "Email",
      "first_name": "First Name",
      "last_name": "Last Name",
      "email_address": "Email Address",
      "password": "Password",
      "forgot_password": "Forgot Password",
      "question_mark": "?",
      "forgot_password_info":
          "Enter your registered email address below & we'll send you a verification code to reset your password.",
      "send_verification_link": "SEND VERIFICATION LINK",
      "awesome": "Awesome",
      "next": "Next",
      "forgot_password_link_send_success_message":
          "Your link has been successfully send to your mail",
      "profile": "Profile",
      "enable_notifications": "Enable Notification",
      "bluetooth": "Bluetooth",
      "location": "Location",
      "i_agree_to": "I agree to ",
      "terms_and_conditions": "Terms & Conditions",
      "terms_and_condition": "Terms and Condition",
      "reservation": "Reservation",
      "reservation_desc":
          "Experience effortless mobility wherever you go by making a car reservation at any time. Deliver the vehicle after the journey at your convenience.",
      "lock_unlock": "Lock/ Unlock",
      "lock_unlock_desc":
          "You can always lock a car and then unlock it whenever it's convenient for you. Check fuel and battery percentage of a car at any given point of time.",
      "reservation_directory": "Reservation Directory",
      "reservation_directory_desc":
          "Keep track of your ongoing, past and up-coming reservations along with the vehicle up to date information. Also Cancel the upcoming reservation.",
      "view_description": "View Description",
      "skip": "Skip",
      "got_it": "Got It",
      "notification_off_title":
          "Are you sure you want to switch off Notification?",
      "notification_off_desc":
          "In the future, you will be restricted from receiving notifications.",
      "bluetooth_off_title": "Are you sure you want to switch off Bluetooth?",
      "bluetooth_off_desc":
          "You won't be able to lock/unlock the car if you switch off the bluetooth",
      "location_off_title": "Are you sure you want to enable Location?",
      "location_off_desc":
          "You won't be able to locate the nearby cars around you",
      "no": "No",
      "yes": "Yes",
      "user_agreement": "User Agreement",
      "terms_and_conditions_title": "General Terms and Conditions efl",
      "i_agree_terms_and_conditions": "I AGREE TO TERMS AND CONDITIONS",
      "allow_location": "Allow Location",
      "allow_location_desc": "We need your permission to access your location",
      "do_not_allow": "Do Not Allow",
      "reserve": "Reserve",
      "reservation_start_time": "Reservation Start Time",
      "reservation_end_time": "Reservation End Time",
      "reserve_now": "Reserve: now",
      "tips_and_useful_features": "Tips & Useful features",
      "tips_and_useful_features_desc":
          "This app is more than just a journey planner. We are happy to help you get more out of the app.",
      "view_tips": "View Tips",
      "home": "Home",
      "reservations": "Reservations",
      "more": "more",
      "reserve_for_one_hour": "Reserve for 1 hour",
      "reserve_for_two_hour": "Reserve for 2 hour",
      "reserve_for_three_hour": "Reserve for 3 hour",
      "reserve_for_four_hour": "Reserve for 4 hour",
      "ongoing_reservation": "On-Going Reservation",
      "upcoming_reservation": "Upcoming Reservation",
      "past_reservation": "Past Reservation",
      "booking_id": "Booking ID",
      "recommended_for_you": "recommended_for_you",
      "your_reservation_has_been_confirmed":
          "Your reservation has been confirmed",
      "lock": "Lock",
      "unlock": "Unlock",
      "parked": "Parked",
      "fuel": "Fuel",
      "away": "away",
      "drop_off": "Drop Off",
      "pick_up": "Pick Up",
      "fuel_consumption": "Fuel Consumption",
      "distance_travelled": "Distance Travelled",
      "cancel_reservation": "Cancel Reservation",
      "reservation_cancel_title":
          "Are you sure you want to cancel this reservation?",
      "reservation_cancel_desc":
          "Your ride will be cancel if you tap on a yes button. Are you sure for this action",
      "logout_desc": "Are you sure you want to logout?",
      "change_password": "Change Password",
      "get_help": "Get Help",
      "send_feedback": "Send Feedback",
      "distance_m_unit": "m",
      "distance_km_unit": "km",
      "fuel_consumption_unit": "KWh",

      "submit": "Submit",
      "forgot_your_password": "Forgot your password?",
      "reset_your_password_here": "Reset your password here",
      "reset_your_password": "Reset your password?",
      "resend": "Resend",
      "enter_otp_you_received": "Enter the OTP you've received",
      "otp_reset_info": "OTP for resetting your password have been send to ",
      "incorrect_otp": "Incorrect OTP",
      "add_new_password": "Add new password",
      "enter_your_new_password": "Enter your new password",
      "new_password": "New password",
      "confirm_new_password": "Confirm new password",
      "include_upper_case_letter": "Include Upper case letter.",
      "include_numeric": "Include numeric letter.",
      "include_special_symbol": "Include special symbol.",
      "save_new_password": "Save new password",
      "change_your_password": "Change your password?",
      "instruction_to_add_new_password":
          "Please include below security points to create a strong password",
      "back_to_login": "Back to Login",
      "password_reset_successfully": "Password Reset Successfully",
      "your": "your",
      "password_reset_message":
          "account password reset successfully now you can login with new password",

      ///[Edited By Anuj Semwal]
      "get_machine_loan": "Get a Machine Loan that is Easy & Quick",
      "get_solar_loan": "Rooftop Solar Loans Made Easy Affordable",
      "get_business_loan":
          "Business Loan Online for Small Business Owners & MSMEs",
      "continue": "Continue",
      "or": "OR",
      "login_using": "Login using",
      "enter_phone_number": "Skriv inn telefonnummer",
      "do_not_have_an_account": "Don’t have an account?",
      "log_in_as_guest": "Login as a Guest",
      "log_in_using_email": "Login using email address",
      "log_in_as_emp": "Log in as a Employee",
      "loans_details": "Loans Details",
      "loan_against_property": "Loan Against Property",
      "loan_id": "Loan ID",
      "utilised_amount": "Utilised Amount",
      "available_limit": "Available Limit",
      "repayment_tenure": "Repayment Tenure",
      "annualised_rate_of_interest": "Annualised Rate of Interest",
      "loan_amount": "Loan Amount",
      "next_due_eMI_Amount": "Next Due EMI Amount",
      "pay_eMI": "Pay EMI",
      "emi_details": "EMI Details",
      "select": "Select",
      "month": "Month",
      "emi_amount": "EMI Amount",
      "selected_emi": "Selected EMI",
      "pay": "Pay",
      "status": "Status",
      "closed": "Closed",
      "loan_date": "Loan Date",
      "duration": "Duration",
      "things_you_can_do": "Things you can do",
      "view_document": "View Document",
      "loan_details": "Loan Details",
      "bank_details": "Bank Details",
      "fee_charges": "Fee & charges",
      "number_of_emi_paid": "Number of eMI’s Paid",
      "eMI_start_date": "EMI Start Date",
      "emi_end_date": "EMI End Date",
      "previous_eMI_amount": "Previous EMI Amount",
      "loan_amount_paid_till_date": "Loan Amount Paid till date",
      "disbursement_date": "Disbursement date",
      "bank_name": "Bank Name",
      "bank_account_number": "Bank Account Number",
      "bank_IFSC": "Bank IFSC",
      "applied_date": "Applied Date",
      "apply": "Apply",
      "loan_tenure": "Loan Tenure",
      "follow_up": "Follow Up",
      "adhaar_card": "Adhaar Card",
      "adhaar_info": "Adhaar , Unique Identification Authority",
      "pan_info": "Permanent account number (PAN)",
      "pan_card": "PAN Card",
      "address_proof": "Address Proof",
      "address_info": "Telephone Bill, Electricity Bill, Etc",
      "add_another_doc": "Add Another Document",
      "upload_any_proof": "Upload any proof",
      "documents": "Documents",
      "documents_info_for_close_loan":
          "Select the type of payment towards your Loan Accoun Number -",
      "phone_number": "Phone Number",
      "dob": "Date Of Birth",
      "saved_address": "Saved Address",
      "save": "Save",
      "help_us": "Help Us",
      "faq": "FAQs",
      "add_details": "Add Details",
      "add_sec_num": "Add Secondary Phone number",
      "add_additional_num": "Add Additional Phone number",
      "add_additional_email": "Add Additional email",
      "add_sec_email": "Add Secondary Email",
      "log_out": "Log Out",
      "profile_incomplete": "PROFILE INCOMPLETE",
      "profile_incomplete_warning_text":
          "Please complete your profile to apply for new loan",
      "delete_account": "Delete account",
      "name": "Name",
      "thanks_description": "Someone from our team will soon contact you",
      "primary_email_id": "Primary Email Id",
      "enter_name": "Enter name",
      "email_id": "Email Id",
      "create_password": "Create Password",
      "enter_email_id": "Enter email Id",
      "contact_us": "Contact Us",
      "about_us": "About Us",
      "privacy_policies": "Privacy Policies",
      "term_and_condition": "Term & Condition",
      "report_query": "Report Query",
      "location_and_notification": "Location & Notification",
      "location_services": "Location Services",
      "manage_notification": "Manage Notifications",
      "helpline_numbers": "Helpline Numbers",
      "LOG_OUT": "LOGOUT",
      "confirmation_logout": "Are you sure you want to logout.",
      "confirmation_delete_account":
          "Are you sure you want to Delete you account.",
      "confirmation_delete_co_applicant":
          "Are you sure you want to Delete this Co-Applicant.",
      "confirmation_delete_guarantor":
          "Are you sure you want to Delete this Guarantor.",
      "locate_nearby": "Locate Nearby Branches",
      "nach_mandate": "NACH Mandate",
      "date": "Date",
      "view_detail": "View detail",
      "update_NACH": "Update NACH",
      "loan_account_number": "Loan Account number",
      "verify_email": "Verify your email",
      "change_email_id": "Change email Id",
      "did_not_receive_code": "Didn’t receive a code?",
      "verify": "Verify",
      "change_number": "Change Number",
      "mobile_number": "Mobile Number",
      "verify_number": "Verify your Number",
      "login_using_number": "Login using phone number",
      "forgot_pass_hint":
          "Don’t worry it happens. Please enter the mobile number or email address associated with your account.",
      "enter_mobile_or_email": "Enter mobile number or email address",
      "enter_mobile": "Enter mobile number",
      "otp_sent_on_mobile": "OTP sent on Mobile number",
      "enter_otp": "Enter OTP",
      "create_acc": "Create an account",
      "create_acc_hint": "Hello there, sign up to continue.",
      "existing_loan": "Existing Loan",
      "applied_loan": "Applied Loan",
      "closed_loan": "Closed Loan",
      "others": "Others",
      "overdue_amount": "Overdue Amount",
      "make_payment": "Make Payment",
      "go_to_loan_details": "Go to Loan Details",
      "part_pre_payment": "Part Pre-Payment",
      "advance_eMI": "Advance EMI",
      "full_payment": "Full Payment/ Foreclosure",
      "part_pre_payment_content":
          "Pay part of the principal Outstanding Amount",
      "advance_eMI_content": "Make payment of upto 5 EMI’s in advance",
      "full_payment_content": "Pay remaining principal outstanding loan amount",
      "select_the_type_acc_num":
          "Select the type of payment towards your Loan Accoun Number - ",
      "loan_closure_date": "Loan Closure date",
      "current_bank_nach_Details": "Current Bank NACH Details",
      "max_emi_available": "Maximum EMI Available",
      "update_new_nach": "Update New NACH",
      "thank_you": "Thank You",
      "nach_update_thank_quote":
          "Your NACH request has been received. Our backend team will review and share the confirmation shortly",
      "please_enter_email_pass": "Please Enter Email And Password",
      "please_enter_email": "Please Enter Email Id",
      "please_enter_pass": "Please Enter Password",
      "please_enter_new_pass": "Please Enter New Password",
      "please_enter_confirm_pass": "Please Enter Confirm Password",
      "please_enter_valid_pass": "Please Enter Valid Password",
      "does_not_match_pass": "Password does not match",
      "mobile_number_req": "Mobile number is required",
      "valid_phone_no_error": "Please enter valid number",
      "valid_otp": "Please enter valid otp",
      "statement_of_acc": "Statement of Accounts",
      "repayment_schedule": "Repayment Schedule",
      "interest_certificate": "Interest Certificate",
      "no_loan_text": "Sorry! No Existing loans",
      "select_loan_amount": "Select Loan Amount",
      "select_tenure": "Select Tenure",
      "please_enter_the_loan_amount": "Please enter the loan amount ",
      "no_loan_des_text": "Please complete your profile to apply a new loan.",
      "make_payment_info":
          "Select the type of payment towards your Loan Accoun Number - ",
      "active_loans": "Active Loans",
      "pan_details": "PAN Details",
      "pan": "PAN",
      "enter_pan": "Enter PAN",
      "enter_aadhaar": "Enter Aadhaar Number",
      "aadhaar_details": "Aadhaar Details",
      "address": "Address",
      "enter_address": "Enter Address",
      "aadhaar": "Aadhaar",
      "gender": "Gender",
      "father_name": "Father’s Name",
      "address_line": "Address Line ",
      "state": "State",
      "district": "District",
      "city": "City",
      "upload": "Upload",
      "upload_address_proof": "Upload Address Proof",
      "residential_status": "Residential Status",
      "select_gender": "Select Gender",
      "select_state": "Select State",
      "select_district": "Select District",
      "select_city": "Select City",
      "select_residential_status": "Select Residential Status",
      "enter_your_address": "Enter your present address details (Optional)",
      "enter_your_details":
          "Enter your PAN details to complete your loan request",
      "enter_applicant_details": "Enter Applicant Details",
      "view_all": "View All",
      "get_started": "Get Started",
      "new_purchase": "New Purchase",
      "refinance": "Refinance",
      "secured_loan": "Secured Loan",
      "unsecured_loan": "UnSecured Loan",
      "lic": "LIC",
      "hey": "Hey",
      "salaried": "Salaried",
      "edit": "Edit",
      "delete": "Delete",
      "vehicle": "Vehicle",
      "done": "Done",
      "adhaar_number": "Adhaar Number",
      "pan_acc_num": "Permanent Account Number",
      "pan_acc_num_hint":
          "Or PAN is a 10-Character alphanumeric located at the bottom of your PAN Card",
      "adhaar_hint":
          "Or Adhaar number is a 12-digit unique identity number located at the bottom of your Adhaar Card",
      "machine": "Machine",
      "guarantor": "Guarantor!",
      "list_of_guarantor": "Here is the list of Guarantor!",
      "entity_name": "Entity Name",
      "enter_co_applicant_details": "Enter Co-Applicant Details",
      "enter_guarantor_details": "Enter Guarantor Details",
      "enter_co_applicant_details_text":
          "Enter Co-Applicant details to complete your loan request",
      "enter_guarantor_details_text":
          "Enter guarantor details to complete your loan request",
      "date_of_incorporation": "Date of Incorporation",
      "co_applicants": "Co-applicants!",
      "add_co_applicants": "Add Another",
      "enter_collateral_details_text":
          "Enter your Collateral details to complete your loan request",
      "list_of_co_applicants": "Here is the list of CoApplicants",
      "help_us_content": "Just a few more steps to complete your loan request",
      "self_employed": "Self Employed",
      "self_employed_content":
          "You seems to be a Self Employed.  Please confirm & select your occupation.",
      "salaried_content":
          "You seems to be a salaried employee. Please confirm & select your occupation.",
      "lap_collateral_details": "Collateral Details (LAP)",
      "property_type": "Property Type",
      "back": "Back",
      "category": "Category",
      "type_description": "Type Description",
      "max_300_words": "Max:300 Words",
      "credit_score": "Credit Score",
      "rented": "Rented",
      "owned": "Owned",
      "property_value": "Property Value (Per Sq.Ft.)",
      "area_of_property": "Area of Property (Sq. Ft.)",
      "upload_property_pics": "Upload Property Pictures",
      "property_address": "Property Address",
      "residential": "Residential",
      "industrial": "Industrial",
      "commercial": "Commercial",
      "permanent": "Permanent",
      "present": "Present",
      "new": "New",
      "enter_new_add": "Enter New Address",
      "collateral_details": "Collateral Details",
      "collateral_type": "Collateral Type",
      "property_lap": "Property Lap",
      "add_another_collateral": "Add Another Collateral",
      "add_bank_account": "Add Bank Account",
      "back_to_home": "Back to Home",
      "eligible_amount": "Eligible Amount",
      "apply_for_eligible_loan": "Apply for the Eligible Loan Amount ",
      "or_apply_for_amount": "or Apply for the amount ",
      "choose_an_option": "Choose one option",
      "new_loan_application": "New loan application",
      "loan_application_id": "Loan Application ID",
      // "loan_application_is_under_review":"Your Loan Application is under review and our team will reach out to you very soon.",
      "loan_application_is_under_review":
          "We are assessing your application. Be assured our team will reach out to you soon",
      "loan_application_is_approved": "Your Loan Application has been approved",
      "you_are_eligible": "Your are eligible for a loan amount of",
      "congratulation": "Congratulation",
      "is_machine_available": "Is Machine Available?",
      "select_your_occupation": "Select your occupation.",
      "occupation": "Occupation",
      "i_agree_to_consent_on": "I agree to consent on",
      "and": "And",
      "require_noc": "Require NOC",
      "require_ndc": "Require NDC",
      "short_closure_calculation": "Short Closure Calculation",
      "regular_closure_calculation": "Regular Closure Calculation",
      "SOA/IRR/IPC": "SOA/IRR/IPC",
      "refund": "Refund",
      "general_query": "General Query",
      "original": "Original",
      "duplicate": "Duplicate",
      "tds_refund": "TDS Refund",
      "EMI_excess_refund": "EMI Excess Refund",
      "closure_refund": "Closure Refund",
      "other_refund": "Other Refund",
      "sanction_letter_require": "Sanction Letter Require.",
      "outstanding_require": "Outstanding Require/ Exposure Details Require",
      "track_record_require": "Track Record Require",
      "you_did_it": "You Did it",
      "under_review": "Under Review",
      "your_loan_under_review_be_sure_team_will_back":
          "Your loan application is still under review. Be assured our team will soon reach out to you.",
      "just_need_to_enter_adhaar":
          "You just need to enter your Adhaar details!",
      "be_with_us": "Be with us",
      "hey_there": "Hey There",
    }
  };

  /// Getters of all keys of supported language map
  String get getTitle => _localizedValues[locale.languageCode]?['title'] ?? "";

  String get getEmptyString =>
      _localizedValues[locale.languageCode]?['empty_string'] ?? "";

  String get getApiExceptionMessage =>
      _localizedValues[locale.languageCode]?['api_exception'] ?? "";

  String get getTimeoutExceptionMessage =>
      _localizedValues[locale.languageCode]?['timeout_exception'] ?? "";

  String get getSocketExceptionMessage =>
      _localizedValues[locale.languageCode]?['socket_exception'] ?? "";

  String get getParseExceptionMessage =>
      _localizedValues[locale.languageCode]?['parse_exception'] ?? "";

  String get getLetsStart =>
      _localizedValues[locale.languageCode]?['lets_start'] ?? "";

  String get getLogin => _localizedValues[locale.languageCode]?['login'] ?? "";

  String get getUserNotFound =>
      _localizedValues[locale.languageCode]?['user_not_found'] ?? "";

  String get getSessionExpired =>
      _localizedValues[locale.languageCode]?["session_expired"] ?? "";

  String get getOk => _localizedValues[locale.languageCode]?["ok"] ?? "";

  String get getWelcome =>
      _localizedValues[locale.languageCode]?["welcome"] ?? "";

  String get getLoginInfo =>
      _localizedValues[locale.languageCode]?["login_info"] ?? "";

  String get getEmail => _localizedValues[locale.languageCode]?["email"] ?? "";

  String get getFirstName =>
      _localizedValues[locale.languageCode]?["first_name"] ?? "";

  String get getLastName =>
      _localizedValues[locale.languageCode]?["last_name"] ?? "";

  String get getEmailAddress =>
      _localizedValues[locale.languageCode]?["email_address"] ?? "";

  String get getPassword =>
      _localizedValues[locale.languageCode]?["password"] ?? "";

  String get getForgotPassword =>
      _localizedValues[locale.languageCode]?["forgot_password"] ?? "";

  String get getQuestionMark =>
      _localizedValues[locale.languageCode]?["question_mark"] ?? "";

  String get getForgotPasswordInfo =>
      _localizedValues[locale.languageCode]?["forgot_password_info"] ?? "";

  String get getSendVerificationLink =>
      _localizedValues[locale.languageCode]?["send_verification_link"] ?? "";

  String get getAwesome =>
      _localizedValues[locale.languageCode]?["awesome"] ?? "";

  String get getNext => _localizedValues[locale.languageCode]?["next"] ?? "";

  String get getForgotPasswordLinkSendSuccessMessage =>
      _localizedValues[locale.languageCode]
          ?["forgot_password_link_send_success_message"] ??
      "";

  String get getProfile =>
      _localizedValues[locale.languageCode]?["profile"] ?? "";

  String get getEnableNotifications =>
      _localizedValues[locale.languageCode]?["enable_notifications"] ?? "";

  String get getBluetooth =>
      _localizedValues[locale.languageCode]?["bluetooth"] ?? "";

  String get getLocation =>
      _localizedValues[locale.languageCode]?["location"] ?? "";

  String get getIAgreeTo =>
      _localizedValues[locale.languageCode]?["i_agree_to"] ?? "";

  String get getTermsAndConditions =>
      _localizedValues[locale.languageCode]?["terms_and_conditions"] ?? "";

  String get getTermsAndCondition =>
      _localizedValues[locale.languageCode]?["terms_and_condition"] ?? "";

  String get getReservation =>
      _localizedValues[locale.languageCode]?["reservation"] ?? "";

  String get getReservationDesc =>
      _localizedValues[locale.languageCode]?["reservation_desc"] ?? "";

  String get getLockOrUnlock =>
      _localizedValues[locale.languageCode]?["lock_unlock"] ?? "";

  String get getLockOrUnlockDesc =>
      _localizedValues[locale.languageCode]?["lock_unlock_desc"] ?? "";

  String get getReservationDirectory =>
      _localizedValues[locale.languageCode]?["reservation_directory"] ?? "";

  String get getReservationDirectoryDesc =>
      _localizedValues[locale.languageCode]?["reservation_directory_desc"] ??
      "";

  String get getViewDescription =>
      _localizedValues[locale.languageCode]?["view_description"] ?? "";

  String get getSkip => _localizedValues[locale.languageCode]?["skip"] ?? "";

  String get getGotIt => _localizedValues[locale.languageCode]?["got_it"] ?? "";

  String get getNotificationOffTitle =>
      _localizedValues[locale.languageCode]?["notification_off_title"] ?? "";

  String get getNotificationOffDesc =>
      _localizedValues[locale.languageCode]?["notification_off_desc"] ?? "";

  String get getBluetoothOffTitle =>
      _localizedValues[locale.languageCode]?["bluetooth_off_title"] ?? "";

  String get getBluetoothOffDesc =>
      _localizedValues[locale.languageCode]?["bluetooth_off_desc"] ?? "";

  String get getLocationOffTitle =>
      _localizedValues[locale.languageCode]?["location_off_title"] ?? "";

  String get getLocationOffDesc =>
      _localizedValues[locale.languageCode]?["location_off_desc"] ?? "";

  String get getNo => _localizedValues[locale.languageCode]?["no"] ?? "";

  String get getYes => _localizedValues[locale.languageCode]?["yes"] ?? "";

  String get getUserAgreement =>
      _localizedValues[locale.languageCode]?["user_agreement"] ?? "";

  String get getTermsAndConditionsTitle =>
      _localizedValues[locale.languageCode]?["terms_and_conditions_title"] ??
      "";

  String get getIAgreeTermsAndConditions =>
      _localizedValues[locale.languageCode]?["i_agree_terms_and_conditions"] ??
      "";

  String get getAllowLocation =>
      _localizedValues[locale.languageCode]?["allow_location"] ?? "";

  String get getAllowLocationDesc =>
      _localizedValues[locale.languageCode]?["allow_location_desc"] ?? "";

  String get getDoNotAllow =>
      _localizedValues[locale.languageCode]?["do_not_allow"] ?? "";

  String get getReserve =>
      _localizedValues[locale.languageCode]?["reserve"] ?? "";

  String get getReservationStartTime =>
      _localizedValues[locale.languageCode]?["reservation_start_time"] ?? "";

  String get getReservationEndTime =>
      _localizedValues[locale.languageCode]?["reservation_end_time"] ?? "";

  String get getReserveNow =>
      _localizedValues[locale.languageCode]?["reserve_now"] ?? "";

  String get getTipsAndUsefulFeatures =>
      _localizedValues[locale.languageCode]?["tips_and_useful_features"] ?? "";

  String get getTipsAndUsefulFeaturesDesc =>
      _localizedValues[locale.languageCode]?["tips_and_useful_features_desc"] ??
      "";

  String get getViewTips =>
      _localizedValues[locale.languageCode]?["view_tips"] ?? "";

  String get getHome => _localizedValues[locale.languageCode]?["home"] ?? "";

  String get getReservations =>
      _localizedValues[locale.languageCode]?["reservations"] ?? "";

  String get getMore => _localizedValues[locale.languageCode]?["more"] ?? "";

  String get getReserveForOneHour =>
      _localizedValues[locale.languageCode]?["reserve_for_one_hour"] ?? "";

  String get getReserveForTwoHour =>
      _localizedValues[locale.languageCode]?["reserve_for_two_hour"] ?? "";

  String get getReserveForThreeHour =>
      _localizedValues[locale.languageCode]?["reserve_for_three_hour"] ?? "";

  String get getReserveForFourHour =>
      _localizedValues[locale.languageCode]?["reserve_for_four_hour"] ?? "";

  String get getOngoingReservation =>
      _localizedValues[locale.languageCode]?["ongoing_reservation"] ?? "";

  String get getUpcomingReservation =>
      _localizedValues[locale.languageCode]?["upcoming_reservation"] ?? "";

  String get getPastReservation =>
      _localizedValues[locale.languageCode]?["past_reservation"] ?? "";

  String get getBookingId =>
      _localizedValues[locale.languageCode]?["booking_id"] ?? "";

  String get getRecommendedForYou =>
      _localizedValues[locale.languageCode]?["recommended_for_you"] ?? "";

  String get getYourReservationHasBeenConfirmed =>
      _localizedValues[locale.languageCode]
          ?["your_reservation_has_been_confirmed"] ??
      "";

  String get getLock => _localizedValues[locale.languageCode]?["lock"] ?? "";

  String get getUnlock =>
      _localizedValues[locale.languageCode]?["unlock"] ?? "";

  String get getParked =>
      _localizedValues[locale.languageCode]?["parked"] ?? "";

  String get getFuel => _localizedValues[locale.languageCode]?["fuel"] ?? "";

  String get getAway => _localizedValues[locale.languageCode]?["away"] ?? "";

  String get getDropOff =>
      _localizedValues[locale.languageCode]?["drop_off"] ?? "";

  String get getPickUp =>
      _localizedValues[locale.languageCode]?["pick_up"] ?? "";

  String get getFuelConsumption =>
      _localizedValues[locale.languageCode]?["fuel_consumption"] ?? "";

  String get getDistanceTravelled =>
      _localizedValues[locale.languageCode]?["distance_travelled"] ?? "";

  String get getCancelReservation =>
      _localizedValues[locale.languageCode]?["cancel_reservation"] ?? "";

  String get getReservationCancelTitle =>
      _localizedValues[locale.languageCode]?["reservation_cancel_title"] ?? "";

  String get getReservationCancelDesc =>
      _localizedValues[locale.languageCode]?["reservation_cancel_desc"] ?? "";

  String get getLogoutDesc =>
      _localizedValues[locale.languageCode]?["logout_desc"] ?? "";

  String get getChangePassword =>
      _localizedValues[locale.languageCode]?["change_password"] ?? "";

  String get getHelp =>
      _localizedValues[locale.languageCode]?["get_help"] ?? "";

  String get getSendFeedback =>
      _localizedValues[locale.languageCode]?["send_feedback"] ?? "";

  String get getDistanceMeterUnit =>
      _localizedValues[locale.languageCode]?["distance_m_unit"] ?? "";

  String get getDistanceKiloMeterUnit =>
      _localizedValues[locale.languageCode]?["distance_km_unit"] ?? "";

  String get getFuelConsumptionUnit =>
      _localizedValues[locale.languageCode]?["fuel_consumption_unit"] ?? "";

  String get getSubmit =>
      _localizedValues[locale.languageCode]?["submit"] ?? "";

  String get getForgotYourPassword =>
      _localizedValues[locale.languageCode]?["forgot_your_password"] ?? "";

  String get getResetYourPasswordHere =>
      _localizedValues[locale.languageCode]?["reset_your_password_here"] ?? "";

  String get getResetYourPassword =>
      _localizedValues[locale.languageCode]?["reset_your_password"] ?? "";

  String get getResend =>
      _localizedValues[locale.languageCode]?["resend"] ?? "";

  String get getEnterOtpYouReceived =>
      _localizedValues[locale.languageCode]?["enter_otp_you_received"] ?? "";

  String get getOtpResetInfo =>
      _localizedValues[locale.languageCode]?["otp_reset_info"] ?? "";

  String get getIncorrectOtp =>
      _localizedValues[locale.languageCode]?["incorrect_otp"] ?? "";

  String get getAddNewPassword =>
      _localizedValues[locale.languageCode]?["add_new_password"] ?? "";

  String get getEnterYourNewPassword =>
      _localizedValues[locale.languageCode]?["enter_your_new_password"] ?? "";

  String get getNewPassword =>
      _localizedValues[locale.languageCode]?["new_password"] ?? "";

  String get getConfirmNewPassword =>
      _localizedValues[locale.languageCode]?["confirm_new_password"] ?? "";

  String get getIncludeUpperCaseLetter =>
      _localizedValues[locale.languageCode]?["include_upper_case_letter"] ?? "";

  String get getIncludeNumeric =>
      _localizedValues[locale.languageCode]?["include_numeric"] ?? "";

  String get getIncludeSpecialSymbol =>
      _localizedValues[locale.languageCode]?["include_special_symbol"] ?? "";

  String get getSaveNewPassword =>
      _localizedValues[locale.languageCode]?["save_new_password"] ?? "";

  String get getChangeYourPassword =>
      _localizedValues[locale.languageCode]?["change_your_password"] ?? "";

  String get getInstructionToAddNewPassword =>
      _localizedValues[locale.languageCode]
          ?["instruction_to_add_new_password"] ??
      "";

  String get getBackToLogin =>
      _localizedValues[locale.languageCode]?["back_to_login"] ?? "";

  String get getPasswordResetSuccessfully =>
      _localizedValues[locale.languageCode]?["password_reset_successfully"] ??
      "";

  String get getYour => _localizedValues[locale.languageCode]?["your"] ?? "";

  String get getPasswordResetMessage =>
      _localizedValues[locale.languageCode]?["password_reset_message"] ?? "";

  String get getMachineLoan =>
      _localizedValues[locale.languageCode]?["get_machine_loan"] ?? "";
  String get getSolarLoan =>
      _localizedValues[locale.languageCode]?["get_solar_loan"] ?? "";
  String get getBusinessLoan =>
      _localizedValues[locale.languageCode]?["get_business_loan"] ?? "";
  // String get getVehicleLoan => _localizedValues[locale.languageCode]?["get_vehicle_loan"] ?? "";
  String get getContinue =>
      _localizedValues[locale.languageCode]?["continue"] ?? "";
  String get getOR => _localizedValues[locale.languageCode]?["or"] ?? "";
  String get getLoginUsing =>
      _localizedValues[locale.languageCode]?["login_using"] ?? "";
  String get getEnterPhoneNumber =>
      _localizedValues[locale.languageCode]?["enter_phone_number"] ?? "";
  String get getDoNotHaveAccount =>
      _localizedValues[locale.languageCode]?["do_not_have_an_account"] ?? "";
  String get getLogInAsGuest =>
      _localizedValues[locale.languageCode]?["log_in_as_guest"] ?? "";
  String get getLogInUsingEmail =>
      _localizedValues[locale.languageCode]?["log_in_using_email"] ?? "";
  String get getLogInAsEmp =>
      _localizedValues[locale.languageCode]?["log_in_as_emp"] ?? "";
  String get getLoansDetails =>
      _localizedValues[locale.languageCode]?["loans_details"] ?? "";
  String get getLoanAgainstProperty =>
      _localizedValues[locale.languageCode]?["loan_against_property"] ?? "";
  String get getLoanID =>
      _localizedValues[locale.languageCode]?["loan_id"] ?? "";
  String get getUtilisedAmount =>
      _localizedValues[locale.languageCode]?["utilised_amount"] ?? "";
  String get getAvailableLimit =>
      _localizedValues[locale.languageCode]?["available_limit"] ?? "";
  String get getRepaymentTenure =>
      _localizedValues[locale.languageCode]?["repayment_tenure"] ?? "";
  String get getAnnualisedRateOfInterest =>
      _localizedValues[locale.languageCode]?["annualised_rate_of_interest"] ??
      "";
  String get getLoanAmount =>
      _localizedValues[locale.languageCode]?["loan_amount"] ?? "";
  String get getNextDueEMIAmount =>
      _localizedValues[locale.languageCode]?["next_due_eMI_Amount"] ?? "";
  String get getPayEMI =>
      _localizedValues[locale.languageCode]?["pay_eMI"] ?? "";
  String get getPay => _localizedValues[locale.languageCode]?["pay"] ?? "";
  String get getEMIDetails =>
      _localizedValues[locale.languageCode]?["emi_details"] ?? "";
  String get getSelect =>
      _localizedValues[locale.languageCode]?["select"] ?? "";
  String get getMonth => _localizedValues[locale.languageCode]?["month"] ?? "";
  String get getEMIAmount =>
      _localizedValues[locale.languageCode]?["emi_amount"] ?? "";
  String get getSelectedEMI =>
      _localizedValues[locale.languageCode]?["selected_emi"] ?? "";
  String get getStatus =>
      _localizedValues[locale.languageCode]?["status"] ?? "";
  String get getClosed =>
      _localizedValues[locale.languageCode]?["closed"] ?? "";
  String get getLoanDate =>
      _localizedValues[locale.languageCode]?["loan_date"] ?? "";
  String get getDuration =>
      _localizedValues[locale.languageCode]?["duration"] ?? "";
  String get getThingsYouCanDo =>
      _localizedValues[locale.languageCode]?["things_you_can_do"] ?? "";
  String get getViewDocument =>
      _localizedValues[locale.languageCode]?["view_document"] ?? "";
  String get getLoanDetails =>
      _localizedValues[locale.languageCode]?["loan_details"] ?? "";
  String get getBankDetails =>
      _localizedValues[locale.languageCode]?["bank_details"] ?? "";
  String get getFeeCharges =>
      _localizedValues[locale.languageCode]?["fee_charges"] ?? "";
  String get getEmIStartDate =>
      _localizedValues[locale.languageCode]?["eMI_start_date"] ?? "";
  String get getEmIEndDate =>
      _localizedValues[locale.languageCode]?["emi_end_date"] ?? "";
  String get getNumberOfEmIPaid =>
      _localizedValues[locale.languageCode]?["number_of_emi_paid"] ?? "";
  String get getPreviousEMIAmount =>
      _localizedValues[locale.languageCode]?["previous_eMI_amount"] ?? "";
  String get getLoanAmountPaidTillDate =>
      _localizedValues[locale.languageCode]?["loan_amount_paid_till_date"] ??
      "";
  String get getDisbursementDate =>
      _localizedValues[locale.languageCode]?["disbursement_date"] ?? "";
  String get getBankName =>
      _localizedValues[locale.languageCode]?["bank_name"] ?? "";
  String get getBankAccountNumber =>
      _localizedValues[locale.languageCode]?["bank_account_number"] ?? "";
  String get getBankIFSC =>
      _localizedValues[locale.languageCode]?["bank_IFSC"] ?? "";
  String get getAppliedDate =>
      _localizedValues[locale.languageCode]?["applied_date"] ?? "";
  String get getLoanTenure =>
      _localizedValues[locale.languageCode]?["loan_tenure"] ?? "";
  String get getFollowUp =>
      _localizedValues[locale.languageCode]?["follow_up"] ?? "";
  String get getAdhaarCard =>
      _localizedValues[locale.languageCode]?["adhaar_card"] ?? "";
  String get getAdhaarCardInfo =>
      _localizedValues[locale.languageCode]?["adhaar_info"] ?? "";
  String get getPanCardInfo =>
      _localizedValues[locale.languageCode]?["pan_info"] ?? "";
  String get getPANCard =>
      _localizedValues[locale.languageCode]?["pan_card"] ?? "";
  String get getAddressProof =>
      _localizedValues[locale.languageCode]?["address_proof"] ?? "";
  String get getAddressProofInfo =>
      _localizedValues[locale.languageCode]?["address_info"] ?? "";
  String get getUploadAnyProof =>
      _localizedValues[locale.languageCode]?["upload_any_proof"] ?? "";
  String get getAddAnotherDocument =>
      _localizedValues[locale.languageCode]?["add_another_doc"] ?? "";
  String get getDocument =>
      _localizedValues[locale.languageCode]?["documents"] ?? "";
  String get getDocumentInfo =>
      _localizedValues[locale.languageCode]?["documents_info_for_close_loan"] ??
      "";
  String get getPhoneNumber =>
      _localizedValues[locale.languageCode]?["phone_number"] ?? "";
  String get getDOB => _localizedValues[locale.languageCode]?["dob"] ?? "";
  String get getSavedAddress =>
      _localizedValues[locale.languageCode]?["saved_address"] ?? "";
  String get getSave => _localizedValues[locale.languageCode]?["save"] ?? "";
  String get getHelpUs =>
      _localizedValues[locale.languageCode]?["help_us"] ?? "";
  String get getFAQ => _localizedValues[locale.languageCode]?["faq"] ?? "";
  String get getAddSecondaryNumber =>
      _localizedValues[locale.languageCode]?["add_sec_num"] ?? "";
  String get getAddAdditionalNumber =>
      _localizedValues[locale.languageCode]?["add_additional_num"] ?? "";
  String get getAddAdditionalEmail =>
      _localizedValues[locale.languageCode]?["add_additional_email"] ?? "";
  String get getAddSecondaryEmail =>
      _localizedValues[locale.languageCode]?["add_sec_email"] ?? "";
  String get getAddDetails =>
      _localizedValues[locale.languageCode]?["add_details"] ?? "";
  String get getLogOut =>
      _localizedValues[locale.languageCode]?["log_out"] ?? "";
  String get getLOGOUT =>
      _localizedValues[locale.languageCode]?["LOG_OUT"] ?? "";
  String get getContactUs =>
      _localizedValues[locale.languageCode]?["contact_us"] ?? "";
  String get getAboutUs =>
      _localizedValues[locale.languageCode]?["about_us"] ?? "";
  String get getPrivacyPolicy =>
      _localizedValues[locale.languageCode]?["privacy_policies"] ?? "";
  String get getTermCondition =>
      _localizedValues[locale.languageCode]?["term_and_condition"] ?? "";
  String get getReportQuery =>
      _localizedValues[locale.languageCode]?["report_query"] ?? "";
  String get getLocationNotification =>
      _localizedValues[locale.languageCode]?["location_and_notification"] ?? "";
  String get getLocationService =>
      _localizedValues[locale.languageCode]?["location_services"] ?? "";
  String get getManageNotifications =>
      _localizedValues[locale.languageCode]?["manage_notification"] ?? "";
  String get getHelplineNumbers =>
      _localizedValues[locale.languageCode]?["helpline_numbers"] ?? "";
  String get getConfirmLogOut =>
      _localizedValues[locale.languageCode]?["confirmation_logout"] ?? "";
  String get getLocateNearBy =>
      _localizedValues[locale.languageCode]?["locate_nearby"] ?? "";
  String get getNachMandate =>
      _localizedValues[locale.languageCode]?["nach_mandate"] ?? "";
  String get getDate => _localizedValues[locale.languageCode]?["date"] ?? "";
  String get getViewDetail =>
      _localizedValues[locale.languageCode]?["view_detail"] ?? "";
  String get getUpdateNACH =>
      _localizedValues[locale.languageCode]?["update_NACH"] ?? "";
  String get getLoanAccountNumber =>
      _localizedValues[locale.languageCode]?["loan_account_number"] ?? "";
  String get getVerifyYourEmail =>
      _localizedValues[locale.languageCode]?["verify_email"] ?? "";
  String get getChangeEmailId =>
      _localizedValues[locale.languageCode]?["change_email_id"] ?? "";
  String get getDidNotReceiveCode =>
      _localizedValues[locale.languageCode]?["did_not_receive_code"] ?? "";
  String get getVerify =>
      _localizedValues[locale.languageCode]?["verify"] ?? "";
  String get getChangeNumber =>
      _localizedValues[locale.languageCode]?["change_number"] ?? "";
  String get getMobileNumber =>
      _localizedValues[locale.languageCode]?["mobile_number"] ?? "";
  String get getVerifyYourNumber =>
      _localizedValues[locale.languageCode]?["verify_number"] ?? "";
  String get getLoginUsingNumber =>
      _localizedValues[locale.languageCode]?["login_using_number"] ?? "";
  String get getForgotPassHint =>
      _localizedValues[locale.languageCode]?["forgot_pass_hint"] ?? "";
  String get getEnterMobileOrEmail =>
      _localizedValues[locale.languageCode]?["enter_mobile_or_email"] ?? "";
  String get getOtpSentOnMobile =>
      _localizedValues[locale.languageCode]?["otp_sent_on_mobile"] ?? "";
  String get getEnterOtp =>
      _localizedValues[locale.languageCode]?["enter_otp"] ?? "";
  String get getCreateAcc =>
      _localizedValues[locale.languageCode]?["create_acc"] ?? "";
  String get getCreateAccHint =>
      _localizedValues[locale.languageCode]?["create_acc_hint"] ?? "";
  String get getExistingLoan =>
      _localizedValues[locale.languageCode]?["existing_loan"] ?? "";
  String get getAppliedLoan =>
      _localizedValues[locale.languageCode]?["applied_loan"] ?? "";
  String get getClosedLoan =>
      _localizedValues[locale.languageCode]?["closed_loan"] ?? "";
  String get getOthers =>
      _localizedValues[locale.languageCode]?["others"] ?? "";
  String get getOverdueAmount =>
      _localizedValues[locale.languageCode]?["overdue_amount"] ?? "";
  String get getMakePayment =>
      _localizedValues[locale.languageCode]?["make_payment"] ?? "";
  String get getGoToLoanDetails =>
      _localizedValues[locale.languageCode]?["go_to_loan_details"] ?? "";
  String get getPartPrePayment =>
      _localizedValues[locale.languageCode]?["part_pre_payment"] ?? "";
  String get getPartPrePaymentContent =>
      _localizedValues[locale.languageCode]?["part_pre_payment_content"] ?? "";
  String get getAdvanceEmi =>
      _localizedValues[locale.languageCode]?["advance_eMI"] ?? "";
  String get getAdvanceEmiContent =>
      _localizedValues[locale.languageCode]?["advance_eMI_content"] ?? "";
  String get getFullPayment =>
      _localizedValues[locale.languageCode]?["full_payment"] ?? "";
  String get getFullPaymentContent =>
      _localizedValues[locale.languageCode]?["full_payment_content"] ?? "";
  String get getSelectTheTypeAccNum =>
      _localizedValues[locale.languageCode]?["select_the_type_acc_num"] ?? "";
  String get getLoanClosureDate =>
      _localizedValues[locale.languageCode]?["loan_closure_date"] ?? "";
  String get getCurrentBankNachDetails =>
      _localizedValues[locale.languageCode]?["current_bank_nach_Details"] ?? "";
  String get getMaxEmiAvailable =>
      _localizedValues[locale.languageCode]?["max_emi_available"] ?? "";
  String get getUpdateNewNach =>
      _localizedValues[locale.languageCode]?["update_new_nach"] ?? "";
  String get getThankYou =>
      _localizedValues[locale.languageCode]?["thank_you"] ?? "";
  String get getYouDidIt =>
      _localizedValues[locale.languageCode]?["you_did_it"] ?? "";
  String get getUnderReview =>
      _localizedValues[locale.languageCode]?["under_review"] ?? "";
  String get getNachUpdateThanksQuote =>
      _localizedValues[locale.languageCode]?["nach_update_thank_quote"] ?? "";

  String get getValidPhoneNumberError =>
      _localizedValues[locale.languageCode]!['valid_phone_no_error'] ??
      StringConstants.empty;

  String get getMobileNumberReq =>
      _localizedValues[locale.languageCode]!['mobile_number_req'] ??
      StringConstants.empty;
  String get getEmailEmptyErr =>
      _localizedValues[locale.languageCode]!['email_empty_err'] ??
      StringConstants.empty;
  String get getEmailValidErr =>
      _localizedValues[locale.languageCode]!['email_valid_err'] ??
      StringConstants.empty;
  String get getValidOtp =>
      _localizedValues[locale.languageCode]!['valid_otp'] ??
      StringConstants.empty;
  String get getEnterEmailIDPass =>
      _localizedValues[locale.languageCode]!['please_enter_email_pass'] ??
      StringConstants.empty;
  String get getEnterEmailID =>
      _localizedValues[locale.languageCode]!['please_enter_email'] ??
      StringConstants.empty;
  String get getEnterPass =>
      _localizedValues[locale.languageCode]!['please_enter_pass'] ??
      StringConstants.empty;
  String get getEnterValidPass =>
      _localizedValues[locale.languageCode]!['please_enter_valid_pass'] ??
      StringConstants.empty;
  String get getEnterNewPass =>
      _localizedValues[locale.languageCode]!['please_enter_new_pass'] ??
      StringConstants.empty;
  String get getEnterConfirmPass =>
      _localizedValues[locale.languageCode]!['please_enter_confirm_pass'] ??
      StringConstants.empty;
  String get getDoesNotMatchPass =>
      _localizedValues[locale.languageCode]!['does_not_match_pass'] ??
      StringConstants.empty;

  String get getName =>
      _localizedValues[locale.languageCode]!['name'] ?? StringConstants.empty;

  String get getEnterName =>
      _localizedValues[locale.languageCode]!['enter_name'] ??
      StringConstants.empty;

  String get getEmailId =>
      _localizedValues[locale.languageCode]!['email_id'] ??
      StringConstants.empty;

  String get getEnterEmailId =>
      _localizedValues[locale.languageCode]!['enter_email_id'] ??
      StringConstants.empty;

  String get getPrimaryEmailId =>
      _localizedValues[locale.languageCode]!['primary_email_id'] ??
      StringConstants.empty;

  String get getCreatePassword =>
      _localizedValues[locale.languageCode]!['create_password'] ??
      StringConstants.empty;

  String get getApply =>
      _localizedValues[locale.languageCode]!['apply'] ?? StringConstants.empty;

  String get getDeleteAccount =>
      _localizedValues[locale.languageCode]!['delete_account'] ??
      StringConstants.empty;

  String get getConfirmationDeleteAccount =>
      _localizedValues[locale.languageCode]!['confirmation_delete_account'] ??
      StringConstants.empty;

  String get getProfileIncomplete =>
      _localizedValues[locale.languageCode]!['profile_incomplete'] ??
      StringConstants.empty;

  String get getProfileIncompleteWarningText =>
      _localizedValues[locale.languageCode]![
          'profile_incomplete_warning_text'] ??
      StringConstants.empty;

  String get getThanksDescription =>
      _localizedValues[locale.languageCode]!['thanks_description'] ??
      StringConstants.empty;

  String get getStatementOfAcc =>
      _localizedValues[locale.languageCode]!['statement_of_acc'] ??
      StringConstants.empty;

  String get getRepaymentSchedule =>
      _localizedValues[locale.languageCode]!['repayment_schedule'] ??
      StringConstants.empty;

  String get getInterestCertificate =>
      _localizedValues[locale.languageCode]!['interest_certificate'] ??
      StringConstants.empty;

  String get getMakePaymentInfo =>
      _localizedValues[locale.languageCode]!['make_payment_info'] ??
      StringConstants.empty;

  String get getActiveLoans =>
      _localizedValues[locale.languageCode]!['active_loans'] ??
      StringConstants.empty;

  String get getEnterMobile =>
      _localizedValues[locale.languageCode]!['enter_mobile'] ??
      StringConstants.empty;

  String get getNoLoanText =>
      _localizedValues[locale.languageCode]!['no_loan_text'] ??
      StringConstants.empty;

  String get getNoLoanDesText =>
      _localizedValues[locale.languageCode]!['no_loan_des_text'] ??
      StringConstants.empty;

  String get getSelectLoanAmount =>
      _localizedValues[locale.languageCode]!['select_loan_amount'] ??
      StringConstants.empty;

  String get getEnterTheLoanAmount =>
      _localizedValues[locale.languageCode]!['please_enter_the_loan_amount'] ??
      StringConstants.empty;

  String get getSelectTenure =>
      _localizedValues[locale.languageCode]!['select_tenure'] ??
      StringConstants.empty;

  String get getViewAll =>
      _localizedValues[locale.languageCode]!['view_all'] ??
      StringConstants.empty;

  String get getGetStarted =>
      _localizedValues[locale.languageCode]!['get_started'] ??
      StringConstants.empty;

  String get getHelpUsContent =>
      _localizedValues[locale.languageCode]!['help_us_content'] ??
      StringConstants.empty;

  String get getNewPurchase =>
      _localizedValues[locale.languageCode]!['new_purchase'] ??
      StringConstants.empty;

  String get getRefinance =>
      _localizedValues[locale.languageCode]!['refinance'] ??
      StringConstants.empty;

  String get getSecuredLoan =>
      _localizedValues[locale.languageCode]!['secured_loan'] ??
      StringConstants.empty;

  String get getUnSecuredLoan =>
      _localizedValues[locale.languageCode]!['unsecured_loan'] ??
      StringConstants.empty;

  String get getLIC =>
      _localizedValues[locale.languageCode]!['lic'] ?? StringConstants.empty;

  String get getVehicle =>
      _localizedValues[locale.languageCode]!['vehicle'] ??
      StringConstants.empty;

  String get getMachine =>
      _localizedValues[locale.languageCode]!['machine'] ??
      StringConstants.empty;

  String get getEnterApplicantDetails =>
      _localizedValues[locale.languageCode]!['enter_applicant_details'] ??
      StringConstants.empty;

  String get getPanDetails =>
      _localizedValues[locale.languageCode]!['pan_details'] ??
      StringConstants.empty;

  String get getAadhaarDetails =>
      _localizedValues[locale.languageCode]!['aadhaar_details'] ??
      StringConstants.empty;

  String get getAddress =>
      _localizedValues[locale.languageCode]!['address'] ??
      StringConstants.empty;

  String get getEnterYourDetails =>
      _localizedValues[locale.languageCode]!['enter_your_details'] ??
      StringConstants.empty;

  String get getYouJustNeedToEnterAdhaar =>
      _localizedValues[locale.languageCode]!['just_need_to_enter_adhaar'] ??
      StringConstants.empty;

  String get getPan =>
      _localizedValues[locale.languageCode]!['pan'] ?? StringConstants.empty;

  String get getEnterPan =>
      _localizedValues[locale.languageCode]!['enter_pan'] ??
      StringConstants.empty;

  String get getAadhaar =>
      _localizedValues[locale.languageCode]!['aadhaar'] ??
      StringConstants.empty;

  String get getGender =>
      _localizedValues[locale.languageCode]!['gender'] ?? StringConstants.empty;

  String get getFatherName =>
      _localizedValues[locale.languageCode]!['father_name'] ??
      StringConstants.empty;

  String get getEnterAadhaar =>
      _localizedValues[locale.languageCode]!['enter_aadhaar'] ??
      StringConstants.empty;

  String get getEnterYourAddress =>
      _localizedValues[locale.languageCode]!['enter_your_address'] ??
      StringConstants.empty;

  String get getAddressLine =>
      _localizedValues[locale.languageCode]!['address_line'] ??
      StringConstants.empty;

  String get getState =>
      _localizedValues[locale.languageCode]!['state'] ?? StringConstants.empty;

  String get getDistrict =>
      _localizedValues[locale.languageCode]!['district'] ??
      StringConstants.empty;

  String get getResidentialStatus =>
      _localizedValues[locale.languageCode]!['residential_status'] ??
      StringConstants.empty;

  String get getCity =>
      _localizedValues[locale.languageCode]!['city'] ?? StringConstants.empty;

  String get getEnterAddress =>
      _localizedValues[locale.languageCode]!['enter_address'] ??
      StringConstants.empty;

  String get getUploadAddressProof =>
      _localizedValues[locale.languageCode]!['upload_address_proof'] ??
      StringConstants.empty;

  String get getUpload =>
      _localizedValues[locale.languageCode]!['upload'] ?? StringConstants.empty;

  String get getSelectGender =>
      _localizedValues[locale.languageCode]!['select_gender'] ??
      StringConstants.empty;

  String get getSelectState =>
      _localizedValues[locale.languageCode]!['select_state'] ??
      StringConstants.empty;

  String get getSelectDistrict =>
      _localizedValues[locale.languageCode]!['select_district'] ??
      StringConstants.empty;

  String get getSelectCity =>
      _localizedValues[locale.languageCode]!['select_city'] ??
      StringConstants.empty;

  String get getSelectResidentialStatus =>
      _localizedValues[locale.languageCode]!['select_residential_status'] ??
      StringConstants.empty;
  String get getSelfEmployed =>
      _localizedValues[locale.languageCode]!['self_employed'] ??
      StringConstants.empty;

  String get getSelfEmpContent =>
      _localizedValues[locale.languageCode]!['self_employed_content'] ??
      StringConstants.empty;

  String get getSalariedContent =>
      _localizedValues[locale.languageCode]!['salaried_content'] ??
      StringConstants.empty;

  String get getHey =>
      _localizedValues[locale.languageCode]!['hey'] ?? StringConstants.empty;
  String get getSalaried =>
      _localizedValues[locale.languageCode]!['salaried'] ??
      StringConstants.empty;
  String get getDone =>
      _localizedValues[locale.languageCode]!['done'] ?? StringConstants.empty;
  String get getAdhaarNumber =>
      _localizedValues[locale.languageCode]!['adhaar_number'] ??
      StringConstants.empty;
  String get getPanAccNum =>
      _localizedValues[locale.languageCode]!['pan_acc_num'] ??
      StringConstants.empty;
  String get getPanAccNumHint =>
      _localizedValues[locale.languageCode]!['pan_acc_num_hint'] ??
      StringConstants.empty;
  String get getAdhaarNumberHintText =>
      _localizedValues[locale.languageCode]!['adhaar_hint'] ??
      StringConstants.empty;
  String get getLAPCollateralDetails =>
      _localizedValues[locale.languageCode]!['lap_collateral_details'] ??
      StringConstants.empty;

  String get getDateOfIncorporation =>
      _localizedValues[locale.languageCode]!['date_of_incorporation'] ??
      StringConstants.empty;

  String get getEntityName =>
      _localizedValues[locale.languageCode]!['entity_name'] ??
      StringConstants.empty;

  String get getEnterCoApplicantDetails =>
      _localizedValues[locale.languageCode]!['enter_co_applicant_details'] ??
      StringConstants.empty;

  String get getEnterCoApplicantDetailsText =>
      _localizedValues[locale.languageCode]![
          'enter_co_applicant_details_text'] ??
      StringConstants.empty;

  String get getCoApplicants =>
      _localizedValues[locale.languageCode]!['co_applicants'] ??
      StringConstants.empty;

  String get getListOfCoApplicants =>
      _localizedValues[locale.languageCode]!['list_of_co_applicants'] ??
      StringConstants.empty;

  String get getAddCoApplicants =>
      _localizedValues[locale.languageCode]!['add_co_applicants'] ??
      StringConstants.empty;

  String get getEdit =>
      _localizedValues[locale.languageCode]!['edit'] ?? StringConstants.empty;

  String get getDelete =>
      _localizedValues[locale.languageCode]!['delete'] ?? StringConstants.empty;

  String get getConfirmationDeleteCoApplicant =>
      _localizedValues[locale.languageCode]![
          'confirmation_delete_co_applicant'] ??
      StringConstants.empty;

  String get getConfirmationDeleteGuarantor =>
      _localizedValues[locale.languageCode]!['confirmation_delete_guarantor'] ??
      StringConstants.empty;

  String get getEnterGuarantorDetails =>
      _localizedValues[locale.languageCode]!['enter_guarantor_details'] ??
      StringConstants.empty;

  String get getEnterGuarantorDetailsText =>
      _localizedValues[locale.languageCode]!['enter_guarantor_details_text'] ??
      StringConstants.empty;

  String get getGuarantor =>
      _localizedValues[locale.languageCode]!['guarantor'] ??
      StringConstants.empty;

  String get getListOfGuarantor =>
      _localizedValues[locale.languageCode]!['list_of_guarantor'] ??
      StringConstants.empty;

  String get getEnterCollateralDetailsText =>
      _localizedValues[locale.languageCode]!['enter_collateral_details_text'] ??
      StringConstants.empty;

  String get getPropertyType =>
      _localizedValues[locale.languageCode]!['property_type'] ??
      StringConstants.empty;

  String get getBack =>
      _localizedValues[locale.languageCode]!['back'] ?? StringConstants.empty;

  String get getCategory =>
      _localizedValues[locale.languageCode]!['category'] ??
      StringConstants.empty;

  String get getTypeDescription =>
      _localizedValues[locale.languageCode]!['type_description'] ??
      StringConstants.empty;

  String get getMax300Words =>
      _localizedValues[locale.languageCode]!['max_300_words'] ??
      StringConstants.empty;

  String get getCreditScore =>
      _localizedValues[locale.languageCode]!['credit_score'] ??
      StringConstants.empty;

  String get getRented =>
      _localizedValues[locale.languageCode]!['rented'] ?? StringConstants.empty;

  String get getOwned =>
      _localizedValues[locale.languageCode]!['owned'] ?? StringConstants.empty;

  String get getPropertyValue =>
      _localizedValues[locale.languageCode]!['property_value'] ??
      StringConstants.empty;

  String get getPropertyArea =>
      _localizedValues[locale.languageCode]!['area_of_property'] ??
      StringConstants.empty;

  String get getUploadPropertyPictures =>
      _localizedValues[locale.languageCode]!['upload_property_pics'] ??
      StringConstants.empty;

  String get getPropertyAddress =>
      _localizedValues[locale.languageCode]!['property_address'] ??
      StringConstants.empty;

  String get getCommercial =>
      _localizedValues[locale.languageCode]!['commercial'] ??
      StringConstants.empty;

  String get getResidential =>
      _localizedValues[locale.languageCode]!['residential'] ??
      StringConstants.empty;

  String get getIndustrial =>
      _localizedValues[locale.languageCode]!['industrial'] ??
      StringConstants.empty;

  String get getNew =>
      _localizedValues[locale.languageCode]!['new'] ?? StringConstants.empty;

  String get getPermanent =>
      _localizedValues[locale.languageCode]!['permanent'] ??
      StringConstants.empty;

  String get getPresent =>
      _localizedValues[locale.languageCode]!['present'] ??
      StringConstants.empty;

  String get getEnterNewAddress =>
      _localizedValues[locale.languageCode]!['enter_new_add'] ??
      StringConstants.empty;

  String get getCollateralDetails =>
      _localizedValues[locale.languageCode]!['collateral_details'] ??
      StringConstants.empty;

  String get getCollateralTypes =>
      _localizedValues[locale.languageCode]!['collateral_type'] ??
      StringConstants.empty;

  String get getPropertyLap =>
      _localizedValues[locale.languageCode]!['property_lap'] ??
      StringConstants.empty;

  String get getAddAnotherCollateral =>
      _localizedValues[locale.languageCode]!['add_another_collateral'] ??
      StringConstants.empty;

  String get getAddBankAcc =>
      _localizedValues[locale.languageCode]!['add_bank_account'] ??
      StringConstants.empty;

  String get getBackToHome =>
      _localizedValues[locale.languageCode]!['back_to_home'] ??
      StringConstants.empty;

  String get getEligibleAmount =>
      _localizedValues[locale.languageCode]!['eligible_amount'] ??
      StringConstants.empty;

  String get getApplyForEligibleLoanAmount =>
      _localizedValues[locale.languageCode]!['apply_for_eligible_loan'] ??
      StringConstants.empty;

  String get getOrApplyForAmount =>
      _localizedValues[locale.languageCode]!['or_apply_for_amount'] ??
      StringConstants.empty;

  String get getChooseAnOption =>
      _localizedValues[locale.languageCode]!['choose_an_option'] ??
      StringConstants.empty;

  String get getNewLoanApplication =>
      _localizedValues[locale.languageCode]!['new_loan_application'] ??
      StringConstants.empty;

  String get getLoanApplicationId =>
      _localizedValues[locale.languageCode]!['loan_application_id'] ??
      StringConstants.empty;

  String get getYourLoanApplicationIsUnderReview =>
      _localizedValues[locale.languageCode]![
          'loan_application_is_under_review'] ??
      StringConstants.empty;

  String get getLoanApplicationApproved =>
      _localizedValues[locale.languageCode]!['loan_application_is_approved'] ??
      StringConstants.empty;

  String get getYouAreEligible =>
      _localizedValues[locale.languageCode]!['you_are_eligible'] ??
      StringConstants.empty;

  String get getCongratulation =>
      _localizedValues[locale.languageCode]!['congratulation'] ??
      StringConstants.empty;

  String get getIsMachineAvailable =>
      _localizedValues[locale.languageCode]!['is_machine_available'] ??
      StringConstants.empty;

  String get getSelectYourOccupation =>
      _localizedValues[locale.languageCode]!['select_your_occupation'] ??
      StringConstants.empty;

  String get getOccupation =>
      _localizedValues[locale.languageCode]!['occupation'] ??
      StringConstants.empty;

  String get getIAgreeToConsent =>
      _localizedValues[locale.languageCode]!['i_agree_to_consent_on'] ??
      StringConstants.empty;

  String get getAnd =>
      _localizedValues[locale.languageCode]!['and'] ?? StringConstants.empty;
  String get getRequireNOC =>
      _localizedValues[locale.languageCode]!['require_noc'] ??
      StringConstants.empty;
  String get getRequireNDC =>
      _localizedValues[locale.languageCode]!['require_ndc'] ??
      StringConstants.empty;
  String get getShortClosureCalculation =>
      _localizedValues[locale.languageCode]!['short_closure_calculation'] ??
      StringConstants.empty;
  String get getRegularClosureCalculation =>
      _localizedValues[locale.languageCode]!['regular_closure_calculation'] ??
      StringConstants.empty;
  String get getSOAOrIRROrIPC =>
      _localizedValues[locale.languageCode]!['SOA/IRR/IPC'] ??
      StringConstants.empty;
  String get getRefund =>
      _localizedValues[locale.languageCode]!['refund'] ?? StringConstants.empty;
  String get getGeneralQuery =>
      _localizedValues[locale.languageCode]!['general_query'] ??
      StringConstants.empty;
  String get getOriginal =>
      _localizedValues[locale.languageCode]!['original'] ??
      StringConstants.empty;
  String get getDuplicate =>
      _localizedValues[locale.languageCode]!['duplicate'] ??
      StringConstants.empty;
  String get getTDSRefund =>
      _localizedValues[locale.languageCode]!['tds_refund'] ??
      StringConstants.empty;
  String get getEMIExcessRefund =>
      _localizedValues[locale.languageCode]!['EMI_excess_refund'] ??
      StringConstants.empty;
  String get getClosureRefund =>
      _localizedValues[locale.languageCode]!['closure_refund'] ??
      StringConstants.empty;
  String get getOtherRefund =>
      _localizedValues[locale.languageCode]!['other_refund'] ??
      StringConstants.empty;
  String get getSanctionLetterRequire =>
      _localizedValues[locale.languageCode]!['sanction_letter_require'] ??
      StringConstants.empty;
  String get getOutstandingRequire =>
      _localizedValues[locale.languageCode]!['outstanding_require'] ??
      StringConstants.empty;
  String get getTrackRecordRequire =>
      _localizedValues[locale.languageCode]!['track_record_require'] ??
      StringConstants.empty;
  String get getYourLoanUnderReviewBeSureTeamWillBack =>
      _localizedValues[locale.languageCode]![
          'your_loan_under_review_be_sure_team_will_back'] ??
      StringConstants.empty;
  String get getBeWithUs =>
      _localizedValues[locale.languageCode]!['be_with_us'] ??
      StringConstants.empty;
  String get getHeyThere =>
      _localizedValues[locale.languageCode]!['hey_there'] ??
      StringConstants.empty;
}
