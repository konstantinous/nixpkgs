{
  stdenv,
  makeWrapper,
  symlinkJoin,
  signond,
  signondExtensions,
  extensions
}:

symlinkJoin {

  name = "signond-with-extensions-${signond.version}";
  paths = [ signond ] ++ extensions;
  buildInputs = [ makeWrapper ];
  inherit (signond) meta;

}
