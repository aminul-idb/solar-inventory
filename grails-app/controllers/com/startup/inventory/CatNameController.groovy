package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import com.startup.inventory.CatName
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

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

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap = catNameService.catNamePaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            gridData = [iTotalRecords: 0, iTotalDisplayRecords: 0, aaData: null]
            result = gridData as JSON
            render result
            return
        }
        int totalCount = resultMap.totalCount
        gridData = [iTotalRecords: totalCount, iTotalDisplayRecords: totalCount, aaData: resultMap.results]
        result = gridData as JSON
        render result

    }

    @Transactional
    def save(CatName catName) {

        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut

        if (catName == null) {
            result.put('isError', true)
            result.put('message', 'Category Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }

        if (catName.hasErrors()) {
            result.put('isError', false)
            result.put('message', 'Category Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }

        catName.save flush:true
        result.put('isError', false)
        result.put('message', 'Category Updated successfully')
        outPut = result as JSON
        render outPut
        return

    }

    def edit(Long id) {
        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        CatName catName = CatName.read(id)
        if (!catName) {
            result.put('message', 'Category name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', catName)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        CatName catName = CatName.get(id)
        if (catName) {
            try {
                catName.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Category deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Category could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Category not found")
        outPut = result as JSON
        render outPut
        return
    }
}


class CatNameCommand{

    Long id
    String name
    String description
    Status status

    static constraints = {
        id nullable: true
        name nullable: false
        description nullable: true
        status nullable: true
    }
}
