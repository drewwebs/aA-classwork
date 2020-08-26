// function uniq(array) {
//     let new_arr = [];
//     for (let i = 0; i < array.length; i++) {
//         if (!new_arr.includes(array[i]))
//             new_arr.push(array[i]);
//     }
//     console.log(new_arr);
// }

function myForEach(array, cb) {
    for (let i = 0; i < array.length; i++) {
        cb(array[i]);
    }
}

Array.prototype.uniq = function() {
    let newArr = []
    this.forEach(el => {
        if (!newArr.includes(el))
        newArr.push(el);
    })
    console.log(newArr);
};

Array.prototype.twoSum = function() {
    let checkedNumbers = {}
    let sums = []
    this.forEach(el => {
        let compliment = 0 - el;

        if (checkedNumbers[compliment])
            sums.push([el, compliment]);

        checkedNumbers[el] = true;
    })
    console.log(sums);
};

// function transpose(array) {
//     newArr = []
//     while (newArr.length < array.length)
//         newArr.push([])
        
//     for (let i = 0; i < array.length; i++) {
//         for (let j = 0; j < array[i].length; j++) {
//             newArr[i].push(array[j][i])
//         }
//     }
//     console.log(newArr)
// }


Array.prototype.transpose = function() {
    let newArr = Array.from(this, x => x)
    for (let i = 0; i < this.length; i++) {
        newArr[i] = Array.from(this[i], x => x)
        for (let j = 0; j < this[i].length; j++) {
            if (i > j)
                [newArr[i][j], newArr[j][i]] = [newArr[j][i], newArr[i][j]];
        }
    }
    console.log(newArr);
    console.log(this);
}

// function atranspose(a) {
//     return Object.keys(a[0]).map(function(c) {
//         return a.map(function(r) { return r[c]; });
//     });
// }





