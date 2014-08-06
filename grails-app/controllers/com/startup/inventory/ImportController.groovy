package com.startup.inventory

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_SUPER_ADMIN'])
class ImportController {

    def importService

    def index() {
        List<ProductItem> productItemList = ProductItem.list(sort: 'categoryType')

        LinkedHashMap resultMap = importService.importPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'index', model: [dataReturn: null, totalCount: 0, productItemList: productItemList])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'index', model: [dataReturn: resultMap.results, totalCount: totalCount, productItemList: productItemList])
    }

    def list() {
        LinkedHashMap gridData
        String result
        LinkedHashMap resultMap = importService.importPaginateList(params)

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
    def save() {

        print("hhhhhhhhhhhhhh>>" + params)

        LinkedHashMap result = new LinkedHashMap()
        result.put('isError', true)
        String outPut

        //params.entryDate=new Date()
        //LcSettings lcSettings = new LcSettings(params)
        //lcSettings.save(flush:true)

        //result.put('isError', false)
        //result.put('message', 'Import Updated successfully')
        //outPut = result as JSON
        //render outPut*/

        // save
        def productItemList = params.productItemId
        def amountList = params.amount
        def productCheckList = params.productCheck


        /*Date.parse('dd/MM/yyyy', params.dob)*/

        for(int i=0; i<productItemList.length; i++){
        Import anImport = new Import()
            if ( (amountList[i] != '') && (productItemList[i] in productCheckList == true)  ){
                println "amount =" + amountList[i] + "| product Id =" + productItemList[i]
                params.entryDate=new Date()
                params.amount = amountList[i] as String
                ProductItem p = ProductItem.get(productItemList[i])
                params.productItem = p
                Import registration = new Import(params)
                registration.save(flush:true)
            }
        }
        result.put('isError', false)
        result.put('message', 'Import Updated successfully')
        outPut = result as JSON
        render outPut

    }

    def edit(Long id) {

        if (!request.method == 'POST') {
            redirect(action: 'index')
            return
        }
        LinkedHashMap result = new LinkedHashMap()
        String outPut

        Import anImport = Import.read(id)
        if (!anImport) {
            result.put('isError', true)
            result.put('message', 'Import name not found')
            outPut = result as JSON
            render outPut
            return
        }

        result.put('isError', false)
        result.put('import', anImport)
        result.put('productItem',anImport.productItem.name)
        result.put('categoryType',anImport.productItem.categoryType.name)



        outPut = result as JSON
        render outPut
    }

    def delete(Long id) {
        LinkedHashMap result = new LinkedHashMap()

        result.put('isError', true)
        String outPut
        Import anImport = Import.get(id)
        if (anImport) {
            try {
                anImport.delete(flush: true)
                result.put('isError', false)
                result.put('message', "Import deleted successfully.")
                outPut = result as JSON
                render outPut
                return

            }

            catch (DataIntegrityViolationException e) {
                result.put('isError', true)
                result.put('message', "Import could not deleted. Already in use.")
                outPut = result as JSON
                render outPut
                return
            }

        }
        result.put('isError', true)
        result.put('message', "Import not found")
        outPut = result as JSON
        render outPut
        return
    }


    //
    def importProduct(){
        List<ProductItem> productItemList = ProductItem.list(sort: 'categoryType')

        LinkedHashMap resultMap = importService.importPaginateList(params)

        if (!resultMap || resultMap.totalCount == 0) {
            render(view: 'index', model: [dataReturn: null, totalCount: 0, productItemList: productItemList])
            return
        }
        int totalCount = resultMap.totalCount
        render(view: 'index', model: [dataReturn: resultMap.results, totalCount: totalCount, productItemList: productItemList])

    }
}