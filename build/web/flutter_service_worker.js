'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "335137177af161ca1b00f1b2e0c03ea8",
"assets/assets/fonts/Arabic.ttf": "db3ace582c54f985f6aa2093d6c1aab4",
"assets/assets/fonts/cartoon.ttf": "64dc0c76d83276a979690045164fc01d",
"assets/assets/fonts/font2.ttf": "7af3944c5b3cc3691a89b11b1e8ef2ca",
"assets/assets/fonts/Hindi.ttf": "30231923a481cd5079deaef55fc38c38",
"assets/assets/fonts/intro.ttf": "9145f1dd06bd395ba2686489d82a3e46",
"assets/assets/fonts/longnor.ttf": "dc2a9bde9d73f4e11258410bdef41425",
"assets/assets/fonts/Nova.ttf": "52401faa629924fa9d263a8342c95cfb",
"assets/assets/fonts/SharpGrotesk.ttf": "0b6986b36b7d81188f996e58f2ec0643",
"assets/assets/fonts/wide.ttf": "6cab7e44a9fa63386769ceeaa94d7338",
"assets/assets/images/3.gif": "929ab033085747c03b945ed025601cfe",
"assets/assets/images/binod.jpg": "f1bbedd753d3d1fcafb350ba074892cb",
"assets/assets/images/Calc.jpg": "a3fb88b74c9624c5017477dd4490bbc5",
"assets/assets/images/chacha.gif": "852ce2c657e26466c6aa36f13aeff977",
"assets/assets/images/codechef.jpg": "19b255eb56a479de68b1ae79fc608f84",
"assets/assets/images/coffee3.mp4": "6a3aef752e395def0bf224f851dc5095",
"assets/assets/images/ComingSoon.gif": "009357715ed14439a0fd6a97893bdbba",
"assets/assets/images/creative.mp4": "453310c567494da9717f3256edc177c7",
"assets/assets/images/fb.mp4": "71b46cc8319efd01b3163c4573bf5f85",
"assets/assets/images/flutter.jpg": "0452ea5eeb54d3eb3861e9c643535774",
"assets/assets/images/fresher.jpg": "31017c203c75af5fff73ada7022cc3f9",
"assets/assets/images/gmail.mp4": "90d4e4fa1d1622ceeef21c4e478a953e",
"assets/assets/images/instagram.mp4": "60496e1b44bffa7052c6116ca4cfe7c6",
"assets/assets/images/meme.jpg": "bc60e624054b76682685a92e007b4042",
"assets/assets/images/MilaKya.jpg": "efac36152d45f6395467ec86a8e80e4e",
"assets/assets/images/mk.jpg": "10011395c510037cb4b27037b20261bb",
"assets/assets/images/mklogo.jpg": "c4fea71202613bc45d9cc5b7d6a9915d",
"assets/assets/images/norisk.jpg": "8238399376b6d9525549ad139230cd55",
"assets/assets/images/Portfolio.jpg": "cab73f17899c68ea48643c8ea8cbf4c2",
"assets/assets/images/poster.jpg": "7bb28bdd5c2a76878eda9ccf56ab2bd8",
"assets/assets/images/ssm.jpg": "e13eacb4e26c1c0247c7fea26ead3a4d",
"assets/assets/images/techquest.jpg": "b02b28eb8301f48696750c9891c0b060",
"assets/assets/images/youtube.mp4": "9f309641c719a2a709bc5b3dae43aeab",
"assets/FontManifest.json": "1ad83d32f2a066dd288318d0a7b62eb9",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "42a41cac1c4697f5389122b8820706a2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00bb2b684be61e89d1bc7d75dee30b58",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "4b6a9b7c20913279a3ad3dd9c96e155b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dffd9504fcb1894620fa41c700172994",
"assets/packages/glass_kit/assets/noise.png": "86f22ae1a498bb8f0c39264f9c7c796c",
"favicon.png": "ce485c0b708dfb27c410ca4777d6ddca",
"icons/icon-192.png": "ce485c0b708dfb27c410ca4777d6ddca",
"icons/icon-512.png": "ce485c0b708dfb27c410ca4777d6ddca",
"index.html": "36f7cad77a17b254e33d8cc443f33994",
"/": "36f7cad77a17b254e33d8cc443f33994",
"main.dart.js": "bc5f4fba72f13c025909b5ec66d1125d",
"manifest.json": "094d198390224787ffb8de3f84abcdae",
"style.css": "f7a0cc8401a07421c9543df1d9ddcf7f",
"version.json": "04be62a3b332b49d521b746d40aad974"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
