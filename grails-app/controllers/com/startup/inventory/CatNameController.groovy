package com.startup.inventory

import grails.plugin.springsecurity.annotation.Secured
import com.startup.inventory.CatName

@Secured(['ROLE_SUPER_ADMIN'])
class CatNameController {
    def catNameService

    def index() {
        LinkedHashMap resultMap = catNameService.catNamePaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'index', model: [dataReturn: null, totalCount: 0])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'index', model: [dataReturn: resultMap.results, totalCount: totalCount])
    }
}
