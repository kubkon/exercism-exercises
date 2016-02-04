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

#[derive(Clone,Debug)]
pub struct Allergies(pub u16);

impl Allergies {
    pub fn allergies(&self) -> Vec<Allergen> {
        Vec::new()
    }
    
    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        allergen.clone() as u16 & self.0 > 0
    }
}
