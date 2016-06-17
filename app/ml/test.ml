let doc = Dom_html.document

let mario_bross =
  [|125;75;125;275;200;275;125;75;125;275;200;600;200;600|]

let imperial_march =
  [|500;110;500;110;450;110;200;110;170;40;450;110;200;110;170;40;500|]

let on_device_ready () =
  let but_bross = Dom_html.createButton doc in
  let but_imperial = Dom_html.createButton doc in
  let but_stop = Dom_html.createButton doc in

  but_bross##.innerHTML := Js.string "Mario Bross";
  but_imperial##.innerHTML := Js.string "Imperial March";
  but_stop##.innerHTML := Js.string "Stop";

  but_imperial##.onclick := Dom.handler
  (
    fun e -> ignore (Cordova_vibration.vibrate_pattern imperial_march); Js._false
  );

  but_bross##.onclick := Dom.handler
  (
    fun e -> ignore (Cordova_vibration.vibrate_pattern mario_bross); Js._false
  );

  but_stop##.onclick := Dom.handler
  (
    fun e -> Cordova_vibration.cancel (); Js._false
  );

  Dom.appendChild doc##.body but_bross;
  Dom.appendChild doc##.body but_imperial;
  Dom.appendChild doc##.body but_stop

let _ =
  Cordova.Event.device_ready on_device_ready
