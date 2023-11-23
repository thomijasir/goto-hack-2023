class NavItem {
  final String assetName;
  final String text;

  const NavItem({
    required this.assetName,
    required this.text,
  });
}

const Map<String, NavItem> navConstants = {
  'pln': NavItem(assetName: 'assets/pln.svg', text: 'PLN'),
  'cable': NavItem(assetName: 'assets/cable.svg', text: 'Cable & TV'),
  'pdam': NavItem(assetName: 'assets/pdam.svg', text: 'PDAM'),
  'bpjs': NavItem(assetName: 'assets/bpjs.svg', text: 'BPJS'),
  'pln2': NavItem(assetName: 'assets/pln.svg', text: 'TES2'),
  'cable2': NavItem(assetName: 'assets/cable.svg', text: 'TES1'),
  'pdam2': NavItem(assetName: 'assets/pdam.svg', text: 'TES3'),
  'bpjs2': NavItem(assetName: 'assets/bpjs.svg', text: 'TES4'),
};

const Map<String, List<NavItem>> dockBaseOnPreference = {
  'SEND_MONEY': [
    NavItem(assetName: 'assets/dock-transfer.svg', text: 'Transfer'),
    NavItem(assetName: 'assets/dock-qris.svg', text: 'QRIS'),
    NavItem(assetName: 'assets/dock-history.svg', text: 'History'),
    NavItem(assetName: 'assets/dock-cashout.svg', text: 'Cashout'),
  ],
  'QRIS': [
    NavItem(assetName: 'assets/dock-bills.svg', text: 'Bills'),
    NavItem(assetName: 'assets/dock-qris.svg', text: 'QRIS'),
    NavItem(assetName: 'assets/dock-transfer.svg', text: 'Transfer'),
    NavItem(assetName: 'assets/dock-cashout.svg', text: 'Cashout'),
  ],
  'SAVING': [
    NavItem(assetName: 'assets/dock-tabungan.svg', text: 'Tabungan'),
    NavItem(assetName: 'assets/dock-qris.svg', text: 'QRIS'),
    NavItem(assetName: 'assets/dock-history.svg', text: 'History'),
    NavItem(assetName: 'assets/dock-cashout.svg', text: 'Cashout'),
  ],
  'BILLS': [
    NavItem(assetName: 'assets/dock-bills.svg', text: 'Bills'),
    NavItem(assetName: 'assets/dock-qris.svg', text: 'QRIS'),
    NavItem(assetName: 'assets/dock-paylater.svg', text: 'Paylater'),
    NavItem(assetName: 'assets/dock-transfer.svg', text: 'Transfer'),
  ],
};
