(* let () = *)
(*   let fname = Weather.get_icon in *)
(*   let svg = Stdio.In_channel.with_file fname ~f:Stdio.In_channel.input_all in *)
(*   print_endline svg *)

module Cmd = struct
  type t = { longitude : float; latitude : float }

  let usage =
    "cmdarg [-lon <longitude>] [-lat <latitude>]\n\n\
    \  Returns svg icon to stdout."

  let parse () =
    let longitude = ref 0.0 in
    let latitude = ref 0.0 in

    let specs =
      [
        ("-lon", Arg.Set_float longitude, "Longitudinal position.");
        ("-lat", Arg.Set_float latitude, "Latitudinal position.");
      ]
    in
    let anon s = print_endline s in
    Arg.parse specs anon usage;

    { longitude = !longitude; latitude = !latitude }
end

let () =
  let { Cmd.longitude; Cmd.latitude } = Cmd.parse () in
  let icon = Weather.get_icon longitude latitude in
  print_endline icon
