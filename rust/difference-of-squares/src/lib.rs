pub fn square_of_sum(n: usize) -> usize {
    // arithmetic series squared
    (n * (n + 1) / 2).pow(2)
}

pub fn sum_of_squares(n: usize) -> usize {
    // square pyramidal number
    n * (n + 1) * (2 * n + 1) / 6
}

pub fn difference(n: usize) -> usize {
    square_of_sum(n) - sum_of_squares(n)
}
