// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.votesecure.domain.security;

import java.lang.String;

privileged aspect Authorities_Roo_ToString {
    
    public String Authorities.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Authority: ").append(getAuthority());
        return sb.toString();
    }
    
}
