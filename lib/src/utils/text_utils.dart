String upperCase(String text) {
  if (text.contains('-')) {
    String tempText = '';
    for (String element in text.replaceAll('/', '').split('-')) {
      tempText = '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else {
    return text.replaceAll('/', '').substring(0, 1).toUpperCase() +
        text.replaceAll('/', '').substring(1).toLowerCase();
  }
}
