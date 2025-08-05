{
  buildDotnetModule,
  dotnetCorePackages,
  fetchFromGitHub,
  ...
}: buildDotnetModule {
  pname = "balatro-mobile-maker";
  version = "0.8.3";
  src = fetchFromGitHub {
    owner = "blake502";
    repo = "balatro-mobile-maker";
    rev = "main";
    hash = "sha256-Ccai8Dcbv9TOrTMoEJj26oeWX0cWhwyOb3xmJgl5xHg=";
  };
  projectFile = "balatro-mobile-maker/balatro-mobile-maker.csproj";
  executables = "balatro-mobile-maker";
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;
  nugetDeps = ./deps.nix;
}
