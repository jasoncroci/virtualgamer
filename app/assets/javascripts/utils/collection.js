(function() {
    /**
     * Collection constructor.  Collection extends
     *  Array.  This class is used in conjunction with get()
     * @constructor
     */
    VirtualGamer.Collection = function() {
        var args = [].slice.call(arguments), length = args.length, i = 0;

        this.length = length;
        for(; i < length; i++) {
            this[i] = args[i];
        }
        return this;
    }
    VirtualGamer.Collection.prototype = new Array();
    /**
     * apply a method to all nodes in the array
     * @name apply
     * @methodOf TableTopGamer.Collection.prototype
     * @param {String} method
     * @param val
     */
    VirtualGamer.Collection.prototype.apply = function(method) {
        args = [].slice.call(arguments);
        args.shift();
        for(var n = 0; n < this.length; n++) {
            if(TableTopGamer.Type._isFunction(this[n][method])) {
                this[n][method].apply(this[n], args);
            }
        }
    };
    /**
     * iterate through node array
     * @name each
     * @methodOf TableTopGamer.Collection.prototype
     * @param {Function} func
     */
    VirtualGamer.Collection.prototype.each = function(func) {
        for(var n = 0; n < this.length; n++) {
            func.call(this[n], n, this[n]);
        }
    };
})();
