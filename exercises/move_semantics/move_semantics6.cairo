use debug::PrintTrait;

#[derive(Debug)]
struct Number {
    value: u32,
}

fn main() {
    let mut number = Number { value: 1111111 };

    get_value(number);

    // Update number by taking ownership of the modified Number
    number = set_value(number);

    // Now you can print the updated number
    number.value.print();
}

// Should not take ownership and not modify the variable passed.
fn get_value(number: Number) -> u32 {
    number.value
}

// Should take ownership and return the modified Number
fn set_value(mut number: Number) -> Number {
    let value = 2222222;
    number.value = value;
    number
}
