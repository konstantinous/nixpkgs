{
  mkDerivation, lib,
  extra-cmake-modules, kwallet, signond
}:

mkDerivation {
  name = "signon-kwallet-extension";

  nativeBuildInputs = [
    extra-cmake-modules
  ];

  buildInputs = [
    kwallet
    signond
  ];

  meta = with lib; {
    description = "KWallet integration for signon framework";
    homepage = https://github.com/KDE/signon-kwallet-extension;
    platforms = platforms.linux;

    license = with licenses; [
      gpl2
    ];

    maintainers = [ {
      name = "Konstantin Khokhlov";
      email = "konstantin@konstantsky.pw";
    } ];
  };

}
