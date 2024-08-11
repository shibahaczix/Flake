{ pkgs, ... }:

{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 52.2;
    longitude = 18.2;
  };
}
