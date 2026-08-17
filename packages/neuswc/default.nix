{
  lib,
  meson,
  pkg-config,
  wayland-scanner,
  libdrm,
  neuwld,
  wayland,
  xwayland,
  wayland-protocols,
  pixman,
  udev,
  ninja,
  fontconfig,
  libxkbcommon,
  libinput,
  libxcb,
  libxcb-wm,
  stdenv,
  fetchFromSourcehut,
  patches ? [ ],
  xwaylandSupport ? true,
  extra ? true,
  example ? false,
}:
stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuswc";
    rev = "b541f39d14e5c81dc35eae6af10c8d959a9c9586";
    hash = "sha256-Gl2DBy+2QLZE6VhsoukqT/VJyP4H9dT3dx3wsITzkIc=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    wayland-scanner
    libdrm
  ];

  buildInputs = [
    neuwld
    wayland
    wayland-protocols
    pixman
    libdrm
    udev
    libxkbcommon
    libinput
    fontconfig
  ]
  ++ lib.optionals xwaylandSupport [
    xwayland
    libxcb
    libxcb-wm
  ];

  mesonAutoFeatures = "auto";

  mesonFlags = [
    "-Dextra=${lib.boolToString extra}"
    "-Dexample=${lib.boolToString example}"
  ];

  inherit patches;

  meta = {
    description = "Fork of swc for hevel window manager";
    homepage = "https://git.sr.ht/~shrub900/neuswc";
    license = lib.licenses.isc;
    mainProgram = "swc-launch";
  };
}
