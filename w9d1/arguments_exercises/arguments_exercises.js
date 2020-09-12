// sum = function() {
//     sum = 0;
//     args = Array.from(arguments);
//     args.forEach(num => sum += num);
//     return sum;
// };

// sum2 = function(...nums) {
//     sum = 0;
//     nums.forEach( num => sum += num );
//     return sum;
// };


// console.log(sum2(10,5,2));

// Function.prototype.myBind = function(context, ...bindArgs) {
//     // return () => this.apply(context);
//     const that = this;
//     return function(...callArgs) {
//         return that.apply(context, bindArgs.concat(callArgs));
//     };
// };

Function.prototype.myBind = function (context) {
    // return () => this.apply(context);
    const that = this;
    const args = Array.from(arguments);
    const bindArgs = args.slice(1);

    return function () {
        const callArgs = Array.from(arguments);
        return that.apply(context, bindArgs.concat(callArgs));
    };
};

function curriedSum(numArgs) {
    const nums = [];
    function _curry(num) {
        nums.push(num);
        if (nums.length === numArgs) {
            return nums.reduce( (acc,ele) => acc += ele);
        } else {
            return _curry;
        }
    }
    return _curry;
}

// const summer = curriedSum(4);
// console.log(summer(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
    const that = this;
    const nums = [];
    function _curry(number) {
        nums.push(number);
        if(nums.length === numArgs) {
            // that.apply(null, nums);
            that(...nums);  
        } else {
            return _curry;
        }
    }
    return _curry;
}