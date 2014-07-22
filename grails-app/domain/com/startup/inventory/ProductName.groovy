package com.startup.inventory

class ProductName {

    String name
    String description
    Status status
    static belongsTo = [catName: CatName]

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
    }
}
