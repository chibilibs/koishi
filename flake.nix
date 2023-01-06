{
  description = "My simple system configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-doom-emacs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in 
    {
      nixosConfigurations = {
        koishi = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/koishi/configuration.nix ];
        };
      };
      
      homeConfigurations = {
        thechibbis = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nix-doom-emacs.hmModule
            {
              home.username = "thechibbis";
              home.homeDirectory = "/home/thechibbis";
              home.stateVersion = "22.11";
              programs.home-manager.enable = true;
              programs.doom-emacs = {
                enable = true;
                doomPrivateDir = ./users/thechibbis/home/.doom.d;
              };
            }
            ./users/thechibbis/home.nix
          ];
        };
      };
    }; 
}
