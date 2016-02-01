pub fn is_leap_year(year: usize) -> bool {
    match year {
        x if x % 4 == 0 && (x % 100 != 0 || x % 400 == 0) => true,
        _ => false,
    }
}
