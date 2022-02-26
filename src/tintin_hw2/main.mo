import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor {
    private func quicksort(arr : [var Int]) : () {
        func sort(arr : [var Int], lo : Nat, hi : Nat){
            if (lo >= hi) {
                return;
            };

            var tmp = arr[lo];
            var l_ptr = lo;
            var r_ptr = hi;

            while (l_ptr < r_ptr) {
                while (arr[r_ptr] >= tmp and r_ptr > l_ptr) {
                    r_ptr := r_ptr - 1;
                };
                arr[l_ptr] := arr[r_ptr];

                while (arr[l_ptr] <= tmp and l_ptr < r_ptr) {
                    l_ptr := l_ptr + 1;
                };
                arr[r_ptr] := arr[l_ptr];
            };

            arr[r_ptr] := tmp;

            if(l_ptr >= 1) {
                sort(arr,lo,l_ptr-1);
            };

            sort(arr, l_ptr + 1, hi);
        };

        sort(arr, 0, arr.size() - 1);
    };

    public query func qsort(arr : [Int]) : async [Int] {
        var payload : [var Int] = Array.thaw(arr);
        quicksort(payload);
        return Array.freeze(payload);
    }; 
};