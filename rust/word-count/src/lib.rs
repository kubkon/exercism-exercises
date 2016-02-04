use std::collections::HashMap;

pub fn word_count<'a>(s: &'a str) -> HashMap<String, u32> {
    s.trim();
    s.split_whitespace()
     .fold(HashMap::new(), |mut acc, s| {
         let key = s.to_string();
         let count = match acc.get(&key) {
             None => 1,
             Some(count) => *count + 1,
         };
         acc.insert(key, count);
         acc
     })
}
