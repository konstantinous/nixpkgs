{
  stdenv,
  lib,
  fetchgit,
  libnotify,
  pkgconfig,
  qtbase,
  qmake,
  signond,
  qtwebkit-plugins,
  qtwebkit,
  qtwebengine,
  accounts-qt,
  libproxy,
  gdk_pixbuf
}:


stdenv.mkDerivation rec {
  name = "signon-ui";
  version = "0.17.02";

  src = fetchgit {
    url = "https://gitlab.com/accounts-sso/signon-ui";
    rev = "3acb6541";
    sha256 = "1821k48mz99pajv0iv97k80b7g4j8g1xc1xqpqdvb1ijn33yy12g";
  };

  preConfigure = ''
    # Do not install tests
    echo 'INSTALLS =' >>tests/unit/tst_inactivity_timer.pro
    echo 'INSTALLS =' >>tests/unit/tst_signon_ui.pro
  '';

  nativeBuildInputs = [
    qmake
    pkgconfig
  ];

  buildInputs = [
    qtbase
    signond
    qtwebkit-plugins
    qtwebkit
    accounts-qt
    qtwebengine
    libnotify
    libproxy
    gdk_pixbuf
  ];

  meta = with stdenv.lib; {
    description = "UI component responsible for handling the user interactions which can happen during the login process of an online account";
    homepage = https://gitlab.com/accounts-sso/signon-ui;
    platforms = platforms.linux;

    license = with licenses; [
      lgpl21
    ];

    maintainers = [ {
      name = "Konstantin Khokhlov";
      email = "konstantin@konstantsky.pw";
    } ];
  };

}
