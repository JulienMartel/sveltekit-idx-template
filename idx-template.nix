# /opt/nix/store/qgx9xsmmwjkflakfcxz52ncmihhr3mg9-idx-env-usr-target/bin/idx-template ~/Monospace/workspace/nix_templates/sveltekit --output-dir ~ --workspace-name foo -a '{"template": "default", "types": "checkjs", "prettier": "true", "eslint": "true", "playwright": "true", "vitest": "true"}'
{ pkgs, template, types, eslint, prettier, playwright, vitest, ... }: {
    packages = [
      pkgs.nodejs
    ];
    bootstrap = ''
      mkdir -p "$WS_NAME"

      cp ${./package.json} ./package.json
      cp ${./init.js} ./init.js

      # install every time so that we get latest version of `create-svelte`
      npm i
      node init.js name="$WS_NAME" template=${template} types=${types} prettier=${toString prettier} eslint=${toString eslint} playwright=${toString playwright} vitest=${toString vitest}

      chmod -R +w "$WS_NAME"
      mkdir "$out"
      cp -rf "$WS_NAME"/* "$out"

      mkdir -p "$out"/.idx/
      cp -rf ${./dev.nix} "$out"/.idx/dev.nix 
      chmod -R +w "$out"/.idx/dev.nix 
    '';
}
