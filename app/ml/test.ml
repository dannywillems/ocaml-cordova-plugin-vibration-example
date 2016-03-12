let doc = Dom_html.document

let mario_bross =
  Js.array [|125;75;125;275;200;275;125;75;125;275;200;600;200;600|]

let imperial_march =
  Js.array [|500;110;500;110;450;110;200;110;170;40;450;110;200;110;170;40;500|]

let on_device_ready _ =
  let v = Vibration.vibration () in
  let but_bross = Dom_html.createButton doc in
  let but_imperial = Dom_html.createButton doc in
  let but_stop = Dom_html.createButton doc in
  but_bross##.innerHTML := Js.string "Mario Bross";
  but_imperial##.innerHTML := Js.string "Imperial March";
  but_stop##.innerHTML := Js.string "Stop";
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks but_imperial
    ( fun _ev _thread -> v##(vibrate_pattern imperial_march); Lwt.return ())
  );
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks but_bross
    ( fun _ev _thread -> v##(vibrate_pattern mario_bross); Lwt.return ())
  );
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks but_stop
    ( fun _ev _thread -> v##(cancelVibration); Lwt.return ())
  );
  Dom.appendChild doc##.body but_bross;
  Dom.appendChild doc##.body but_imperial;
  Dom.appendChild doc##.body but_stop;
  Js._false

let _ =
  Dom.addEventListener doc (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
