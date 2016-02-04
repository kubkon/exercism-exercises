pub fn hamming_distance<'a>(left: &str, right: &str) -> Result<usize, &'a str> {
    if left.len() != right.len() {
        return Err("inputs of different length");
    }
    Ok(0)
}
