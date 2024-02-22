fx_version 'cerulean';
game 'gta5';
lua54 'yes';
author 'Vitor Ribeiro <monk@codevitor.dev>';
description 'Rose Core is a scalable and high-performance framework designed for various game mode servers on FiveM.';

shared_scripts {

  -- Modules;
  'Shared/sdk/version.lua',
  'Modules/misc/namespacer.lua',
  'Modules/tests/lust.lua',
  'Modules/misc/string.lua',
  'Modules/misc/file.lua',

  -- Bundler;
  'Shared/bundler/Index.lua',
  'Shared/bundler/Importer.lua',
  'Shared/bundler/Shared.lua'
}

core_env "development";

server_scripts {
  'spec/namespacer.spec.lua',
  'spec/filesystem.spec.lua'
}