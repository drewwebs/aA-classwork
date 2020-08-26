Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
}

Array.prototype.myMap = function (callback) {
    let newArr = []
    this.myEach(
        x => newArr.push(callback(x))
    );
    console.log(newArr)
}

Array.prototype.myReduce = function (callback, initialValue) {
    if (initialValue !== undefined) {
        let acc = initialValue;
        this.myEach(ele => acc = callback(acc, ele));
        console.log(acc);
    } else {
        let acc = this[0];
        this.slice(1).myEach(ele => acc = callback(acc, ele));
        console.log(acc);
    }
};
