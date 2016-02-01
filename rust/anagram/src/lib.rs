pub fn anagrams_for<'a>(string: &str, inputs: &[&'a str]) -> Vec<&'a str> {
    let sort_string = |s: String| {
        let mut chars = s.chars().collect::<Vec<char>>();
        chars.sort();
        chars
    };
    let sorted_string = sort_string(string.to_lowercase());
    let allowed_inputs = inputs.iter().filter(|&s| s.to_lowercase() != string.to_lowercase());
    allowed_inputs.filter(|&s| sort_string(s.to_lowercase()) == sorted_string)
                  .fold(vec![], |mut acc, &s| { acc.push(s); acc })
}
