{
  lib,
  stdenv,
  fetchFromCodeberg,
  pkg-config,
  wayland,
  wayland-scanner,
  wayland-protocols
}:
stdenv.mkDerivation {
  pname = "wawa";
  version = "1.0";
  src = fetchFromCodeberg {
    owner = "sewn";
    repo = "wawa";
    rev = "e6d23e7e095b2055266a138485348bf97deebe06";
    hash = "sha256-Uxl0tOS6CG2wNOEoShAJY4BcUS31dG2jaSOLUI1ZE/U=";
  };

  env.NIX_CFLAGS_COMPILE = "-Wno-incompatible-pointer-types";
  
  nativeBuildInputs = [
    pkg-config
    wayland-scanner
    wayland-protocols
  ];

  buildInputs = [
    wayland
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "A simple, hackable, and distinctive Wayland wallpaper setter utilizing stb_image that targets wlr-layer-shell supported compositors, featuring tiling, spreading across monitors, along with fill, fit and stretching the wallpaper, with less SLOC than your average wallpaper setter.";
    homepage = "https://codeberg.org/sewn/wawa";
    license = lib.licenses.mit;
    mainProgram = "wawa";
  };
}

  

