
// class Clock {
//     constructor() {
//         // 1. Create a Date object.
//         let date = new Date();
//         // 2. Store the hours, minutes, and seconds.
//         [this.hour, this.minute, this.second] = [date.getHours(), date.getMinutes(), date.getSeconds()];
//         // 3. Call printTime.
//         this.printTime();
//         // 4. Schedule the tick at 1 second intervals.
//         setInterval(this._tick.bind(this), 1000);
        
//     }
    
//     printTime() {
//         // Format the time in HH:MM:SS
//         let time = `${this.hour}:${this.minute}:${this.second}`;
//         // Use console.log to print it.
//         console.log(time);
//     }
    
//     _tick() {
//       // 1. Increment the time by one second.
//         this.incrementSecond();
//       // 2. Call printTime.
//         this.printTime();
//     }
    
//     incrementSecond() {
//         this.second += 1;
//         if (this.second === 60) {
//             this.second = 0;
//             this.incrementMinute();
//         }
//     }
    
//     incrementMinute() {
//         this.minute += 1;        
//         if (this.minute === 60) {
//             this.minute = 0;
//             this.incrementHour();
//         }
//     }
    
//     incrementHour() {
//         this.hour += 1;        
//         if (this.hour === 24) {
//             this.hour = 0;   
//           }
//     }
// }

//   const clock = new Clock();

const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
    // Prompt user to tell us whether el1 > el2; pass true back to the
    // callback if true; else false.
    reader.question(`is ${el1} > ${el2}? Please answer 'yes' or 'no'`,function(answer) {
        if (answer === "yes") {
            console.log("returning true");
            callback(true);
        } else {
            callback(false);
        }
    });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    // Do an "async loop":
    // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
    //    know whether any swap was made.
    if (i == arr.length - 1) {
        console.log("end of loop");
        outerBubbleSortLoop(madeAnySwaps);
    } else {
        console.log(arr[i]);
        askIfGreaterThan(arr[i], arr[i + 1], function(isGreaterThan) { 
            if (isGreaterThan===true) {
                console.log("swapping positions");
                [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
                madeAnySwaps = true;
            }
            i+=1;
            console.log(`doing loop number ${i}`);
            innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
        });
    }
}   

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        // Begin an inner loop if you made any swaps. Otherwise, call
        // `sortCompletionCallback`.
    }

    // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

// absurdBubbleSort([3, 2, 1], function (arr) {
//     console.log("Sorted array: " + JSON.stringify(arr));
//     reader.close();
// });


innerBubbleSortLoop([5,1,2,3,5,4,2,1], 0, false, function outerloop() {
    console.log("this is the outer loop");
} );

