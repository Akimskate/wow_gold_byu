'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"main.dart.js": "6a45d54770112ae53981d0542ecaf162",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/AssetManifest.bin": "d8369a0b649469db6efa111f96e5739e",
"assets/AssetManifest.json": "fda587cd943a08a2b73295bb0e9816dc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/images/morjik.png": "1210813462a5ec56cc29e36a6e3692ef",
"assets/images/icon.png": "b31269aabaa3eb6665994547ef41eb2f",
"assets/images/dungeon.jpg": "61d4aff16584883740c520e1b32f664b",
"assets/images/background.png": "be96b7e02989786a4324a68426f7fb98",
"assets/images/background2.png": "a3c6dad4e3853577f9c35eb62634a257",
"assets/images/mobile.gif": "76c0ea0a013a35c28cb066a34efab0f5",
"assets/images/lich_king.jpeg": "674f324c923b1195f7daed3847a9ae7b",
"assets/images/goldie.jpg": "9173784fdb3f290f14b223d0630900c1",
"assets/images/desktop.gif": "f708a5c3a357f96ab2f8377882099add",
"assets/images/wow.jpg": "93e92b890a67841665e6a6c54ddb4817",
"assets/images/gryphon.jpg": "f3572adc76fe25afecb381039e61b656",
"assets/images/ogre.jpg": "4d96f7dd82e695dfa281a0f995d515f5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/NOTICES": "34398b7a37712566b06e67334c8a815f",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "dfde38f19a170766a4edafb753fb765c",
"index.html": "84518f8a2ce50adb683a0fa19b7ab207",
"/": "84518f8a2ce50adb683a0fa19b7ab207",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
".git/config": "3605246c9d1e308493d7e5dccd0e9181",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/fsmonitor-watchman.sample": "db4d62db2039e4bec38baa7567788284",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/index": "538ce6944c2804b9b2b066778f35af33",
".git/logs/refs/remotes/origin/main": "e4efea58968ea42a2dcb946f8924454c",
".git/logs/refs/heads/main": "79bb7effccb11a5cf14bd3b4e12ae27b",
".git/logs/HEAD": "9350c549e3c79fa50de1345e960b7b36",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/refs/remotes/origin/main": "f7da03a27666a0522b32af24021cbd10",
".git/refs/heads/main": "f7da03a27666a0522b32af24021cbd10",
".git/objects/03/682070dfb3f86ee13fb4bd10ec9893b20fd036": "4c7af25ef5e49db61a3e3deb5f226e4b",
".git/objects/54/e4c224bd5933f5bf45d3ebaf854dd9013df54e": "32d48b8b53a2f21f290fe2b732e07a62",
".git/objects/54/05d94f2d12d2f549dcfdefacb9c258832162a2": "a2777bc738e66c40d42f7f4cc9e29eb9",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "d7280a766a5d6033f187d874a92b5ad6",
".git/objects/0d/69347203ee3564c3d3b574793ad7b8b0f00807": "0f07ea6e453466fc90f3689511c5175f",
".git/objects/70/0bb63d2ca411b53b2a7e460402abfd779f866e": "a3368c1b728d17c95a8655ecb2d4f222",
".git/objects/73/7b02018b4157bcf6cabbb586334c8ea71c252f": "8605da53ac76473f750203ab980a5a44",
".git/objects/3c/37e9aff47b5ae089317beb791cb440511cbf81": "5f6564d2a8c12fe40aa4a2c60f521ed5",
".git/objects/74/3f6ccbcca2a65ce3047fc473bfb178523007d7": "c088c7e1a925a492e2d55f3b3a0951ce",
".git/objects/6d/013f2ba652ef5389009c1990280bb0835138d7": "395700096bb69e41c06c05bc7d258b77",
".git/objects/e6/46d591f99adb142edab348e5d728ad2bddc4a3": "7630b34441d494db3bf4d884cd250e72",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "2933b2b2ca80c66b96cf80cd73d4cd16",
".git/objects/fc/de1bb3df8c330568f07ef326d43d8ae3562897": "6e5bf2450330342c243afc3723b9c27e",
".git/objects/e7/9762bfa58e7d403d3b57c67d18fc2240575be2": "cfd69e7abc7da5c3b707abb49f531d5a",
".git/objects/c2/d8d2f44dd987786bbc249d4ad7bac3360f4811": "1926a57b256d9def261ccf6dc2914f65",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/9d/5f886353dcff6c222439cc1118e77eb1b007ea": "a87ff240c6e149d1ce495643e49417f9",
".git/objects/0f/b76edf4a239b08618fef21ea5d0db6f1cf2545": "602ce94174647d1b972000efb28435f9",
".git/objects/fa/81d0cc454e3cb76ad2b16e97d09d6e390c48ba": "9190dbcf22d3f0b88a877e19fbdd02ae",
".git/objects/c5/5fb620c44468ac520192fa4d6d71f5e8846e7f": "f56f66d0a2afe42872e8bc60edde2816",
".git/objects/e0/49c81f7cb35ebc411a3e1b547bf4ccf91292e8": "efad70dc0ca77a90ee53b5cc3be528ca",
".git/objects/e0/2012ca0a73da86edd7614aebdc24f350669305": "4cb516f7f367eb8387729d8cfc7cf9b2",
".git/objects/d5/b54bd4a898b373f82bb1fa52b9580e7a976e3e": "943e27e1d359e2bc22daf20c70287c19",
".git/objects/f5/33b1829145f5be97c0a618edbd8dc3449a2035": "438581062c2a87449d95a28fd491d391",
".git/objects/f5/e85a64f869e6a9f53e0e960efb325229027095": "847af237cf5489494238900b5c4dae68",
".git/objects/35/91af41948adc8001f3586d76b91181311953fc": "c91d33b29071dcff3b2b3385383761cb",
".git/objects/e2/ff5865b192241d53935e77de70a4e6dff2847a": "cad1058aedc6c21a518b3cb00af21fac",
".git/objects/e2/df724f675f821c52e288f89c7bd02f31de1cdb": "551ac4ed5032203c5d534d4bdf7c4b6e",
".git/objects/50/8ea67e0cc3a6b96471b8c114731d84a4c67a42": "d31107a701cf4df1616248b95e98cc73",
".git/objects/bb/ac29f5ef7a40bf14c0901bc1457724156bc0de": "1393f20f0610cabefe2d4f45865b0f54",
".git/objects/e5/83a98283a15d1f20283eeb8980ea827c621852": "c6dd86adfa4797540287b72205bd8da8",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/5f/bddd70fc523c758dabe02f2c93a4ff0c70a0ea": "139e1952fd57350a73869597b7c07210",
".git/objects/3f/7bdb6316ba896b644e9c9fd8d702cd0beeef23": "9f9cab5720bf2f8a11b2ed093c12b6cb",
".git/objects/98/7065d6cde50911a51aa72f5f94927d9b050b62": "b88b06e31fb4f8c85786632faa12b4eb",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/b3/902bdc8944f2f20f5233dea6be36f61f6ebf06": "13bc23ab436a69f6240ba49a4587247d",
".git/objects/df/7d2dcb89ab89da87467c0e1059b38c8d8f9296": "a44162ff357b024e4638ab18a9bb01c7",
".git/objects/53/d2ad4fbbf69712366d870f455011165a85131c": "b8f6d2deea5dd37af00b1f7f89fb56a2",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "970aec5149a3dbe9370a9dc982cdd022",
".git/objects/fd/b4f4a2d68a6faced07a4f225fb98e73c41fbdb": "6545ceb7fb0bb07b5b262282d730f652",
".git/objects/57/45578762c51e7e48deccb9a945fcd0248aedec": "cf37ed0bc787787023d15789a61bb145",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/8a/d41123112dcc05e645c65693277074ac106233": "3de645de309caa9346a728f03e403fdd",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/d3/efa7fd80d9d345a1ad0aaa2e690c38f65f4d4e": "610858a6464fa97567f7cce3b11d9508",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/a5/7a8dd3d1ff3284da9df8a52d1842eb1dc77838": "6cba2cdf2c566c5939c5035287219f2c",
".git/objects/97/8746b5424d1212460133977131fc5ef0971abb": "3cc094294d4d3275ff02b12eff5e10c3",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/44/9a2d278f30204f3980c27e5928d8af124a79fc": "c3c9e591654a8387bca9a3d2a70fc674",
".git/objects/a6/c7d0d16c9f22613c673c075142a6ae396d2d45": "67b240fca0038edb8ade3a036e3e8be2",
".git/objects/a6/a68b1ea9d65ca4624d8cb98be21ed7933fe8ab": "d1f3640a12feab7754aa34e586118a89",
".git/objects/6a/dfcb9dc8e64df91c7535974774eaadff8535ff": "55d24695c1fcf868fc13cb8b1df45918",
".git/objects/6a/d5537f8f0b56182a3b62a9d06d4bef2275d3b1": "db01c3dfccc990b1b70715596396833b",
".git/objects/cc/5725b315760d100f6386e6bbf09af8fe57a9f1": "29c19352d2bee0821600856656c95791",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/COMMIT_EDITMSG": "1a28977532cf772a8d7fdf121f582911",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "ca271f3bdd9421ead996b28e49bf30b6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
