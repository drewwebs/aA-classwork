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
