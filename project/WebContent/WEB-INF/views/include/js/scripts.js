/*
 * ---------------------------------------------------------------------------
 * jQuery Version
 * ---------------------------------------------------------------------------
 */
var $window = $(window),
$mainHeader = $('#main-header'),
$defaultLogo = 'images/logo.svg',
$smallLogo = 'images/logo-shrink.svg';

$window.scroll(function(){
	if($(this).scrollTop() >100){
		if(!$mainHeader.hasClass('shrink')){
			$mainHeader.addClass('shrink');
			switchImages($smallLogo);
		}
	}else{
		if($mainHeader.hasClass('shrink')){
			$mainHeader.removeClass('shrink');
			switchImages($defaultLogo);
		}
	}
});
//switchImage 함수 
function switchImages(newPath){
	var $logo = $('#logo');
	$mainHeader.fadeOut(150, function(){
		$logo.attr ('src',newPath);
		$mainHeader.fadeIn(150);
	});
}


/*
 * ---------------------------------------------------------------------------
 * Vanilla JavaScript Version
 * ---------------------------------------------------------------------------
 */

