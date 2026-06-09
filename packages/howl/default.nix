{
  lib,
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  neuswc,
  wayland,
  pixman,
  libxkbcommon,
  libinput,
  libspng,
}:
stdenv.mkDerivation {
  pname = "howl";
  version = "0.1.0";
  src = fetchFromSourcehut {
    domain = "sr.ht";
    owner = "~wf";
    repo = "howl";
    rev = "71bc1fa40587e49133f3fdbb1163771630b0e6c1";
    hash = "sha256-xRdHH3FfoGOpmosGcL4JOR+N1F5zpPWvXTTW5LzViiE=";
  };

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    neuswc
    wayland
    pixman
    libxkbcommon
    libinput
    libspng
  ];

  preBuild = ''
    export NIX_LDFLAGS="$NIX_LDFLAGS $(pkg-config --libs wayland-server xkbcommon)"
  '';

  makeFlags = [ "PREFIX=$(out)" ];

  meta = {
    description = "A small Wayland compositor (howl) and its IPC client (howlc)";
    homepage = "https://codeberg.org/wf/howl";
    license = lib.licenses.isc;
    mainProgram = "howl";
  };
}
