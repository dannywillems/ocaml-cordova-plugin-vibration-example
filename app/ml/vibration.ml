class type vibration =
  object
    method vibrate : int -> bool Js.t Js.meth
    method vibrate_pattern : int Js.js_array Js.t -> unit Js.meth
    method cancelVibration : unit -> unit Js.meth
  end

let vibration : vibration Js.t = (Js.Unsafe.js_expr "navigator")
