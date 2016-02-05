use std::collections::HashMap;

pub fn count(ch: char, s: &str) -> usize {
    s.chars().filter(|&c| c == ch).count()
}

pub fn nucleotide_counts(s: &str) -> HashMap<char, usize> {
    let mut map = HashMap::new();
    map.insert('A', 0);
    map.insert('T', 0);
    map.insert('C', 0);
    map.insert('G', 0);
    for (k, v) in map.iter_mut() {
        *v = count(*k, s);
    }
    map
}
