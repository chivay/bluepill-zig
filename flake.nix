{
  description = "VMT - toy OS written in Zig";
  nixConfig.bash-prompt = "\[bluepill-develop\]$ ";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShell = pkgs.mkShell { buildInputs = with pkgs; [ zig nixpkgs-fmt ]; };
        }
      );
}
