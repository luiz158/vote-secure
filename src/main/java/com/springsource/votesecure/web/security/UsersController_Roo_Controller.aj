// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.votesecure.web.security;

import com.springsource.votesecure.domain.security.Users;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UsersController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String UsersController.create(@Valid Users users, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("users", users);
            return "userses/create";
        }
        users.persist();
        return "redirect:/userses/" + encodeUrlPathSegment(users.getId().toString(), request);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UsersController.createForm(Model model) {
        model.addAttribute("users", new Users());
        return "userses/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String UsersController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("users", Users.findUsers(id));
        model.addAttribute("itemId", id);
        return "userses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UsersController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("userses", Users.findUsersEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Users.countUserses() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("userses", Users.findAllUserses());
        }
        return "userses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UsersController.update(@Valid Users users, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("users", users);
            return "userses/update";
        }
        users.merge();
        return "redirect:/userses/" + encodeUrlPathSegment(users.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UsersController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("users", Users.findUsers(id));
        return "userses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UsersController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        Users.findUsers(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/userses?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    String UsersController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
