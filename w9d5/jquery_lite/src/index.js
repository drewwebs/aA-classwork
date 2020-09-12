
import _ from 'lodash';
// window.$l = (arg) => {
//     let nodes = [];
//     if (arg instanceof String) {
//         nodes = querySelectorAll(arg);
//     } 

//     return Array.from(nodes);
// };

// window.$l = $l;

// const firstDiv = document.getElementById("first");
// console.log(firstDiv.textContent);

// alert("Hello from the app");

// function component() {
//     const element = document.createElement('div');
//     // debugger
//     element.innerHTML = _.join(['Hello', 'webpack'], ' ');

//     return element;
// }

// document.body.appendChild(component());

$("ul").on("click", "li", function (e) {
    // debugger
    const li = $(e.currentTarget);
    console.log(e.currentTarget);
    
    li.append("<li> This is one more thing </li>");
});

$("form").on("submit", e => {
    e.preventDefault();

    const $input = $('#thing');
    const thing = $input.val();
    $input.val('');

    $('ul').append($("<li></li>").text(thing));
});