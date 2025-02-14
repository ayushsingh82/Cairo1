use array::ArrayTrait;
use array::ArrayTCloneImpl;
use array::SpanTrait;
use clone::Clone;
use debug::PrintTrait;

fn main() {
    let mut arr1 = fill_arr();

    arr1.clone().print();

    arr1.append(88);

    arr1.clone().print();
}

// Modify the function signature to create and return the Array
fn fill_arr() -> Array<felt252> {
    let mut arr = ArrayTrait::<felt252>::new();

    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
