with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors; use Ada.Containers;


procedure primeada is

  package Integer_Vectors is new Vectors(Natural, Integer);

function is_prime (n: Integer) return Boolean is
  Target : Integer := n;
  Result : Boolean := True;
  begin
    Target := n;

    if Target > 1 then
      for N in Integer range 2..(Target-1) loop
        if Target mod N = 0 then
          return False;
        end if;
      end loop;
    else
      return False;
    end if;

    return True;
  end is_prime;

function primes (a: Integer; b: Integer) return Integer_Vectors.Vector is
  prime_numbers : Integer_Vectors.Vector;

  begin
    for N in Integer range a..b loop
      if is_prime(N) then
        prime_numbers.Append(N);
      end if;
    end loop;

  return prime_numbers;
  end primes;

procedure prime_partitions (n: Integer; k: Integer; lst: out Integer_Vectors.Vector) is
  p : Integer;
  begin
    
    if n = 0 then
      for C in lst.Iterate loop
        Put(Integer_Vectors.Element(C));
        if Integer_Vectors.Element(C) /= lst.Last_Element then
          Put(" + ");
        end if;
      end loop;
      new_line(1);
    end if;

    if n > k then
      for C in primes(k+1,n).Iterate loop
        p := Integer_Vectors.Element(C);
        Integer_Vectors.Append(lst,p);
        prime_partitions(n - p, p, lst);
        Integer_Vectors.Delete_Last(lst);
      end loop;
    end if;

    return;
  end prime_partitions;

number : Integer;
prime_nums : Integer_Vectors.Vector;
C : Integer_Vectors.Cursor;

begin

  while True loop
    Put("Enter a number (non-number to quit): ");

    begin
      Get(number);
    exception
      when others => 
        return;
    end;

    prime_partitions(number, 1, prime_nums);

  end loop;

end primeada;
