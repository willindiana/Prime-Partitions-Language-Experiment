
let rec inputLoop() =
  print_string "Enter a number (non-number to quit): ";
  let num = read_int () in
    Printf.printf "%d\n" num;
  inputLoop();;

inputLoop()
