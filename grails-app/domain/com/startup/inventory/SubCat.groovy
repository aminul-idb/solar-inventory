package com.startup.inventory

class SubCat {

    String name
    String description
    Status status

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
    }
}
