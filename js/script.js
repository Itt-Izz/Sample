(() => {
    /**
     * all js logic to fall here
     */
    let form = document.getElementById('form_')

    form.onsubmit = function(e) {
        e.preventDefault();
        let data = Object.assign(...Array.from(new FormData(this), ([x, y]) => ({
            [x]: y.trim()
        })));

        fetch('content/includes/login.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            })
            .then(res => res.json())
            .then(data => {
                console.log(data)
                if (data.message == 'authorized') {
                    location.href = `content/home.php?user=${data.session}`
                } else {
                    console.log('Failed to authenticate');
                }
            })
            // now the form has been submitted
    }

})();