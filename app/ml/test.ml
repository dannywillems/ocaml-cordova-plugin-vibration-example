let mario_bross =
  let int_array : int Js.js_array Js.t = new%js Js.array_length 14 in
  Js.array_set int_array 0 125;
  Js.array_set int_array 1 75;
  Js.array_set int_array 2 125;
  Js.array_set int_array 3 275;
  Js.array_set int_array 4 200;
  Js.array_set int_array 5 275;
  Js.array_set int_array 6 125;
  Js.array_set int_array 7 75;
  Js.array_set int_array 8 125;
  Js.array_set int_array 9 275;
  Js.array_set int_array 10 200;
  Js.array_set int_array 11 600;
  Js.array_set int_array 12 200;
  Js.array_set int_array 13 600;
  int_array

let imperial_march =
  let int_array : int Js.js_array Js.t = new%js Js.array_length 17 in
  Js.array_set int_array 0 500;
  Js.array_set int_array 1 110;
  Js.array_set int_array 2 500;
  Js.array_set int_array 3 110;
  Js.array_set int_array 4 450;
  Js.array_set int_array 5 110;
  Js.array_set int_array 6 200;
  Js.array_set int_array 7 110;
  Js.array_set int_array 8 170;
  Js.array_set int_array 9 40;
  Js.array_set int_array 10 450;
  Js.array_set int_array 11 110;
  Js.array_set int_array 12 200;
  Js.array_set int_array 13 110;
  Js.array_set int_array 14 170;
  Js.array_set int_array 15 40;
  Js.array_set int_array 16 500;
  int_array

let onload _ =
  (* Mario Bross *)
  (*Vibration.navigator##(vibrate_pattern mario_bross);*)
  (* Imperial March *)
  Vibration.navigator##(vibrate_pattern imperial_march);

  Js._false

let _ = Dom_html.window##.onload := Dom_html.handler onload
