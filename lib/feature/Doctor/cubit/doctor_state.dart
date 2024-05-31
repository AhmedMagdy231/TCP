part of 'doctor_cubit.dart';

class DoctorState {
  final Status doctorDetailsStatus;
  final Status dateStatus;
  final Status timeStatus;
  final Status stepperStatus;
  final addReviewStatus;

  DoctorState({
    this.doctorDetailsStatus = Status.initial,
    this.dateStatus = Status.initial,
    this.timeStatus = Status.initial,
    this.stepperStatus = Status.initial,
    this.addReviewStatus = Status.initial,
  });

  DoctorState copyWith({
    Status? doctorDetailsStatus,
    Status? dateStatus,
    Status? timeStatus,
    Status? stepperStatus,
    Status? addReviewStatus,
  }) =>
      DoctorState(
        doctorDetailsStatus: doctorDetailsStatus ?? this.doctorDetailsStatus,
          dateStatus: dateStatus?? this.dateStatus,
        timeStatus: timeStatus?? this.timeStatus,
       stepperStatus: stepperStatus?? this.stepperStatus,
        addReviewStatus: addReviewStatus?? this.addReviewStatus,
      );
}
