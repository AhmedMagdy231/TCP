// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To TriCare`
  String get welcomeToTricare {
    return Intl.message(
      'Welcome To TriCare',
      name: 'welcomeToTricare',
      desc: '',
      args: [],
    );
  }

  /// `Specialties`
  String get specialties {
    return Intl.message(
      'Specialties',
      name: 'specialties',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Top Doctors`
  String get topDoctor {
    return Intl.message(
      'Top Doctors',
      name: 'topDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Search doctors or clinics ...`
  String get searchAtDoctorOrClinic {
    return Intl.message(
      'Search doctors or clinics ...',
      name: 'searchAtDoctorOrClinic',
      desc: '',
      args: [],
    );
  }

  /// `Do you need health care?`
  String get yourHealthIsGoodWithTricare {
    return Intl.message(
      'Do you need health care?',
      name: 'yourHealthIsGoodWithTricare',
      desc: '',
      args: [],
    );
  }

  /// `My Sessions`
  String get book {
    return Intl.message(
      'My Sessions',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Book appointment`
  String get bookAnAppointment {
    return Intl.message(
      'Book appointment',
      name: 'bookAnAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Similar Articles`
  String get similarArticles {
    return Intl.message(
      'Similar Articles',
      name: 'similarArticles',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry! It happens. Please enter registered email address to receive reset code.`
  String get doNotTWorryItHappensPleaseEnterThePhone {
    return Intl.message(
      'Don\'t worry! It happens. Please enter registered email address to receive reset code.',
      name: 'doNotTWorryItHappensPleaseEnterThePhone',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Welcome again to TriCare`
  String get welcomeAgainToTricare {
    return Intl.message(
      'Welcome again to TriCare',
      name: 'welcomeAgainToTricare',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue using the app`
  String get loginToContinueUsingTheApp {
    return Intl.message(
      'Login to continue using the app',
      name: 'loginToContinueUsingTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account?`
  String get doNotHaveAnAccount {
    return Intl.message(
      'Do not have an account?',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Or Login with`
  String get orLoginWith {
    return Intl.message(
      'Or Login with',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code sent to your email address`
  String get enterTheVerificationCodeWeJustSentOnYourEmail {
    return Intl.message(
      'Enter verification code sent to your email address',
      name: 'enterTheVerificationCodeWeJustSentOnYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Code expires in`
  String get codeExpireIn {
    return Intl.message(
      'Code expires in',
      name: 'codeExpireIn',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get doNotReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'doNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get enterYourPersonalInformation {
    return Intl.message(
      'Personal Information',
      name: 'enterYourPersonalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get haveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please set password to your account`
  String get pleaseSetPasswordToYourAccount {
    return Intl.message(
      'Please set password to your account',
      name: 'pleaseSetPasswordToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get booking {
    return Intl.message(
      'Bookings',
      name: 'booking',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any booked appointments`
  String get youDoNotHaveAnyBookAppointment {
    return Intl.message(
      'You don\'t have any booked appointments',
      name: 'youDoNotHaveAnyBookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any booked appointments yet`
  String get youDoNotHaveAnyBookAppointmentYet {
    return Intl.message(
      'You don\'t have any booked appointments yet',
      name: 'youDoNotHaveAnyBookAppointmentYet',
      desc: '',
      args: [],
    );
  }

  /// `Empty Data in This screen`
  String get emptyDataInThisScreen {
    return Intl.message(
      'Empty Data in This screen',
      name: 'emptyDataInThisScreen',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Directions`
  String get map {
    return Intl.message(
      'Directions',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Favourite Doctors`
  String get favourite {
    return Intl.message(
      'Favourite Doctors',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Empty Favourite Doctors`
  String get emptyFavourite {
    return Intl.message(
      'Empty Favourite Doctors',
      name: 'emptyFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Search specialties...`
  String get searchAtSpeciality {
    return Intl.message(
      'Search specialties...',
      name: 'searchAtSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any specialty with this name`
  String get notFoundAnySpecialityWithThisName {
    return Intl.message(
      'Couldn\'t find any specialty with this name',
      name: 'notFoundAnySpecialityWithThisName',
      desc: '',
      args: [],
    );
  }

  /// `Some Thing went wrong`
  String get someThingError {
    return Intl.message(
      'Some Thing went wrong',
      name: 'someThingError',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sortBy {
    return Intl.message(
      'Sort By',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any doctor in this specialty`
  String get noDoctorFoundInThisSpeciality {
    return Intl.message(
      'Couldn\'t find any doctor in this specialty',
      name: 'noDoctorFoundInThisSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Price Low`
  String get priceLow {
    return Intl.message(
      'Price Low',
      name: 'priceLow',
      desc: '',
      args: [],
    );
  }

  /// `Price High`
  String get priceHigh {
    return Intl.message(
      'Price High',
      name: 'priceHigh',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newest {
    return Intl.message(
      'Newest',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `Oldest`
  String get oldest {
    return Intl.message(
      'Oldest',
      name: 'oldest',
      desc: '',
      args: [],
    );
  }

  /// `Alphabetic`
  String get alphabetic {
    return Intl.message(
      'Alphabetic',
      name: 'alphabetic',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `I'm booking for another patient`
  String get iamBookingToAnotherPatient {
    return Intl.message(
      'I\'m booking for another patient',
      name: 'iamBookingToAnotherPatient',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Fees`
  String get fees {
    return Intl.message(
      'Fees',
      name: 'fees',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message(
      'EGP',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `Session information was successfully edited`
  String get sessionInformationWasSuccessfullyEdited {
    return Intl.message(
      'Session information was successfully edited',
      name: 'sessionInformationWasSuccessfullyEdited',
      desc: '',
      args: [],
    );
  }

  /// `Hope you get better soon`
  String get hopeYouGetBetterSoon {
    return Intl.message(
      'Hope you get better soon',
      name: 'hopeYouGetBetterSoon',
      desc: '',
      args: [],
    );
  }

  /// `Go to my bookings`
  String get goToMyBooking {
    return Intl.message(
      'Go to my bookings',
      name: 'goToMyBooking',
      desc: '',
      args: [],
    );
  }

  /// `Book Appointment`
  String get bookAppointment {
    return Intl.message(
      'Book Appointment',
      name: 'bookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Can't confirm appointment booking`
  String get canNotConfirmBookAppointment {
    return Intl.message(
      'Can\'t confirm appointment booking',
      name: 'canNotConfirmBookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Choose Branch`
  String get chooseBranches {
    return Intl.message(
      'Choose Branch',
      name: 'chooseBranches',
      desc: '',
      args: [],
    );
  }

  /// `There aren't any available sessions for this doctor !`
  String get thereAreNotAnyAvailableSessionsForThisPartner {
    return Intl.message(
      'There aren\'t any available sessions for this doctor !',
      name: 'thereAreNotAnyAvailableSessionsForThisPartner',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get chooseDate {
    return Intl.message(
      'Choose Date',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Choose Time`
  String get chooseTime {
    return Intl.message(
      'Choose Time',
      name: 'chooseTime',
      desc: '',
      args: [],
    );
  }

  /// `Choose Branch`
  String get chooseBranch {
    return Intl.message(
      'Choose Branch',
      name: 'chooseBranch',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Details`
  String get doctorDetails {
    return Intl.message(
      'Doctor Details',
      name: 'doctorDetails',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get review {
    return Intl.message(
      'Reviews',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get patient {
    return Intl.message(
      'Patients',
      name: 'patient',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Add Review`
  String get addReview {
    return Intl.message(
      'Add Review',
      name: 'addReview',
      desc: '',
      args: [],
    );
  }

  /// `Rate Doctor`
  String get rateDoctor {
    return Intl.message(
      'Rate Doctor',
      name: 'rateDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Write your review...`
  String get writeYourReview {
    return Intl.message(
      'Write your review...',
      name: 'writeYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your review`
  String get pleaseEnterYourReview {
    return Intl.message(
      'Please enter your review',
      name: 'pleaseEnterYourReview',
      desc: '',
      args: [],
    );
  }

  /// `Session Fees`
  String get consultationFees {
    return Intl.message(
      'Session Fees',
      name: 'consultationFees',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Similar Doctors`
  String get similarDoctor {
    return Intl.message(
      'Similar Doctors',
      name: 'similarDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorite {
    return Intl.message(
      'Favorites',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Logged out Successfully`
  String get logoutSuccessfully {
    return Intl.message(
      'Logged out Successfully',
      name: 'logoutSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Exit application`
  String get exitFromApplication {
    return Intl.message(
      'Exit application',
      name: 'exitFromApplication',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to exit`
  String get doYouWantToExit {
    return Intl.message(
      'Do you want to exit',
      name: 'doYouWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get enterCurrentPassword {
    return Intl.message(
      'Current password',
      name: 'enterCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get enterNewPassword {
    return Intl.message(
      'New password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get enterConfirmPassword {
    return Intl.message(
      'Confirm new password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message(
      'Instagram',
      name: 'instagram',
      desc: '',
      args: [],
    );
  }

  /// `Youtube`
  String get youtube {
    return Intl.message(
      'Youtube',
      name: 'youtube',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your Password`
  String get yourPassword {
    return Intl.message(
      'Your Password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile Picture`
  String get changeProfilePicture {
    return Intl.message(
      'Change Profile Picture',
      name: 'changeProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo`
  String get choosePhoto {
    return Intl.message(
      'Choose photo',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Please choose photo`
  String get pleaseChoosePhoto {
    return Intl.message(
      'Please choose photo',
      name: 'pleaseChoosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Enable WhatsApp notifications`
  String get enableWhatsappMessage {
    return Intl.message(
      'Enable WhatsApp notifications',
      name: 'enableWhatsappMessage',
      desc: '',
      args: [],
    );
  }

  /// `Doctor name`
  String get nameOfDoctor {
    return Intl.message(
      'Doctor name',
      name: 'nameOfDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Specialty`
  String get speciality {
    return Intl.message(
      'Specialty',
      name: 'speciality',
      desc: '',
      args: [],
    );
  }

  /// `Choose Specialty`
  String get chooseSpeciality {
    return Intl.message(
      'Choose Specialty',
      name: 'chooseSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message(
      'Branch',
      name: 'branch',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any doctors matching your query.`
  String get noDoctorFoundByThisSearch {
    return Intl.message(
      'Couldn\'t find any doctors matching your query.',
      name: 'noDoctorFoundByThisSearch',
      desc: '',
      args: [],
    );
  }

  /// `Search doctors...`
  String get searchAtDoctor {
    return Intl.message(
      'Search doctors...',
      name: 'searchAtDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find any doctors using this name.`
  String get notFoundAnyDoctorWithThisName {
    return Intl.message(
      'Couldn\'t find any doctors using this name.',
      name: 'notFoundAnyDoctorWithThisName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone must be 11 numbers`
  String get phoneMustBe11Number {
    return Intl.message(
      'Phone must be 11 numbers',
      name: 'phoneMustBe11Number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your Verification Code`
  String get pleaseEnterYourVerificationCode {
    return Intl.message(
      'Please enter your Verification Code',
      name: 'pleaseEnterYourVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is too week`
  String get passwordIsToWeek {
    return Intl.message(
      'Password is too week',
      name: 'passwordIsToWeek',
      desc: '',
      args: [],
    );
  }

  /// `Login or create account first`
  String get loginOrCreateAnAccountFirst {
    return Intl.message(
      'Login or create account first',
      name: 'loginOrCreateAnAccountFirst',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get passwordNotMatch {
    return Intl.message(
      'Passwords don\'t match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Number`
  String get whatsNumber {
    return Intl.message(
      'WhatsApp Number',
      name: 'whatsNumber',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for booking`
  String get thanksForBooking {
    return Intl.message(
      'Thanks for booking',
      name: 'thanksForBooking',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any notifications yet`
  String get youDoNotHaveAnyNotificationYet {
    return Intl.message(
      'You don\'t have any notifications yet',
      name: 'youDoNotHaveAnyNotificationYet',
      desc: '',
      args: [],
    );
  }

  /// `Do you need health care?`
  String get doYouNeedHealthcare {
    return Intl.message(
      'Do you need health care?',
      name: 'doYouNeedHealthcare',
      desc: '',
      args: [],
    );
  }

  /// `Book doctor appointment in less than a minute`
  String get youCanBookAnAppointmentWithADoctorInLess {
    return Intl.message(
      'Book doctor appointment in less than a minute',
      name: 'youCanBookAnAppointmentWithADoctorInLess',
      desc: '',
      args: [],
    );
  }

  /// `You can find the doctor that you need using the previous form`
  String get youCanFindTheDoctorThatYouNeedUsingThe {
    return Intl.message(
      'You can find the doctor that you need using the previous form',
      name: 'youCanFindTheDoctorThatYouNeedUsingThe',
      desc: '',
      args: [],
    );
  }

  /// `looking for doctor`
  String get lookingForDoctor {
    return Intl.message(
      'looking for doctor',
      name: 'lookingForDoctor',
      desc: '',
      args: [],
    );
  }

  /// `You must be logged in to view your current sessions or book new session`
  String get youMustBeLoggedInToViewYourCurrentSessions {
    return Intl.message(
      'You must be logged in to view your current sessions or book new session',
      name: 'youMustBeLoggedInToViewYourCurrentSessions',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Past`
  String get past {
    return Intl.message(
      'Past',
      name: 'past',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Sessions`
  String get sessions {
    return Intl.message(
      'Sessions',
      name: 'sessions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
