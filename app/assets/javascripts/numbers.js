$(function(){
    var client = new Faye.Client('https://sheltered-plateau-4876.herokuapp.com/faye');
    var subscription = client.subscribe('/nupdate', function(message){
        console.log(message);
    }); 
    document.onkeydown = function(){
        if(window.event.keyCode === 13){
            console.log("detected key");
            $.ajax({
                url: "/refresh",
                data: {message: 'gimme some number'},
                type: "POST"
            }
            );
            // var publication = client.publish('/refresh', {
            //     message: 'gimme some number'
            // });
            // publication.then(function() {
            //         alert('Message received by server!');
            //     }, function(error) {
            //         alert('There was a problem: ' + error.message);
            //     }
            // );
        }
    }
}
)