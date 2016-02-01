pub fn anagrams_for<'a>(string: &str, inputs: &[&'a str]) -> Vec<&'a str> {
    let sort = |s: String| {
        let mut chars = s.chars().collect::<Vec<char>>();
        chars.sort();
        chars
    };
    let allowed_inputs = inputs.iter().filter(|&s| s.to_lowercase() != string.to_lowercase());
    allowed_inputs.filter(|&s| sort(s.to_lowercase()) == sort(string.to_lowercase()))
                  .fold(vec![], |mut acc, &s| { acc.push(s); acc })
}
