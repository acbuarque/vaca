local setupPackage = import 'setup-package.libsonnet';
setupPackage({
  name: '@postclick/blog',
  features: {
    dockerImage: true,
    npmPackage: false,
  },
});

