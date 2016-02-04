#[derive(Clone,Debug,PartialEq)]
pub enum Allergen {
    Eggs         = 1,
    Peanuts      = 2,
    Shellfish    = 4,
    Strawberries = 8,
    Tomatoes     = 16,
    Chocolate    = 32,
    Pollen       = 64,
    Cats         = 128,
}

impl Allergen {
    pub fn new(n: u16) -> Allergen {
        match n {
            1  => Allergen::Eggs,
            2  => Allergen::Peanuts,
            4  => Allergen::Shellfish,
            8  => Allergen::Strawberries,
            16 => Allergen::Tomatoes,
            32 => Allergen::Chocolate,
            64 => Allergen::Pollen,
            _  => Allergen::Cats,
        }
    }
}

#[derive(Clone,Debug)]
struct AllergenIterator {
    count: u32,
}

impl AllergenIterator {
    pub fn new() -> AllergenIterator {
        AllergenIterator { count: 0 }
    }
}

impl Iterator for AllergenIterator {
    type Item = Allergen;

    fn next(&mut self) -> Option<Allergen> {
        self.count += 1;

        if self.count < 9 {
            Some(Allergen::new(2u16.pow(self.count - 1)))
        } else {
            None
        }
    }
}

#[derive(Clone,Debug)]
pub struct Allergies(pub u16);

impl Allergies {
    pub fn allergies(&self) -> Vec<Allergen> {
        AllergenIterator::new().filter(|x| self.is_allergic_to(x))
                               .collect()
    }
    
    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        allergen.clone() as u16 & self.0 > 0
    }
}
