{
  mkDerivation,
  stdenv,
  fetchurl,
  extra-cmake-modules,
  kdoctools,
  shared-mime-info,
  libkgapi,
  kaccounts-integration,
  kaccounts-providers,
  intltool,
  kcalcore,
  kcontacts,
  qtkeychain
}:

stdenv.mkDerivation rec {

  name = "kio-gdrive";

  version = "1.2.7";
  src = fetchurl {
    url = "mirror://kde/stable/kio-gdrive/1.2.7/src/kio-gdrive-1.2.7.tar.xz";
    sha256 = "1b59e4d9940deb290cc4d7441d4ae8762ccb1de8d14dbd0bdbd3bc9a5fc266a4";
    name = "kio-gdrive-1.2.7.tar.xz";
  };

  nativeBuildInputs = [
    extra-cmake-modules
    kdoctools
    shared-mime-info
  ];

  buildInputs = [
    libkgapi
    kaccounts-integration
    kaccounts-providers
    intltool
    kcalcore
    kcontacts
    qtkeychain
  ];

  meta = with stdenv.lib; {
    description = "A KIO slave that enables KIO-aware applications to access and edit Google Drive files on the cloud.";
    homepage = https://community.kde.org/KIO_GDrive;
    platforms = platforms.linux;

    license = with licenses; [
      gpl2
      gpl3
    ];

    maintainers = [ {
      name = "Konstantin Khokhlov";
      email = "konstantin@konstantsky.pw";
    } ];
  };

}
