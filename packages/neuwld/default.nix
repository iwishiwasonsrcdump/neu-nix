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
    rev = "38c3b49aea1a1e4fc3fe4d6938f18307bad4c979";
    hash = "sha256-9/m4jFyQf5pOzG15q3a2Rk3MV1rUceLzt9kHiv4Db9U=";
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
