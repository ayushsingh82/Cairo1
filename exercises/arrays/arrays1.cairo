// arrays1.cairo

use array::ArrayTrait;
use option::OptionTrait;

fn create_array() -> Array<felt252> {
    let mut a = ArrayTrait::new(); // Change here to use mut
    a.append(0); // Change the first element to 0
    a.append(1);
    a.append(2);
    a
}

// Don't change anything in the test
#[test]
fn test_array_len() {
    let mut a = create_array();
    a.at(2);
    assert!(a.len() == 3, "Array length is not 3"); // Fix assert syntax
    assert!(a.pop_front().unwrap() == 0, "First element is not 0"); // Fix assert syntax
}