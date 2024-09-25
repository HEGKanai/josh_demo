package bootful.service.adoptions;

import org.springframework.data.annotation.Id;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Map;

@ResponseBody
@Controller
class AdoptionsController {

    private final DogRepository dogRepository;

    AdoptionsController(DogRepository dogRepository){
        this.dogRepository = dogRepository;
    }

    @GetMapping("/dogs")
    Collection<Dog> dogs(){
        return this.dogRepository.findAll();
    }

    @PostMapping("/dogs/{dogId}/adoptions")
    void adopt(@PathVariable Integer dogId,
               @RequestBody Map<String,String> adopter){
        var name = adopter.get("name");
        this.dogRepository
                .findById(dogId)
                .ifPresent(dog -> {
                   var nDog = new Dog(dog.id(), name, dog.name(), dog.description());
                   this.dogRepository.save(nDog);
                });
    }
}

interface DogRepository extends ListCrudRepository<Dog, Integer> {

}

record Dog(@Id Integer id, String owner, String name, String description){

}
