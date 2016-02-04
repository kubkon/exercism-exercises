pub fn hamming_distance<'a>(left: &str, right: &str) -> Result<usize, &'a str> {
    if left.len() != right.len() {
        return Err("inputs of different length");
    }
    Ok(left.chars()
           .zip(right.chars())
           .filter(|&(c1, c2)| c1 != c2)
           .fold (0, |acc, _| acc + 1))
}
