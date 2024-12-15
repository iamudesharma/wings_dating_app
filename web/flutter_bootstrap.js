{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
    serviceWorkerSettings: {
        serviceWorkerVersion: {{flutter_service_worker_version}},
    },
    onEntrypointLoaded: function (engineInitializer) {
      engineInitializer.initializeEngine({
        useColorEmoji: true, // add this parameter
        renderer: 'canvaskit'
      }).then(function (appRunner) {
        appRunner.runApp();
      });
    }
});