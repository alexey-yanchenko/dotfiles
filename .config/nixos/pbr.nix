{ config, lib, pkgs, modulesPath, ... }:

{
  networking.iproute2 = {
    enable = true;
    rttablesExtraConfig =
      ''256 pbr_vpn'';
  };
  networking.nftables = {
    enable = true;
    ruleset = ''
      table inet fw4 {
        set vpn_domains {
          type ipv4_addr
        }
        chain mangle_prerouting {
          type filter hook prerouting priority mangle; policy accept;
          ip daddr 8.8.8.8 counter packets 0 bytes 0
          meta nftrace set 1
          jump pbr_prerouting comment "Jump into pbr prerouting chain"
        }
        chain pbr_prerouting {
          ip daddr @vpn_domains goto pbr_mark_0x020000 comment "Main VPN"
        }
        chain pbr_mark_0x020000 {
          meta mark set meta mark & 0xff02ffff | 0x00020000
          return
        }
      }
    '';
  };
  networking.firewall.trustedInterfaces = [ "tun0" ];
  networking.firewall.checkReversePath = "loose";
  services.dnsmasq = {
    enable = true;
    settings = {
      bind-interfaces = true;
      listen-address = "127.0.0.1";
      nftset = "/2ip.io/4#inet#fw4#vpn_domains";
    };
  };

}
