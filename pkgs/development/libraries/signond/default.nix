{
  stdenv,
  fetchgit,
  pkgconfig,
  qtbase,
  qttools,
  qmake,
  doxygen,
  graphviz
}:

#let
#unwrapped = stdenv.mkDerivation rec {
stdenv.mkDerivation rec {

  pname = "signond";
  version = "8.60";

  src = fetchgit {
    url = "https://gitlab.com/accounts-sso/${pname}";
    rev = "refs/tags/VERSION_8.60";
    sha256 = "0rvicdrr0h4z2s2r8hsm6fkfjssnf5arfy9mxd4x479azwylaqr1";
  };

  nativeBuildInputs = [
    doxygen
    pkgconfig
    qmake
  ];

  buildInputs = [
    qtbase
    qttools
    graphviz
  ];

  preConfigure = ''
    # don't install example plugin
    sed -e "/example/d" -i src/plugins/plugins.pro
    #disable tests
    sed -i -e '/^SUBDIRS/s/tests//' signon.pro
  '';

  meta = with stdenv.lib; {
    description = "A D-Bus service which performs user authentication on behalf of its clients.";
    homepage = https://gitlab.com/accounts-sso/signond;
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

#in if extensions == [] then unwrapped
#  else import ./wrapper.nix {
#    inherit stdenv makeWrapper symlinkJoin signondExtensions extensions;
#    signond = unwrapped;
#  }
