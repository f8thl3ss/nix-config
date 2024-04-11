{ config, pkgs, lib, ... }:
{
  services.restic.backups = {
    backblack-backup = {
      environmentFile = "/etc/nixos/secrets/restic-backblaze-env";
      passwordFile = "/etc/nixos/secrets/restic-password";

      # Backup content
      paths = [
        "/home/*"
        "/home/*/.ssh"
      ];
      exclude = [
        "/home/*/.*"
        "/home/*/Downloads"
        "/home/*/**/node_modules" # node projects deps
        "/home/*/**/target" # rust project builds
      ];
      initialize = true;

      repository = "s3:s3.us-east-005.backblazeb2.com/muggle-backup";
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 2"
      ];
    };
    nas-backup = {
      extraOptions = [
        "sftp.command='ssh magic-pi -i /home/chris/.ssh/id_rsa -o StrictHostKeyChecking=no -s sftp'"
      ];
      passwordFile = "/etc/nixos/secrets/restic-password";

      # Backup content
      paths = [
        "/home/*"
        "/home/*/.ssh"
      ];
      exclude = [
        "/home/*/.*"
        "/home/*/Downloads"
        "/home/chris/Workspace"
        "/home/*/**/node_modules"
        "/home/*/**/target"
      ];
      initialize = true;

      repository = "sftp:magic-pi:/mnt/external_hdd/backup";
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 7"
      ];
    };
  };
}
