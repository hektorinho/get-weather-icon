# get-weather-icon
Project that takes a Latitude/Longitude pair and translates it in to a weather icon for your location. It uses the free open meteo API (https://open-meteo.com) to return a weather code that is then translated in to a weather icon.

# Installation

## Dependencies
Need OCaml to build the repo.
```
opam install base core yojson cohttp cohttp-lwt-unix cohttp-async tls tls-lwt
```
## Build
```
git clone https://github.com/hektorinho/get-weather-icon.git
cd get-weather-icon
dune build
```
# Credits:
Thanks to https://erikflowers.github.io/weather-icons/ for icons.
