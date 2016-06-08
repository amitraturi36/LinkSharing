/**
 * Copyright (c) 2007-2013 Ariel Flesler - aflesler<a>gmail<d>com | http://flesler.blogspot.com
 * Dual licensed under MIT and GPL.
 * @author Ariel Flesler
 * @version 1.4.6
 */
;(function($){var h=$.scrollTo=function(a,b,c){$(window).scrollTo(a,b,c)};h.defaults={axis:'xy',duration:parseFloat($.fn.jquery)>=1.3?0:1,limit:true};h.window=function(a){return $(window)._scrollable()};$.fn._scrollable=function(){return this.map(function(){var a=this,isWin=!a.nodeName||$.inArray(a.nodeName.toLowerCase(),['iframe','#document','html','body'])!=-1;if(!isWin)return a;var b=(a.contentWindow||a).document||a.ownerDocument||a;return/webkit/i.test(navigator.userAgent)||b.compatMode=='BackCompat'?b.body:b.documentElement})};$.fn.scrollTo=function(e,f,g){if(typeof f=='object'){g=f;f=0}if(typeof g=='function')g={onAfter:g};if(e=='max')e=9e9;g=$.extend({},h.defaults,g);f=f||g.duration;g.queue=g.queue&&g.axis.length>1;if(g.queue)f/=2;g.offset=both(g.offset);g.over=both(g.over);return this._scrollable().each(function(){if(e==null)return;var d=this,$elem=$(d),targ=e,toff,attr={},win=$elem.is('html,body');switch(typeof targ){case'number':case'string':if(/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(targ)){targ=both(targ);break}targ=$(targ,this);if(!targ.length)return;case'object':if(targ.is||targ.style)toff=(targ=$(targ)).offset()}$.each(g.axis.split(''),function(i,a){var b=a=='x'?'Left':'Top',pos=b.toLowerCase(),key='scroll'+b,old=d[key],max=h.max(d,a);if(toff){attr[key]=toff[pos]+(win?0:old-$elem.offset()[pos]);if(g.margin){attr[key]-=parseInt(targ.css('margin'+b))||0;attr[key]-=parseInt(targ.css('border'+b+'Width'))||0}attr[key]+=g.offset[pos]||0;if(g.over[pos])attr[key]+=targ[a=='x'?'width':'height']()*g.over[pos]}else{var c=targ[pos];attr[key]=c.slice&&c.slice(-1)=='%'?parseFloat(c)/100*max:c}if(g.limit&&/^\d+$/.test(attr[key]))attr[key]=attr[key]<=0?0:Math.min(attr[key],max);if(!i&&g.queue){if(old!=attr[key])animate(g.onAfterFirst);delete attr[key]}});animate(g.onAfter);function animate(a){$elem.animate(attr,f,g.easing,a&&function(){a.call(this,targ,g)})}}).end()};h.max=function(a,b){var c=b=='x'?'Width':'Height',scroll='scroll'+c;if(!$(a).is('html,body'))return a[scroll]-$(a)[c.toLowerCase()]();var d='client'+c,html=a.ownerDocument.documentElement,body=a.ownerDocument.body;return Math.max(html[scroll],body[scroll])-Math.min(html[d],body[d])};function both(a){return typeof a=='object'?a:{top:a,left:a}}})(jQuery);



/*
 * DC jQuery Vertical Accordion Menu - jQuery vertical accordion menu plugin
 * Copyright (c) 2011 Design Chemical
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 */

