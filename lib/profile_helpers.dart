import 'model/profile.dart';
import 'data/profile.dart';

// here is the profile in data folder
// const List<Profile> profiles = [
//   Profile(name: "Wayne Rooney", email: "rooney@gmail.com", image: 'images/rooney.jpg'),
//   Profile(name: "Van Persie", email: "persie@gmail.com", image: 'images/vanpersie.jpg'),
// ];

List<Profile> getNotSelectedProfiles({required int selectedIndex}) {
  // getting the profile, say the profile Van Persie
  final Profile selectedProfile = profiles[selectedIndex];

  // returning the list without the Van Persie profile
  return List.of(profiles)..removeWhere((profile) => profile == selectedProfile);
}
