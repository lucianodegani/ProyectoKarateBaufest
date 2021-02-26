package PetStores;

import com.intuit.karate.junit5.Karate;

public class PetStore {
    @Karate.Test
    Karate testPets() {
        return Karate.run("Pets").relativeTo(getClass());
    }

}