(function($){

    $.fn.dcAccordion = function(options) {

        //set default options
        var defaults = {
            classParent	 : 'dcjq-parent',
            classActive	 : 'active',
            classArrow	 : 'dcjq-icon',
            classCount	 : 'dcjq-count',
            classExpand	 : 'dcjq-current-parent',
            eventType	 : 'click',
            hoverDelay	 : 300,
            menuClose     : true,
            autoClose    : true,
            autoExpand	 : false,
            speed        : 'slow',
            saveState	 : true,
            disableLink	 : true,
            showCount : false,
//			cookie	: 'dcjq-accordion'
        };

        //call in the default otions
        var options = $.extend(defaults, options);

        this.each(function(options){

            var obj = this;
            setUpAccordion();
//			if(defaults.saveState == true){
//				checkCookie(defaults.cookie, obj);
//			}
            if(defaults.autoExpand == true){
                $('li.'+defaults.classExpand+' > a').addClass(defaults.classActive);
            }
            resetAccordion();

            if(defaults.eventType == 'hover'){

                var config = {
                    sensitivity: 2, // number = sensitivity threshold (must be 1 or higher)
                    interval: defaults.hoverDelay, // number = milliseconds for onMouseOver polling interval
                    over: linkOver, // function = onMouseOver callback (REQUIRED)
                    timeout: defaults.hoverDelay, // number = milliseconds delay before onMouseOut
                    out: linkOut // function = onMouseOut callback (REQUIRED)
                };

                $('li a',obj).hoverIntent(config);
                var configMenu = {
                    sensitivity: 2, // number = sensitivity threshold (must be 1 or higher)
                    interval: 1000, // number = milliseconds for onMouseOver polling interval
                    over: menuOver, // function = onMouseOver callback (REQUIRED)
                    timeout: 1000, // number = milliseconds delay before onMouseOut
                    out: menuOut // function = onMouseOut callback (REQUIRED)
                };

                $(obj).hoverIntent(configMenu);

                // Disable parent links
                if(defaults.disableLink == true){

                    $('li a',obj).click(function(e){
                        if($(this).siblings('ul').length >0){
                            e.preventDefault();
                        }
                    });
                }

            } else {

                $('li a',obj).click(function(e){

                    $activeLi = $(this).parent('li');
                    $parentsLi = $activeLi.parents('li');
                    $parentsUl = $activeLi.parents('ul');

                    // Prevent browsing to link if has child links
                    if(defaults.disableLink == true){
                        if($(this).siblings('ul').length >0){
                            e.preventDefault();
                        }
                    }

                    // Auto close sibling menus
                    if(defaults.autoClose == true){
                        autoCloseAccordion($parentsLi, $parentsUl);
                    }

                    if ($('> ul',$activeLi).is(':visible')){
                        $('ul',$activeLi).slideUp(defaults.speed);
                        $('a',$activeLi).removeClass(defaults.classActive);
                    } else {
                        $(this).siblings('ul').slideToggle(defaults.speed);
                        $('> a',$activeLi).addClass(defaults.classActive);
                    }

//					// Write cookie if save state is on
//					if(defaults.saveState == true){
//						createCookie(defaults.cookie, obj);
//					}
                });
            }

            // Set up accordion
            function setUpAccordion(){

                $arrow = '<span class="'+defaults.classArrow+'"></span>';
                var classParentLi = defaults.classParent+'-li';
                $('> ul',obj).show();
                $('li',obj).each(function(){
                    if($('> ul',this).length > 0){
                        $(this).addClass(classParentLi);
                        $('> a',this).addClass(defaults.classParent).append($arrow);
                    }
                });
                $('> ul',obj).hide();
                if(defaults.showCount == true){
                    $('li.'+classParentLi,obj).each(function(){
                        if(defaults.disableLink == true){
                            var getCount = parseInt($('ul a:not(.'+defaults.classParent+')',this).length);
                        } else {
                            var getCount = parseInt($('ul a',this).length);
                        }
                        $('> a',this).append(' <span class="'+defaults.classCount+'">'+getCount+'</span>');
                    });
                }
            }

            function linkOver(){

                $activeLi = $(this).parent('li');
                $parentsLi = $activeLi.parents('li');
                $parentsUl = $activeLi.parents('ul');

                // Auto close sibling menus
                if(defaults.autoClose == true){
                    autoCloseAccordion($parentsLi, $parentsUl);

                }

                if ($('> ul',$activeLi).is(':visible')){
                    $('ul',$activeLi).slideUp(defaults.speed);
                    $('a',$activeLi).removeClass(defaults.classActive);
                } else {
                    $(this).siblings('ul').slideToggle(defaults.speed);
                    $('> a',$activeLi).addClass(defaults.classActive);
                }

                // Write cookie if save state is on
                if(defaults.saveState == true){
                    createCookie(defaults.cookie, obj);
                }
            }

            function linkOut(){
            }

            function menuOver(){
            }

            function menuOut(){

                if(defaults.menuClose == true){
                    $('ul',obj).slideUp(defaults.speed);
                    // Reset active links
                    $('a',obj).removeClass(defaults.classActive);
                    createCookie(defaults.cookie, obj);
                }
            }

            // Auto-Close Open Menu Items
            function autoCloseAccordion($parentsLi, $parentsUl){
                $('ul',obj).not($parentsUl).slideUp(defaults.speed);
                // Reset active links
                $('a',obj).removeClass(defaults.classActive);
                $('> a',$parentsLi).addClass(defaults.classActive);
            }
            // Reset accordion using active links
            function resetAccordion(){
                $('ul',obj).hide();
                $allActiveLi = $('a.'+defaults.classActive,obj);
                $allActiveLi.siblings('ul').show();
            }
        });

        // Retrieve cookie value and set active items
//		function checkCookie(cookieId, obj){
//			var cookieVal = $.cookie(cookieId);
//			if(cookieVal != null){
//				// create array from cookie string
//				var activeArray = cookieVal.split(',');
//				$.each(activeArray, function(index,value){
//					var $cookieLi = $('li:eq('+value+')',obj);
//					$('> a',$cookieLi).addClass(defaults.classActive);
//					var $parentsLi = $cookieLi.parents('li');
//					$('> a',$parentsLi).addClass(defaults.classActive);
//				});
//			}
//		}

        // Write cookie
//		function createCookie(cookieId, obj){
//			var activeIndex = [];
//			// Create array of active items index value
//			$('li a.'+defaults.classActive,obj).each(function(i){
//				var $arrayItem = $(this).parent('li');
//				var itemIndex = $('li',obj).index($arrayItem);
//					activeIndex.push(itemIndex);
//				});
//			// Store in cookie
//			$.cookie(cookieId, activeIndex, { path: '/' });
//		}
    };
})(jQuery);