{ pkgs ? import <nixpkgs> {} }:

pkgs.buildGoModule rec {
  pname   = "example_hello";
  version = "d9923f6970e9ba7e0d23aa9448ead71ea57235ae";

  src = pkgs.fetchFromGitHub {
    owner  = "golang";
    repo   = "example";
    rev    = version;
    sha256 = "euxJQ34lRYzr7P5aeaRmHdCesZCaKnY2Pg2KzfLkbNI=";
  };

  modRoot      = "hello";
  vendorSha256 = null; # We have no dependencies to vendor
}
