(() => {


    // home page that makes requests to map different sets of query joins
    function requestData(param) {
        fetch(`includes/request.php`, {
                method: 'POST',
                headers: { 'Content-Type': 'json' },
                body: JSON.stringify({ 'type': param })
            })
            .then(res => res.json())
            .then(function(data) {
                document.getElementById('modal_cont').classList.remove("d-none");
                document.getElementById('modal_cont').classList.add("d-flex");
                var disp = document.getElementById("disp");
                var li = '';
                if(data.length < 1){
                    li += `
                        <div class='d-flex justify-content-center py-5'>
                            <span class="text-danger">Seems there are no orders made today</span>
                        </div>                    
                    `;
                }
                for(var i=0;i<data.length;i++){
                    var keys = Object.keys(data[i]).filter(function(e){
                        if(isNaN(e)) return e;
                    });
                    li += `
                    <li class='list-group-item py-1 w-100'>
                        <div class='row w-100'>
                            <small class='text-info col-2'>${data[i].id}</small>
                            <small class='col-6'>${data[i].name}</small>
                            <small class='col-4'>${data[i].cname}</small>
                        </div>
                    </li>
                    `;
                }
                document.getElementById('disp').innerHTML = li;
            });
    };
    var title = document.getElementById('title');

    document.getElementById('all_books').onclick = () => {
        title.innerHTML = 'All books in the database'
        requestData('all_books')
    };
    document.getElementById('most_ordered').onclick = () => {
        title.innerHTML = 'Most oredered books of all time'
        requestData('most_ordered');
    };
    document.getElementById('pending').onclick = () => {
        title.innerHTML = 'Pending orders'
        requestData('pending');
    };
    document.getElementById('curr_orders').onclick = () => {
        title.innerHTML = 'Current orders made today'
        requestData('curr_orders');
    };
    document.getElementById('previous_month').onclick = () => {
        title.innerHTML = 'Previous month orders(Last 30 days)'
        requestData('previous_month');
    };

    document.querySelector('button.close').onclick = () => {
        document.getElementById('modal_cont').classList.remove('d-flex');
        document.getElementById('modal_cont').classList.add('d-none');
    };

})();