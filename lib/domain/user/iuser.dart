 abstract interface class IUser {
  final String email;
  final String id;

  const IUser({
    required this.id,
    required this.email,
  });

  // static const IUser empty = IUser(
  //   email: '',
  //   password: '',
  // );
  // bool get isEmpty => this == IUser.empty;
}
