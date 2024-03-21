open Weather

let latitude = 41.25
let longitude = -72.45

let () =
  print_endline "weather data >>>>>>>>>>>>>>>>>>>>>>>>";
  Printf.printf "Body: %s\n" (body latitude longitude);
  let wc = weather_code (body latitude longitude) in
  Printf.printf "Weather Code: %d\n" wc
