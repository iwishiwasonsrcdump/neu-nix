{
  lib,
  meson,
  pkg-config,
  wayland-scanner,
  doxygen,
  ninja,
  fontconfig,
  pixman,
  freetype,
  libdrm,
  wayland,
  stdenv,
  fetchFromSourcehut,
}:
stdenv.mkDerivation {
  pname = "neuwld";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuwld";
    rev = "edc0746f0d3abe5b4309fe79cfa0613d1fd0277a";
    hash = "sha256-IKjGAn7XC65QcxiCxB3G2008ipfaE3LAsoV1f15GjR8=";
  };

  nativeBuildInputs = [
    meson
    pkg-config
    wayland-scanner
    ninja
    doxygen
  ];

  buildInputs = [
    fontconfig
    pixman
    freetype
    libdrm
    wayland
  ];

  meta = {
    description = "A drawing library that targets Wayland";
    homepage = "https://git.sr.ht/~shrub900/neuwld";
    license = lib.licenses.mit;
  };
}
