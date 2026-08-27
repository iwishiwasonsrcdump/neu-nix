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
  ninja
}:
stdenv.mkDerivation {
  pname = "tohu";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "tohu";
    rev = "7c33428dbce080f8654aac544cfc5e4e628495ba";
    hash = "sha256-24qWIcbnSUDzz3qTgsM1fCk/3ikleIZRqj0BOFkmZYo=";
  };

  nativeBuildInputs = [
    pkg-config
    ninja
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

  preInstall = "export PREFIX=$out";

  # screw shrub we dynamic link
  patchPhase = ''
    substituteInPlace build.ninja \
      --replace-fail \
        'pkg-config --static --libs' \
        'pkg-config --libs'
  '';

  meta = {
    description = "floating window manager for swc";
    homepage = "https://git.sr.ht/~shrub900/tohu";
    license = lib.licenses.isc;
    mainProgram = "tohu";
  };
}
