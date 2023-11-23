use traits::Into;
use traits::TryInto;
use option::OptionTrait;

fn sum_u8s(x: u8, y: u8) -> u8 {
    x + y
}

// Modify the types of this function to prevent an overflow when summing big values
fn sum_big_numbers(x: u16, y: u16) -> u16 {
    x + y
}

fn convert_to_felt(x: u8) -> felt252 {
    // Return x as a felt252
    x as felt252
}

fn convert_felt_to_u8(x: felt252) -> u8 {
    // Return x as a u8
    x.try_into().unwrap_or_default()
}

#[test]
fn test_sum_u8s() {
    assert(sum_u8s(1, 2_u8) == 3_u8, "Something went wrong");
}

#[test]
fn test_sum_big_numbers() {
    // Modify this test to use the correct integer types.
    // Don't modify the values, just the types.
    // See how using the _u8 suffix on the numbers lets us specify the type?
    // Try to do the same thing with other integer types.
    assert(sum_big_numbers(255_u16, 255_u16) == 510_u16, "Something went wrong");
}

#[test]
fn test_convert_to_felt() {
    assert(convert_to_felt(1_u8) == 1, "Type conversion went wrong");
}

#[test]
fn test_convert_to_u8() {
    assert(convert_felt_to_u8(1) == 1_u8, "Type conversion went wrong");
}
