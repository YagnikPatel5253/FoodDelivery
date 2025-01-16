import SwiftUI

// 1. Global Constants Structure
struct Globs {
    static let AppName = "Online Groceries"
    
    // 2. Base URL for API
    static let BASE_URL = "http://localhost:3001/api/app/"
    
    // 3. UserDefaults Keys
    static let userPayload = "user_payload"
    static let userLogin = "user_login"
    
    // 4. API Endpoints
    // Authentication
    static let SV_LOGIN = BASE_URL + "login"
    static let SV_SIGN_UP = BASE_URL + "sign_up"
    
    // Home & Products
    static let SV_HOME = BASE_URL + "home"
    static let SV_PRODUCT_DETAIL = BASE_URL + "product_detail"
    
    // Favorites
    static let SV_ADD_REMOVE_FAVORITE = BASE_URL + "add_remove_favorite"
    static let SV_FAVORITE_LIST = BASE_URL + "favorite_list"
    
    // Cart Management
    static let SV_ADD_CART = BASE_URL + "add_to_cart"
    static let SV_UPDATE_CART = BASE_URL + "update_cart"
    static let SV_REMOVE_CART = BASE_URL + "remove_cart"
    static let SV_CART_LIST = BASE_URL + "cart_list"
    static let SV_ORDER_PLACE = BASE_URL + "order_place"
    
    // Address Management
    static let SV_ADD_ADDRESS = BASE_URL + "add_delivery_address"
    static let SV_UPDATE_ADDRESS = BASE_URL + "update_delivery_address"
    static let SV_REMOVE_ADDRESS = BASE_URL + "delete_delivery_address"
    static let SV_ADDRESS_LIST = BASE_URL + "delivery_address"
    
    // Orders
    static let SV_MY_ORDERS_LIST = BASE_URL + "my_order"
    static let SV_MY_ORDERS_DETAIL = BASE_URL + "my_order_detail"
    
    // Payment Methods
    static let SV_ADD_PAYMENT_METHOD = BASE_URL + "add_payment_method"
    static let SV_REMOVE_PAYMENT_METHOD = BASE_URL + "remove_payment_method"
    static let SV_PAYMENT_METHOD_LIST = BASE_URL + "payment_method"
    
    // Promo Codes
    static let SV_PROMO_CODE_LIST = BASE_URL + "promo_code_list"
    
    // Explore
    static let SV_EXPLORE_LIST = BASE_URL + "explore_category_list"
    static let SV_EXPLORE_ITEMS_LIST = BASE_URL + "explore_category_items_list"
    
    // Notifications
    static let SV_NOTIFICATION_LIST = BASE_URL + "notification_list"
    static let SV_NOTIFICATION_READ_ALL = BASE_URL + "notification_read_all"
    
    // Profile Management
    static let SV_UPDATE_PROFILE = BASE_URL + "update_profile"
    static let SV_CHANGE_PASSWORD = BASE_URL + "change_password"
    
    // Password Recovery
    static let SV_FORGOT_PASSWORD_REQUEST = BASE_URL + "forgot_password_request"
    static let SV_FORGOT_PASSWORD_VERIFY = BASE_URL + "forgot_password_verify"
    static let SV_FORGOT_PASSWORD_SET_PASSWORD = BASE_URL + "forgot_password_set_password"
}

// 5. API Response Keys
struct KKey {
    static let status = "status"
    static let message = "message"
    static let payload = "payload"
}

// 6. UserDefaults Utility Class
class Utils {
    // Save data to UserDefaults
    class func UDSET(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    // Get value from UserDefaults
    class func UDValue(key: String) -> Any {
       return UserDefaults.standard.value(forKey: key) as Any
    }
    
    // Get boolean value from UserDefaults (default: false)
    class func UDValueBool(key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
    
    // Get boolean value from UserDefaults (default: true)
    class func UDValueTrueBool(key: String) -> Bool {
       return UserDefaults.standard.value(forKey: key) as? Bool ?? true
    }
    
    // Remove value from UserDefaults
    class func UDRemove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

