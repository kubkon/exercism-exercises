pub fn anagrams_for<'a>(string: &str, inputs: &[&'a str]) -> Vec<&'a str> {
    let sort = |s: &String| {
        let mut chars = s.chars().collect::<Vec<char>>();
        chars.sort();
        chars
    };
    let string_lower = string.to_lowercase();
    inputs.iter()
          .filter(|&s| {
              let s_lower = s.to_lowercase();
              s_lower != string_lower && sort(&s_lower) == sort(&string_lower)
          })
          .cloned()
          .collect()
}
