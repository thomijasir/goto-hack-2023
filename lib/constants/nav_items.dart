class NavItem {
  final String assetName;
  final String text;
  final String id;

  const NavItem({
    required this.assetName,
    required this.text,
    required this.id,
  });
}

const Map<String, NavItem> navConstants = {
  'pln': NavItem(assetName: 'assets/pln.svg', text: 'PLN', id: '1'),
  'cable': NavItem(assetName: 'assets/cable.svg', text: 'Cable & TV', id: '2'),
  'pdam': NavItem(assetName: 'assets/pdam.svg', text: 'PDAM', id: '3'),
  'bpjs': NavItem(assetName: 'assets/bpjs.svg', text: 'BPJS', id: '4'),
  'pln2': NavItem(assetName: 'assets/pln.svg', text: 'TES2', id: '5'),
  'cable2': NavItem(assetName: 'assets/cable.svg', text: 'TES1', id: '6'),
  'pdam2': NavItem(assetName: 'assets/pdam.svg', text: 'TES3', id: '7'),
  'bpjs2': NavItem(assetName: 'assets/bpjs.svg', text: 'TES4', id: '8'),
};
