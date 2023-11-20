// dict1.cairo

// Assume Felt252Dict is defined as follows:
// struct Felt252Dict<T> {
//     keys: felt252[],
//     values: T[],
// }

fn create_dictionary() -> Felt252Dict<u32> {
    let mut dict: Felt252Dict<u32> = Default::default();

    // Inserting elements into the dictionary
    dict.keys.push('A');
    dict.values.push(1);

    dict.keys.push('B');
    dict.values.push(2);

    dict.keys.push('b'); // Note: Key 'b' is used instead of 'bob' to match the provided test
    dict.values.push(3);

    dict
}

// Don't change anything in the test
#[test]
#[available_gas(200000)]
fn test_dict() {
    let mut dict = create_dictionary();
    assert(dict.get('A') == 1, 'First element is not 1');
    assert(dict.get('B') == 2, 'Second element is not 2');
    assert(dict.get('b') == 3, 'Third element is not 3');
}
