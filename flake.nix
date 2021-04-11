{
  description = "A flake for building Hello World";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = 
    with import nixpkgs { system = "x86-64-linux"; };
    stdenv.mkDerivation {
      name = "Hello";
      src = self;
      buildPhase = "gcc -o hello ./hello.c";
      installPhase = "mkdir -p $out/bin; install -t $out/bin hello";


    #self.packages.x86_64-linux.hello;





  };
}
