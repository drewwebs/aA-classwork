/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
    followUser: id => {
        // ...
       return $.ajax({
            method: "POST",
            url: `${id}/follow`,
            dataType: 'json',
            success: function () {
                // that.toggleFollowState();
                // that.render();
            },
            error: function () {
                console.log("THIS IS AN ERROR BEEP BOOP!");
            }
        });
    },

    unfollowUser: id => {
        return $.ajax({
            method: "DELETE",
            url: `${id}/follow`,
            dataType: 'json',
            success: function () {
                // that.toggleFollowState();
                // that.render();
            },
            error: function () {
                console.log("THIS IS AN ERROR BEEP BOOP!");
            }
        });
    },


    // errorCallback: response => {
    //     postMessage(response.responseJSON[0]);
    // }
};

module.exports = APIUtil;



// methodSetter(){
//     return (this.followState) ? "DELETE" : "POST";
// }

// toggleFollowState(){
//     this.followState ? this.followState = false : this.followState = true;
// }

// handleClick() {
//     // debugger;
//     const that = this;
//     const userId = this.userId
//     this.el.on('click', (e) => {
//         e.preventDefault();

//         $.ajax({
//             method: that.methodSetter(),
//             url: `${userId}/follow`,
//             dataType: 'json',

//             success: function () {
//                 that.toggleFollowState();
//                 that.render();
//             },

//             error: function () {
//                 console.log("THIS IS AN ERROR BEEP BOOP!");
//             }
//         });

//     });
// }


/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util.js */ "./frontend/api_util.js")



class FollowToggle {
    constructor($el){
        // debugger;
        this.userId = $el.data().userId;
        
        if ($el.data().initialFollowState) {
            this.followState = "followed";
        } else {
            this.followState = "unfollowed";
        }
        
        this.el = $el;
    }

    render(){
        // debugger;
    
        if(this.followState === "unfollowing"){
            this.el.text('Follow!');
        }else if (this.followState === "following") {
            this.el.text('Unfollow!');
        }else{
            
            this.render();
        }

        
    }
    disableButton(){
        $(this.el).prop({
            disabled: true
        });
    }

    enableButton(){
        $(this.el).prop({
            disabled: false
        });
    }


    // $('.rbutton').on('click',function() {
    //     $(this).prop("disabled", true);
    // });

    methodSetter(userId){
        return (this.followState === "followed") ? APIUtil.unfollowUser(userId) : APIUtil.followUser(userId);
    }

    toggleFollowState(){
        (this.followState === "followed") ? this.followState = 'unfollowing' : this.followState = 'following';
        
    }

    handleClick() {
        // debugger;
        const that = this;
        const userId = this.userId;
        this.el.on('click', (e) => {
            e.preventDefault();
            that.methodSetter(userId)
            .then(that.toggleFollowState())// APIUtil.errorCallback());
            .then(that.render())
            .then();
        });
    }

}




module.exports = FollowToggle;

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");

// window.FollowToggle = FollowToggle;


window.addEventListener('DOMContentLoaded', () => {
    followButton();
    // FollowToggle.handleClick();

});

// $(() => {
    
// })


function followButton(){

    $('.follow-toggle').each((i, $button)=>{
        let $el = $($button);
        // debugger;
        const $followButton = new FollowToggle($el);
        console.log($followButton);
        $followButton.render();
        $followButton.handleClick();
    });

    
    
}

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map