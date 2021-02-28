local buildDockerImage = import 'build-docker-image.libsonnet';
local retagDockerImage = import 'retag-docker-image.libsonnet';
local lernaJson = import '../lerna.json';
local packageJson = import './package.json';
local determinePackagePath(packageJson, lernaJson) =
  std.foldl(
    function(result, packageGlob)
      if result != null then
        result
      else
        local foundStars = std.findSubstr('*', packageGlob);
        local dashedPackageGlob = std.strReplace(packageGlob, '/', '-');
        if std.length(foundStars) == 0 then
          if packageJson.name == '@postclick/' + dashedPackageGlob then
            packageGlob
          else
            null
        else if packageGlob == 'packages/*' then
          if std.startsWith(packageJson.name, '@postclick/') then
            std.substr(packageGlob, 0, foundStars[0]) +
            std.substr(packageJson.name, std.length('@postclick/'), std.length(packageJson.name) - std.length('@postclick/'))
          else
            null
        else if foundStars[0] == std.length(packageGlob) - 1 then
          if std.startsWith(packageJson.name, '@postclick/' + std.substr(dashedPackageGlob, 0, foundStars[0])) then
            std.substr(packageGlob, 0, foundStars[0]) +
            std.substr(packageJson.name, std.length('@postclick/') + foundStars[0], std.length(packageJson.name) - std.length('@postclick/') - foundStars[0])
          else
            null
        else
          null,
    lernaJson.packages,
    null,
  );
[
  buildDockerImage('blog'),
  retagDockerImage('blog'),
  {
    alrighty: determinePackagePath(import '../packages/alrighty/package.json', lernaJson),
    blog: determinePackagePath(packageJson, lernaJson),
    droneConvertService: determinePackagePath(import '../drone/convert-service/package.json', lernaJson),
    workspace: determinePackagePath(import '../workspace/package.json', lernaJson),
  },
]


