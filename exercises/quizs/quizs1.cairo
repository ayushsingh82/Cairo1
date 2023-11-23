// Put your function here!
fn calculate_price_of_apples(quantity: usize) -> usize {
    if quantity > 40 {
        quantity * 2
    } else {
        quantity * 3
    }
}

// Do not change the tests!
#[test]
fn verify_test() {
    let price1 = calculate_price_of_apples(35);
    let price2 = calculate_price_of_apples(40);
    let price3 = calculate_price_of_apples(41);
    let price4 = calculate_price_of_apples(65);

    assert_eq!(105, price1, "Incorrect price");
    assert_eq!(120, price2, "Incorrect price");
    assert_eq!(82, price3, "Incorrect price");
    assert_eq!(130, price4, "Incorrect price");
}
