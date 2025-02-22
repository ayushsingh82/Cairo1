use array::ArrayTrait;
use array::ArrayTCloneImpl;
use array::SpanTrait;
use clone::Clone;
use debug::PrintTrait;

fn main() {
    let arr0 = ArrayTrait::new();

    // Change the following line to clone arr0
    let mut arr1 = fill_arr(arr0.clone());

    arr1.clone().print();

    arr1.append(88);

    arr1.clone().print();
}

fn fill_arr(arr: Array<felt252>) -> Array<felt252> {
    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
