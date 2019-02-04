use std::io::{self, Write};
use std::fmt::Display;
use std::process;

fn main() {
    loop {
        let n: i32 = grab_input("Enter a number (non-number to quit)")
            .unwrap_or_else(|e| exit_err(&e, e.raw_os_error().unwrap_or(-1)))
            .trim()
            .parse()
            .unwrap_or_else(|e| exit_err(&e, 2));
        prime_partitions(n, 1, Vec::new());
    }
}
 
fn grab_input(msg: &str) -> io::Result<String> {
    let mut buf = String::new();
    print!("{}: ", msg);
    try!(io::stdout().flush());
 
    try!(io::stdin().read_line(&mut buf));
    Ok(buf)
}
 
fn exit_err<T: Display>(msg: T, code: i32) -> ! {
    let _ = writeln!(&mut io::stderr(), "Exited: {}", msg);
    process::exit(code)
}

fn is_prime(n: i32) -> bool {
    if n <= 1 {
        return false;
    }

    for x in 2..(n - 1) {
        if n % x == 0 {
            return false;
        }
    }

    return true;
}

fn primes(a: i32, b: i32) -> Vec<i32> {
    let mut v: Vec<i32> = Vec::new();
    for x in a..(b+1) {
        if is_prime(x) {
            v.push(x);
        }
    }
    return v;
}

fn prime_partitions(n: i32, k: i32, mut v: Vec<i32>) {
    if n == 0 {
        print_sequence(v);
    }

    else if n > k {
        for p in primes(k + 1, n) {
            v.push(p);
            prime_partitions(n - p, p, v.clone());
            v.pop();
        }
    }
}

fn print_sequence(v: Vec<i32>) {
    let mut i = v.iter();
    let mut x = i.next();

    print_option(x, "".to_string());

    x = i.next();
    while x != None {
        print_option(x, " + ".to_string());
        x = i.next();
    }
    print!("\n");
}

fn print_option(option: Option<&i32>, text: String) {
    match option {
        Some(option) => print!("{}{:?}", text, option),
        None => print!("Error!")
    }
}