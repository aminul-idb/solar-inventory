import com.startup.inventory.CatName
import com.startup.inventory.ProductName
import com.startup.inventory.Status
import com.startup.inventory.SubCat
import com.startup.inventory.uma.Role
import com.startup.inventory.uma.User
import com.startup.inventory.uma.UserRole

class BootStrap {

    def init = { servletContext ->
        createUserWithRole()
//        createCategory()
//        createSubCategory()
//        createItem()
    }

    void createCategory(){
        CatName.findByName('Battery')?:new CatName(name: 'Battery',description: 'Battery only', status:Status.ACTIVE).save()
        CatName.findByName('Solar Panel')?:new CatName(name: 'Solar Panel',description: 'Solar Panel only', status:Status.ACTIVE).save()
        CatName.findByName('Bulb')?:new CatName(name: 'Bulb',description: 'Bulb only', status:Status.ACTIVE).save()
        CatName.findByName('Cable')?:new CatName(name: 'Cable',description: 'Cable only', status:Status.ACTIVE).save(flush: true)
    }

    void createSubCategory(){
        SubCat.findByName('Battery A')?:new SubCat(name: 'Battery A',description: 'Battery A only', status:Status.ACTIVE).save()
        SubCat.findByName('Battery B')?:new SubCat(name: 'Battery B',description: 'Battery B only', status:Status.ACTIVE).save()
        SubCat.findByName('Solar Panel A')?:new SubCat(name: 'Solar Panel A',description: 'Solar Panel A only', status:Status.ACTIVE).save()
        SubCat.findByName('Solar Panel B')?:new SubCat(name: 'Solar Panel B',description: 'Solar Panel B only', status:Status.ACTIVE).save()
        SubCat.findByName('Bulb A')?:new SubCat(name: 'Bulb A',description: 'Bulb A only', status:Status.ACTIVE).save()
        SubCat.findByName('Bulb B')?:new SubCat(name: 'Bulb B',description: 'Bulb B only', status: Status.ACTIVE).save()
        SubCat.findByName('Cable A')?:new SubCat(name: 'Cable A',description: 'Cable A only', status: Status.ACTIVE).save(flush: true)
    }

    void createItem(){
        ProductName.findByName('Battery A 11')?:new ProductName(name: 'Battery A 11',description: 'Battery A 11 only', status: Status.ACTIVE).save()
        ProductName.findByName('Battery A 12')?:new ProductName(name: 'Battery A 12',description: 'Battery A 12 only', status: Status.ACTIVE).save()
        ProductName.findByName('Solar Panel A 11')?:new ProductName(name: 'Solar Panel A 12',description: 'Solar Panel A 12 only', status: Status.ACTIVE).save()
        ProductName.findByName('Solar Panel A 12')?:new ProductName(name: 'Solar Panel A 12',description: 'Solar Panel A 12 only', status: Status.ACTIVE).save()
        ProductName.findByName('Bulb A 11')?:new ProductName(name: 'Bulb A 11',description: 'Bulb A 11 only', status: Status.ACTIVE).save()
        ProductName.findByName('Bulb B 12')?:new ProductName(name: 'Bulb B 12',description: 'Bulb B 12 only', status: Status.ACTIVE).save(flush: true)
    }

    void createUserWithRole() {

        Role superAdmin = Role.findByAuthority("ROLE_SUPER_ADMIN")
        if (!superAdmin) {
            superAdmin = new Role(authority: 'ROLE_SUPER_ADMIN').save()
        }
        Role admin = Role.findByAuthority("ROLE_ADMIN")

        User superAdminUser = User.findByUsername('admin')
        if (!superAdminUser) {
            superAdminUser = new User(username: 'admin', password: 'password', schoolId: 10000, enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false)
            superAdminUser.save(flush: true)

            new UserRole(user: superAdminUser, role: superAdmin).save(flush: true)
        }

        def destroy = {
        }
    }
}