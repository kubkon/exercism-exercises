pub fn anagrams_for<'a>(string: &str, inputs: &[&'a str]) -> Vec<&'a str> {
    let sort = |s: String| {
        let mut chars = s.chars().collect::<Vec<char>>();
        chars.sort();
        chars
    };
    inputs.iter()
          .filter(|&s| s.to_lowercase() != string.to_lowercase())
          .filter(|&s| sort(s.to_lowercase()) == sort(string.to_lowercase()))
          .cloned()
          .collect()
}
