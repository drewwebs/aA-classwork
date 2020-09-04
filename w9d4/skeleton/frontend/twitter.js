const FollowToggle = require('./follow_toggle.js');

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