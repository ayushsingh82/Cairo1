use array::ArrayTrait;
use array::ArrayTCloneImpl;
use array::SpanTrait;
use debug::PrintTrait;
use clone::Clone;

fn main() {
    let arr0 = ArrayTrait::new();

    let arr1 = fill_arr(arr0);

    // This is just a print statement for arrays.
    arr1.clone().print();

    // arr1 has been moved into fill_arr, so we use the returned value instead.
    let arr2 = arr1.append(88);

    arr2.clone().print();
}

fn fill_arr(arr: Array<felt252>) -> Array<felt252> {
    let mut arr = arr;

    arr.append(22);
    arr.append(44);
    arr.append(66);

    arr
}
