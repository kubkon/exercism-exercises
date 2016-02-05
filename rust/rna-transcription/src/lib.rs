use std::iter::FromIterator;

#[derive(Clone,Debug,PartialEq)]
pub struct RibonucleicAcid {
    strand: String,
}

impl RibonucleicAcid {
    pub fn new(strand: &str) -> RibonucleicAcid {
        RibonucleicAcid { strand: String::from(strand) }
    }

    pub fn as_ref<'a>(&'a self) -> &'a str {
        &self.strand
    }
}

#[derive(Clone,Debug,PartialEq)]
pub struct DeoxyribonucleicAcid {
    strand: String,
}

impl DeoxyribonucleicAcid {
    pub fn new(strand: &str) -> DeoxyribonucleicAcid {
        DeoxyribonucleicAcid { strand: String::from(strand) }
    }

    pub fn to_rna(&self) -> RibonucleicAcid {
        let transcribe = |c| {
            match c {
                'G' => 'C',
                'C' => 'G',
                'T' => 'A',
                'A' => 'U',
                _   => panic!("That should not happen!"),
            }
        };
        let rna_strand = String::from_iter(self.strand.chars().map(transcribe));
        RibonucleicAcid::new(&rna_strand)
    }
}
