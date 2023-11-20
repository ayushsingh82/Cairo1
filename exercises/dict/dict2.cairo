// dict2.cairo

// Assume Felt252Dict is defined as follows:
// struct Felt252Dict<T> {
//     keys: felt252[],
//     values: T[],
// }

fn multiply_element_by_10(ref dict: Felt252Dict<u32>, n: usize) {
    // Iterate over the indexes from 0 to n and multiply corresponding values by 10
    for i in 0..=n {
        dict.values[i] *= 10;
    }
}

// Don't change anything in the test
#[test]
#[available_gas(2000000000)]
fn test_3() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 3);

    multiply_element_by_10(ref dict, 2);

    assert(dict.get(0) == 10, 'First element is not 10');
    assert(dict.get(1) == 20, 'Second element is not 20');
    assert(dict.get(2) == 30, 'Third element is not 30');
}

#[test]
#[available_gas(200000000)]
fn test_4() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 5);
    dict.insert(3, 10);

    multiply_element_by_10(ref dict, 3);

    assert(dict.get(2) == 50, 'First element is not 50');
    assert(dict.get(3) == 100, 'First element is not 100');
}
