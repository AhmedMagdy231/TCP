part of 'doctor_cubit.dart';

class DoctorState {
  final Status doctorDetailsStatus;
  final Status dateStatus;
  final Status timeStatus;
  final Status stepperStatus;

  DoctorState({
    this.doctorDetailsStatus = Status.initial,
    this.dateStatus = Status.initial,
    this.timeStatus = Status.initial,
    this.stepperStatus = Status.initial,
  });

  DoctorState copyWith({
    Status? doctorDetailsStatus,
    Status? dateStatus,
    Status? timeStatus,
    Status? stepperStatus,
  }) =>
      DoctorState(
        doctorDetailsStatus: doctorDetailsStatus ?? this.doctorDetailsStatus,
          dateStatus: dateStatus?? this.dateStatus,
        timeStatus: timeStatus?? this.timeStatus,
       stepperStatus: stepperStatus?? this.stepperStatus,
      );
}
