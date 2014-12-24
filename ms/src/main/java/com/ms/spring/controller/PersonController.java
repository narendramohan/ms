package com.ms.spring.controller;

import java.sql.Date;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ms.spring.model.Person;
import com.ms.spring.repository.PersonRepository;

@Controller
public class PersonController {

    private static final String SEARCH_VIEW_KEY = "redirect:search.html";
    private static final String SEARCH_MODEL_KEY = "persons";

    private final PersonRepository repository;

    @Autowired
    public PersonController(PersonRepository repository) {
        this.repository = repository;
    }

    /**
     * For every request for this controller, this will 
     * create a person instance for the form.
     */
    @ModelAttribute
    public Person newRequest(@RequestParam(required=false) Integer id) {
        return (id != null ? repository.findOne(id) : new Person());
    }

    /**
     * <p>Person form request.</p>
     * 
     * <p>Expected HTTP GET and request '/person/form'.</p>
     */
    @RequestMapping(value="/person/form", method=RequestMethod.GET)
    public void form() {}
    
    /**
     * <p>Saves a person.</p>
     * 
     * <p>Expected HTTP POST and request '/person/form'.</p>
     */
    @RequestMapping(value="/person/form", method=RequestMethod.POST)
    public Person form(Person person, Model model) {
        if (person.getCreated() == null) {
            person.setCreated(new Date(0));
        }

        Person result = repository.saveAndFlush(person);
        
        model.addAttribute("statusMessageKey", "person.form.msg.success");
        
        return result;
    }

    /**
     * <p>Deletes a person.</p>
     * 
     * <p>Expected HTTP POST and request '/person/delete'.</p>
     */
    @RequestMapping(value="/person/delete", method=RequestMethod.POST)
    public String delete(Person person) {
        repository.delete(person);

        return SEARCH_VIEW_KEY;
    }

    /**
     * <p>Searches for all persons and returns them in a 
     * <code>Collection</code>.</p>
     * 
     * <p>Expected HTTP GET and request '/person/search'.</p>
     */
    @RequestMapping(value="/person/search", method=RequestMethod.GET)
    public @ModelAttribute(SEARCH_MODEL_KEY) Collection<Person> search() {
        return repository.findAll();
    }

}
