open Core
open Yojson
open Lwt
open Cohttp
open Cohttp_lwt_unix

type json =
  [ `Assoc of string * json
  | `Bool of bool
  | `Float of float
  | `Int of int
  | `List of json list
  | `Null
  | `String of string ]

(* SAMPLE URL ::
   https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41
   &current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,weather_code
   &hourly=temperature_2m,relative_humidity_2m,dew_point_2m,precipitation_probability,precipitation,rain,showers,snowfall,snow_depth,weather_code
   &daily=temperature_2m_max&timezone=America%2FNew_York&forecast_days=1 *)

(* let latitude = 41.25 *)
(* let longitude = -72.45 *)
let base_url = "https://api.open-meteo.com/v1/forecast?"
let return_parameters = "&current=temperature_2m,weather_code"

let _body lat lon =
  let url =
    base_url ^ "latitude=" ^ Float.to_string lat ^ "&longitude="
    ^ Float.to_string lon ^ return_parameters
  in
  Client.get (Uri.of_string url) >>= fun (resp, body) ->
  let code = resp |> Response.status |> Code.code_of_status in
  match code with
  | 200 -> body |> Cohttp_lwt.Body.to_string >|= fun body -> body
  | _ -> failwith "couldn't pull weather data from open-meteo"

let body lat lon = Lwt_main.run (_body lat lon)

let weather_code js =
  let current = Basic.from_string js |> Basic.Util.member "current" in
  let wc = Basic.Util.member "weather_code" current |> Basic.Util.to_int in
  wc

let get_icon lat lon =
  let n = body lat lon |> weather_code |> Int.to_string in
  "./icons/" ^ n ^ ".svg"
