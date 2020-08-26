Array.prototype.bubbleSort = function () {
    let sorted = false;
    while (sorted === false) {
        sorted = true;
        for (let i = 0; i < (this.length - 1); i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }
    console.log(this);
};


String.prototype.substrings = function () {
    let substrings = []
    for (let i = 0; i <= this.length; i++) {
        for (let j = 0; j <= this.length; j++) {
            if (j > i) {
                substrings.push(this.slice(i, j))
            }

        }
    }
    console.log(substrings)
}
