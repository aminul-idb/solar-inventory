package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class CategoryTypeController {
    def categoryTypeService

    def index() {
        LinkedHashMap resultMap = categoryTypeService.categoryTypePaginateList(params)

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
        LinkedHashMap resultMap = categoryTypeService.categoryTypePaginateList(params)

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
    def save(CategoryType categoryType) {

        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut

        if (categoryType == null) {
            result.put('isError', true)
            result.put('message', 'Category Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }

        if (categoryType.hasErrors()) {
            result.put('isError', true)
            result.put('message', 'Category Updated Failed')
            outPut = result as JSON
            render outPut
            return
        }

        categoryType.save flush:true
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
        CategoryType categoryType = CategoryType.read(id)
        if (!categoryType) {
            result.put('message', 'Category name not found')
            outPut = result as JSON
            render outPut
            return
        }
        result.put('isError', false)
        result.put('obj', categoryType)
        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut
        CategoryType categoryType = CategoryType.get(id)
        if (categoryType) {
            try {
                categoryType.delete(flush: true)
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



class CategoryTypeCommand{

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
