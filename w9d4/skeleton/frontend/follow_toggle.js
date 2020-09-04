const APIUtil = require('./api_util.js')



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
    
        if(this.followState === "unfollowed"){
            this.el.text('Follow!');
            enableButton()
        }else if (this.followState === "followed") {
            this.el.text('Unfollow!');
            enableButton()
        }else if (this.followState === "following"){
            this.el.text('Following');
            disableButton();
        } else if (this.followState === 'unfollowing') {
            this.el.text('Unfollowing');
            disableButton();
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
// :(((((((AGREED))))))): //so many accomplishments tho
    toggleFollowState(){
        followStates = ["followed", "unfollowed", "following", "unfollowing"];
        
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