import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileState {
  final String firstName;
  final String lastName;
  final String dob;
  final String nationality;

  const EditProfileState({
    this.firstName = '',
    this.lastName = '',
    this.dob = '',
    this.nationality = '',
  });

  EditProfileState copyWith({
    String? firstName,
    String? lastName,
    String? dob,
    String? nationality,
  }) {
    return EditProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      nationality: nationality ?? this.nationality,
    );
  }
}

class EditProfileNotifier extends Notifier<EditProfileState> {
  @override
  EditProfileState build() => const EditProfileState();

  void setFirstName(String value) => state = state.copyWith(firstName: value);
  void setLastName(String value) => state = state.copyWith(lastName: value);
  void setDob(String value) => state = state.copyWith(dob: value);
  void setNationality(String value) => state = state.copyWith(nationality: value);
}

final editProfileProvider =
    NotifierProvider<EditProfileNotifier, EditProfileState>(
  EditProfileNotifier.new,
);