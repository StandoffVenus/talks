{
  inputs.nixpkgs.url          = "github:NixOS/nixpkgs/nixos-24.11";
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }: 
    let
      platform = "aarch64-linux";
      pkgs     = nixpkgs.legacyPackages.${platform};
    in
    {
      packages.${platform}.default = self.module;

      module = pkgs.buildGoModule rec {
        pname   = "example_hello";
        version = "40afcb7";
      
        src = pkgs.fetchFromGitHub {
          owner  = "golang";
          repo   = "example";
          rev    = version;
          sha256 = "y5/MWrrMQrHxPXzzK7ElggEr7Mr1L+KGsMAfxhWz2CU=";
        };
      
        modRoot    = "hello";
        vendorHash = null; # We have no dependencies to vendor
      };

      devShells.${platform}.default = pkgs.mkShell {
        packages = [ pkgs.go ];
      };
    };
}
