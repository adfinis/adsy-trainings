/**
 * PhantomJS script to capture/render screenshots of the slides of a Reveal.js powered slideshow.
 */

var page = require('webpage').create();
var args = require('system').args;

// Get url to render from command line.
var url;
if (args.length < 2) {
    console.error('No url specified');
    phantom.exit();
}
else {
    url = args[1];
}

// (Optional) prefix for renders.
var prefix = args.length >= 3 ? args[2] : 'tmp-slide-';


// Set render size.
page.papersize = { format: 'A4', orientation: 'landscape' };

// Open the url and do your thing.
page.open(url, function (status) {

    if (status !== 'success') {
        console.error('Failed to open url ' + url);
        phantom.exit();
    }

    // Disable slide transitions so we don't lose time on that.
    page.evaluate(function() {
        // Apparently setting "transition" and "backgroundTransition" to "none"
        // is enough to disable slide transitions, even if there are per-slide transitions.
        Reveal.configure({
            'transition': 'none',
            'backgroundTransition': 'none'
        });
    });

    // Disable transitions on "fragmented views".
    page.evaluate(function() {
        var fragments = document.getElementsByClassName('fragment');
        for (var f = fragments.length - 1; f >= 0; f--) {
            fragments[f].classList.remove('fragment');
        }
    });


    // Render all slides.
    var slideCounter = 1;
    var isLastSlide = function() {
        return page.evaluate(function() {
            return Reveal.isLastSlide();
        });
    };
    var next = function() {
        return page.evaluate(function() {
            return Reveal.next();
        });
    };

    // Left pad for slidecounter.
    var lpad =function(n, width, z) {
        z = z || '0';
        n = n + '';
        return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
    };

    while (!isLastSlide()) {
        // Capture.
        var filename = prefix + lpad(slideCounter, 3) + '.pdf';
        console.log('Rendering ' + filename);
        page.render(filename);

        // Go to next slide (if any).
        next();
        slideCounter++;
    }

    phantom.exit();

});
