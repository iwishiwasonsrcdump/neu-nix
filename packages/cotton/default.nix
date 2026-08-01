{
  stdenv,
  lib,
  SDL2,
  meson,
  ninja,
  pkg-config,
  fetchgit
}:
stdenv.mkDerivation {
  pname = "cotton";
  version = "0.2";
  src = fetchgit {
    url = "https://srcdump.net/soggy/cotton.git";
    rev = "c6d7e65";
    hash = "sha256-zNY3lHGXm2e+/W8P7Ty106RnEkZ9ZCGt6uP8GD7le8w=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    SDL2
  ];

  patchPhase = ''
    substituteInPlace meson.build \
      --replace \
        "executable('cotton', src_files, dependencies : sdl2)" \
        "executable('cotton', src_files, dependencies : sdl2, install : true)"
  '';
  meta = {
    description = "Cotton is a tiny virtual computer that lives in your windows - it was written in C99 and has 64 KiB of memory and runs programs written in the cot programming language";
    license = lib.licenses.isc;
    homepage = "https://srcdump.net/soggy/cotton/tree/main/index.html";
    mainProgram = "cotton";
  };
}
