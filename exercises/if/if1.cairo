// if1.cairo


fn bigger(a: usize, b: usize) -> usize {
    if a > b {
        a
    } else {
        b
    }
}

// Don't mind this for now :)
#[cfg(test)]
mod tests {
    use super::bigger;

    #[test]
    fn ten_is_bigger_than_eight() {
        assert!(10 == bigger(10, 8), "10 is bigger than 8");
    }

    #[test]
    fn fortytwo_is_bigger_than_thirtytwo() {
        assert!(42 == bigger(32, 42), "42 is bigger than 32");
    }
}
