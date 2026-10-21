Map<int, List> countryISOCode = {
  0: ['SA', '+966', 'Saudi Arabia'],
  1: ['AE', '+971', 'United Arab Emirates'],
  2: ['QA', '+974', 'Qatar'],
  3: ['OM', '+968', 'Oman'],
  4: ['BH', '+973', 'Bahrain'],
  5: ['JO', '+962', 'Jordan'],
  6: ['KW', '+965', 'Kuwait'],
  7: ['EG', '+20', 'Egypt'],
};

final Map<String, String> countryData = {
  '+966': 'SA',
  '+971': 'AE',
  '+974': 'QA',
  '+968': 'OM',
  '+973': 'BH',
  '+962': 'JO',
  '+965': 'KW',
  '+20': 'EG',
};

String countryCodeToEmoji(String? countryCode) {
  if (countryCode == null) return '';
  final int firstLetter = countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}
