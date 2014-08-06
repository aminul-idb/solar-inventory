package com.startup.inventory

class Import {

    ProductItem productItem
    String amount
    Status status
    LcSettings lcSettings
    Date entryDate = new Date()
    Date importDate

    static constraints = {
        entryDate nullable: true
    }
}
