use std::collections::HashMap;

pub struct CodonTable {
    amino_acids: HashMap<String, String>,
}

impl CodonTable {
    pub fn name_for<'a>(&'a self, codon: &str) -> Result<&'a str, &'a str> {
        match self.amino_acids.get(&String::from(codon)) {
            Some(ref v) => Ok(&v),
            None => Err("error"),
        }
    }
}

pub fn parse(pairs: Vec<(&str, &str)>) -> CodonTable {
    CodonTable {
        amino_acids: pairs.iter()
                          .fold(HashMap::new(), |mut acc, &(c, n)| {
                              let codon = String::from(c);
                              let name = String::from(n);
                              acc.insert(codon, name);
                              acc
                          })
    }
}

