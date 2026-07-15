# modules/home-manager/browsers.nix
{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    # Corporot policies
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      BlockAboutConfig = false;
      OfferToSaveLogins = false;
    };

    profiles.default = {
      name = "Default";
      isDefault = true;

      search.default = "ddg";

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
	decentraleyes
        vimium-c
        don-t-fuck-with-paste
        violentmonkey
        wayback-machine
	gruvbox-dark-theme
      ];

      settings = {

        # Tracking protection
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.donottrackheader.enabled" = true;

        # Only use secure htts etc
        "dom.security.https_only_mode" = true;
        "security.tls.insecure_fallback_hosts" = "";

        # Session / cache
        "browser.cache.disk.enable" = false;
        "browser.sessionstore.privacy_level" = 2;

        # Media
        "media.autoplay.default" = 5;

        # Telemetry & data collection
        "app.shield.optoutstudies.enabled" = false;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;

        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.sessions.current.clean" = true;

        "devtools.onboarding.telemetry.logged" = false;

        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        # Wayland / hyprland specific
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "gfx.webrender.all" = true;
        "layers.acceleration.force-enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;

        # Remove annoy
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.uitour.enabled" = false;
        "browser.discovery.enabled" = false;

        # First run 
        "browser.disableResetPrompt" = true;
        "browser.feeds.showFirstRunUI" = false;
        "browser.rights.3.shown" = true;
        "browser.startup.homepage_override.mstone" = "ignore";
        "startup.homepage_override_url" = "";
        "trailhead.firstrun.didSeeAboutWelcome" = true;

        # Downloads
        "browser.download.useDownloadDir" = false;
        "browser.download.panel.shown" = true;

        # Default browser
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;

        # Bookmarks
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.addedImportButton" = true;
      };

      userChrome = ''
      '';

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Toolbar";
            toolbar = true;

            bookmarks = [
              {
                name = "NixOS Manual";
                url = "https://nixos.org/manual/nixos/stable/";
              }
            ];
          }
        ];
      };
    };
  };
}
