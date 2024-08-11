{ pkgs, config, ... }:

{
  xdg.configFile."fastfetch/config.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink ./fastfetch/config.jsonc;
}
