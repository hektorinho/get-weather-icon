(lang dune 3.14)

(name weather)

(generate_opam_files true)

(source
 (github hektorinho/get-weather-icon))

(authors "Hektor Suhr")

(maintainers "Hektor Suhr")

(license GNU)

(package
 (name weather)
 (synopsis "get weather icon")
 (description "Insert a lat and long and receive a weather icon svg to stdout")
 (depends ocaml dune)
 (tags
  (topics "weather" "icon")))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
