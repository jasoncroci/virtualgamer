(function() {

    VirtualGamer.RenderEngine = function(config) {
        this._renderEngineInit(config);
    };

    VirtualGamer.RenderEngine.prototype = {
      
      _renderEngineInit: function(config) {
        this.defaultRenderEngineAttrs = {
          tileLayer: new Kinetic.Layer(),
          stage: new Kinetic.Stage({
            container: 'container',
          }),
          tileRect: new Kinetic.Rect({
            x: 0,
            y: 0,
            width: 75,
            height: 75,
            stroke: 'black',
            strokeWidth: 1
          }),
          blockingTerrian:  [],
          difficultTerrian: [],
        };

        this.setDefaultAttrs(this.defaultRenderEngineAttrs);
        this.setAttrs(config);
        this.getStage().add(this.getTileLayer());   
        this.getStage().setWidth(this.totalStageWidth());
        this.getStage().setHeight(this.totalStageHeight());     
      },

      setAttrs: function(config) {
        if(config) {
          for(var key in config) {
              var method = 'set' + key.charAt(0).toUpperCase() + key.slice(1);
              // use setter if available
              if(VirtualGamer.Type._isFunction(this[method])) {
                  this[method](config[key]);
              }
              // otherwise set directly
              else {
                  this.setAttr(key, config[key]);
              }
          }
        }
      },

      setAttr: function(key, val) {
        if(val !== undefined) {
            var oldVal = this.attrs[key];
            this.attrs[key] = val;
        }
      },

      setDefaultAttrs: function(config) {
        // create attrs object if undefined
        if(this.attrs === undefined) {
          this.attrs = {};
        }

        if(config) {
          for(var key in config) {
            if(this.attrs[key] === undefined) {
              this.attrs[key] = config[key];
            }
          }
        }
      },

      totalCombatGridWidth:function(){
        return this.getNumTilesWide() * this.getTileRect().getWidth();
      },

      totalCombatGridHeight:function(){
        return this.getNumTilesHigh() * this.getTileRect().getHeight();
      },

      totalStageWidth:function(){
        return this.totalCombatGridWidth();
      },

      totalStageHeight:function(){
        return this.totalCombatGridHeight();
      },

      getFillColor:function(id){
        if($.inArray(id,this.getDifficultTerrian()) > -1){
          return this.difficultTerrianGridColor;
        }
        else if($.inArray(id,this.getBlockingTerrian()) > -1){
          return this.blockingTerrianGridColor;
        }
        return this.normalTerrianGridColor;
      },

      getTileId:function(xPos,yPos){
        return xPos + "x" + yPos;
      },

      // Draw combat grid
      drawCombatGrid:function(){
        var xPos,yPos,id;
        for(var i = 0; i < this.getNumTilesWide(); i++){
          for(var n = 0; n < this.getNumTilesHigh(); n++) {
            xPos = n * this.getTileRect().getWidth();
            yPos = i * this.getTileRect().getHeight();
            id = this.getTileId(xPos,yPos);
            this.getTileLayer().add(
              this.getTileRect().clone({
                x: xPos, 
                y: yPos,
                id: id,
                fill: this.getFillColor(id)
              })
            );
          }
        }
        this.getTileLayer().draw();
      },

      draw:function(){
        // Add token layer to stage since characters
        // were added right before this method call
        this.drawCombatGrid();
      }

    };

    // add getter and setter methods
    VirtualGamer.RenderEngine.addSetters = function(constructor, arr) {
        var len = arr.length;
        for(var n = 0; n < len; n++) {
            var attr = arr[n];
            this._addSetter(constructor, attr);
        }
    };
    
    VirtualGamer.RenderEngine.addGetters = function(constructor, arr) {
        var len = arr.length;
        for(var n = 0; n < len; n++) {
            var attr = arr[n];
            this._addGetter(constructor, attr);
        }
    };

    VirtualGamer.RenderEngine._addSetter = function(constructor, attr) {
        var that = this;
        var method = 'set' + attr.charAt(0).toUpperCase() + attr.slice(1);
        constructor.prototype[method] = function(val) {
            this.setAttr(attr, val);
        };
    };
    
    VirtualGamer.RenderEngine._addGetter = function(constructor, attr) {
        var that = this;
        var method = 'get' + attr.charAt(0).toUpperCase() + attr.slice(1);
        constructor.prototype[method] = function(arg) {
            return this.attrs[attr];
        };
    };
    
    VirtualGamer.RenderEngine.addGettersSetters = function(constructor, arr) {
        this.addSetters(constructor, arr);
        this.addGetters(constructor, arr);
    };

    VirtualGamer.RenderEngine.addGettersSetters(VirtualGamer.RenderEngine, ['numTilesWide','numTilesHigh','difficultTerrian','blockingTerrian']);

    VirtualGamer.RenderEngine.addGetters(VirtualGamer.RenderEngine, ['tileLayer','stage', 'tileRect']);

})();
