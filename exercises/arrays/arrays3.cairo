// arrays3.cairo

use array::ArrayTrait;
use option::OptionTrait;

fn create_array() -> Array<felt252> {
    let mut a = ArrayTrait::new(); // Change here to use mut
    a.append(0);
    a.append(1);
    a.append(2);
    a.pop_front().unwrap();
    a
}

#[test]
fn test_arrays3() {
    let mut a = create_array();
    // Change the method called to get the element at index 2
    assert_eq!(a.get(2).unwrap(), 2);
}
