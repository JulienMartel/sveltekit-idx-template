{pkgs}: {
  channel = "stable-23.05"; # "stable-23.05" or "unstable"
  packages = [
    pkgs.nodejs
  ];
  idx.extensions = [
    "svelte.svelte-vscode"
  ];
  # runs when a workspace is first created with this `dev.nix` file
  # to run something each time the environment is rebuilt, use the `onStart` hook
  idx.workspace.onCreate = {
    npm-install = "npm install";
  };
  idx.previews = {
    enable = true;
    previews = [
      {
        command = ["npm" "run" "dev" "--" "--port" "$PORT" "--hostname" "0.0.0.0"];
        manager = "web";
        id = "web";
      }
    ];
  };
}