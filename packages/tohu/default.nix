{
  lib,
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  pixman,
  wayland,
  neuswc,
  neuwld,
  libxcb,
  libxcb-wm,
  udev,
  libdrm,
  libinput,
  libxkbcommon,
  fontconfig,
}:
stdenv.mkDerivation {
  pname = "tohu";
  version = "unstable-2026-03-20";
  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "tohu";
    rev = "ff0b0d12d3f37b9431a39cfb2389e68c5c0f605e";
    hash = "sha256-Eu/sBNs6CoQrnQZNhf3xHA/Hyu3s9jH8+Mxcz9wAN6g=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pixman
    wayland
    neuswc
    neuwld
    libxcb
    libxcb-wm
    udev
    libdrm
    libinput
    libxkbcommon
    fontconfig
  ];

  postPatch = ''
    substituteInPlace Makefile \
      --replace "-fcolor-diagnostics" ""
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp tohu $out/bin/tohu
    runHook postInstall
  '';

  meta = {
    description = "floating window manager for swc";
    homepage = "https://git.sr.ht/~shrub900/tohu";
    license = lib.licenses.isc;
    mainProgram = "tohu";
  };
}
