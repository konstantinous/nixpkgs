{
  stdenv,
  fetchgit,
  pkgconfig,
  symlinkJoin,
  qtbase,
  qmake,
  doxygen,
  signond
}:

stdenv.mkDerivation rec {

  name = "signon-plugin-oauth2";
  version = "0.24";

  src = fetchgit {
    url = "https://gitlab.com/accounts-sso/signon-plugin-oauth2";
    rev = "refs/tags/VERSION_0.24";
    sha256 = "1iqq5jbd9inx10n491lgrhv3rkr3iykjyh7ilf0v21zfl4vc6lzl";
  };

  PKG_CONFIG_PATH="${signond}/lib/pkgconfig";

  preConfigure = ''
      # Do not install tests and example
    echo 'INSTALLS =' >> tests/tests.pro
    echo 'INSTALLS =' >> example/example.pro
  '';
  plugin = symlinkJoin {
    name = "oauth2";
    paths = [ signond ];
  };

  nativeBuildInputs = [
    doxygen
    pkgconfig
    qmake
  ];

  BuildInputs = [
    signond
    qtbase
  ];

  postFixup = ''
    install -D ./src/lib/signon/liboauth2plugin.so $out/lib/signon/liboauth2plugin.so
  '';

  outputs = [ "out" "dev" ];

  meta = with stdenv.lib; {
    description = "This plugin for the Accounts-SSO SignOn daemon handles the OAuth 1.0 and 2.0 authentication protocols";
    homepage = https://gitlab.com/accounts-sso/signon-plugin-oauth2;
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


