{ config, lib, pkgs, modulesPath, ... }:

{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "org.gnome.Evince.desktop";
      "text/html" = "google-chrome.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
      "x-scheme-handler/unknown" = "google-chrome.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
      "application/x-ruby" = "org.gnome.TextEditor.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/tiff" = "org.gnome.Loupe.desktop";
      "image/x-tga" = "org.gnome.Loupe.desktop";
      "image/vnd-ms.dds" = "org.gnome.Loupe.desktop";
      "image/x-dds" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/vnd.microsoft.icon" = "org.gnome.Loupe.desktop";
      "image/vnd.radiance" = "org.gnome.Loupe.desktop";
      "image/x-exr" = "org.gnome.Loupe.desktop";
      "image/x-portable-bitmap" = "org.gnome.Loupe.desktop";
      "image/x-portable-graymap" = "org.gnome.Loupe.desktop";
      "image/x-portable-pixmap" = "org.gnome.Loupe.desktop";
      "image/x-portable-anymap" = "org.gnome.Loupe.desktop";
      "image/x-qoi" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";
      "image/svg+xml-compressed" = "org.gnome.Loupe.desktop";
      "image/avif" = "org.gnome.Loupe.desktop";
      "image/heic" = "org.gnome.Loupe.desktop";
      "image/jxl" = "org.gnome.Loupe.desktop";
      "text/plain" = "org.gnome.TextEditor.desktop";
    };
  };
}
