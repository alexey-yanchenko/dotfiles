{
  description = "Elkin NIX OS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    claude-code.url = "github:sadjow/claude-code-nix";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    nixpkgs,
    home-manager,
    claude-code,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              users.elkin = import ./home.nix;
            };
          }
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ claude-code.overlays.default ];
            environment.systemPackages = [ pkgs.claude-code ];
          })
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
