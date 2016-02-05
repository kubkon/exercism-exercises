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
        RibonucleicAcid::new(&self.strand)
    }
}
