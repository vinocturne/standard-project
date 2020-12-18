//즉시 실행 함수 
(function (window, document) {
    //모듈화 ,엄격한 자바스크립트문으로 사용하겠어!!
    'use strict';

    const $toggles =document.querySelectorAll('.toggle');  //NodeList:유사배열
    const $toggleBtn = document.getElementById('toggle-btn');
    
    $toggleBtn.addEventListener('click', function() {
        toggleElements();
    });
    
    window.addEventListener('resize', function(){
        if (window.innerWidth > 1024 ){
            //Off Toggle element해줘랏!
            offElements();
        }
    });

    function toggleElements() {
        //반복하는 이유: 같은이름의 toggle클래스가 2개있기 때문에 
        //갯수가 유동적으로 변동될수 있기 때문에 갯수에 상관없이 처리하기 위해
        [].forEach.call($toggles, function(toggle) {
            toggle.classList.toggle('on');
        });
    }
    function offElements() {
        [].forEach.call($toggles, function(toggle) {
            toggle.classList.remove('on');
        }); 
    }
})(window, document)
