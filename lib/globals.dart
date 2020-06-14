String getInitials(String nameString) {
  if (nameString.isEmpty) return " ";

  List<String> nameArray =
      nameString.replaceAll(new RegExp(r"\s+\b|\b\s"), " ").split(" ");
  String initials = ((nameArray[0])[0] != null ? (nameArray[0])[0] : " ") +
      (nameArray.length == 1 ? " " : (nameArray[nameArray.length - 1])[0]);

  return initials;
}
