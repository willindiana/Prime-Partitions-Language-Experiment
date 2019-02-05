open Printf

let rec isPrime a b =
    if a == 1 then
      false
    else if b < 2 then 
      true
    else if a mod b == 0 then
      false
    else
      isPrime a (b - 1)

let rec primes start stop lst = 
  if start > stop then
    lst
  else
    if isPrime start (start - 1) then
      primes (start + 1) stop (lst @ [start])
    else
      primes (start + 1) stop lst

let rec primePartitions n k lst =
  if n == 0 then
    List.iteri (fun i s -> 
      if i != (List.length lst) - 1 then 
        printf "%d + " s
      else 
        printf "%d \n" s
      ) lst
  else if n > k then
    List.iter (fun p ->
      primePartitions (n - p) p (lst @ [p])
    ) (primes (k + 1) n [])

let rec inputLoop () =
  print_string "Enter a number (non-number to quit): ";
  let num = read_int () in 
    primePartitions num 1 [];
  inputLoop();;

inputLoop()