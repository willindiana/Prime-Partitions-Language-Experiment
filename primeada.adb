with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;


procedure primeada is

function is_prime (n: Integer) return Boolean is
  Target : Integer := n;
  Result : Boolean := True;
begin
  Target := n;

  Put_Line("Hello, Prime Function!");



  if Target > 1 then
    for N in Integer range 2..(Target-1) loop
      if Target mod N = 0 then
      Result := False;
      exit;
      end if;
    end loop;
    else
      Result := False;
  end if;

  return Result;
end is_prime;

function primes (a, b: Integer) return Vector is

begin
    Put_Line("Primes Function");

end primes;

function prime_partitions (a, b: Integer) return Vector is

begin
  Put_Line("Prime partitions function");

  retur
end prime_partitions;

  number : Integer;
  prime : Boolean;
begin
   Ada.Text_IO.Put_Line("Prime Partitions Program");
   while True loop
     Put_Line("Enter a number (non-number to quit): ");

     Get(number);


     Put(number);
     new_line(1);

     prime := is_prime(number);

     if prime then
       Put_Line("Prime Number");
     -- end if;

     else
       Put_Line("Not Prime");
     end if;

   end loop;

end primeada;
