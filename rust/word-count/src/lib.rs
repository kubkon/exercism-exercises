extern crate regex;

use regex::Regex;
use std::collections::HashMap;

pub fn word_count<'a>(s: &'a str) -> HashMap<String, u32> {
    let re = Regex::new("[^a-zA-Z0-9]+").unwrap();
    re.split(s)
      .filter(|s| !s.is_empty())
      .fold(HashMap::new(), |mut acc, s| {
          let key = s.to_lowercase().to_string();
          let count = match acc.get(&key) {
              None => 1,
              Some(count) => *count + 1,
          };
          acc.insert(key, count);
          acc
     })
}
