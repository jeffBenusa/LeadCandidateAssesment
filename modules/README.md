## Twig Templates

Please refactor the ```index.twig``` layout to your abilities. Feel free to create new directories or new twig files if
needed. Please make use of any functions that CratCMS allows you to such as  ```{% includes %}```, ```{% extends%}```,
and ```{% import %}```.

## Build Tools

We've added some SASS(scss) files in addition to this project to be used in conjuction with a couple of libraries we are
using. Please use a bundling tool that will compile these sass files together.

We would also like to see if you can
compile [Bootstrap](https://getbootstrap.com/docs/5.2/getting-started/introduction/)
and [GlideJS](https://glidejs.com/docs/) into a bundle. These libraries are currently being bought in via CDN. You can
use any tool you would like so feel free to use webpack, vite, grunt or gulp. Currently, at the agency we are using
webpack but looking to move towards vite. The SASS (scss) files are located in the ```src``` folder in this project.

Glide JS is initialized at the very bottom of the index template before the end of the ```</body>``` tag.

At Conversion Interactive we use NodeJS and NPM.

```html

<script>
    new Glide('.glide', {
        type: 'carousel',
        perView: 1,
        focusAt: 'center',
        autoplay: 2500
    }).mount()
</script>
```

## BEM

Please refactor any classes and ID's in the twig template to reflect best practices of BEM naming conventions and also
have it reflect in the SASS(scss) files as well. There are a few misused naming conventions on purpose. There is also a
large whitespace between the images and the content. Please remedy this gap to the best of your abilities. These images
are being used in conjunction with GlideJS.

![screenshot.png](screenshot.png)

## Freeform

A bulk of our work requiring our websites to make POST requests to other 3rd party vendors/ Applicant tracking systems.
This is typically done in the form of sending data in XML and JSON formats. We've created a simple form within the
freeform with some basic questions. We would like to see you extend some functionality of this FreeForm Plugin. This
would allow us to see your handling of php objects and namespace use.

We've created a hook into FreeForm under the ```modules``` folder which can be found at this file
path ```modules/conversion/Conversion.php```.

You can find documentation on freeform developer
events [here](https://docs.solspace.com/craft/freeform/v3/developer/submission-events.html#after-a-submission-is-submitted)
.

We've started you with the following code below. Feel free to modify delete or even create your own hook.

```php
<?php

namespace modules\businesslogic;


use Solspace\Freeform\Library\Composer\Components\Form;
use Solspace\Freeform\Events\Forms\SubmitEvent;

Event::on(
    Form::class,
    Form::EVENT_AFTER_SUBMIT,
    function (SubmitEvent $event) {
        $form = $event->getForm();
        $submission = $event->getSubmission();

    }
)

?>
```

We would like to see you send a post submission to the following
URL [https://webhook.site/#!/2a46ae18-4caa-4ea4-aac8-96f88fae8b5f/40cc170e-ed6d-4276-9821-6a912e4baf2b/1](https://webhook.site/#!/2a46ae18-4caa-4ea4-aac8-96f88fae8b5f/40cc170e-ed6d-4276-9821-6a912e4baf2b/1)
. The form has 4 fields which consists of First Name", "Last Name", "Email" and "Message".

Please feel free to make any adjustments you need. We would like to get a feel of your thought process and please feel
free to get creative as we do not have any strict guidelines.

### below is an example of how XML is sent via POST

```php
//The XML string that you want to send.
$xml = '<?xml version="1.0" encoding="ISO-8859-1"?>
<reminder>
    <date>2019-20-02T10:45:00</date>
    <heading>Meeting</heading>
    <body>Team meeting in Boardroom 2A.</body>
</reminder>';


//The URL that you want to send your XML to.
$url = 'http://localhost/xml';

//Initiate cURL
$curl = curl_init($url);

//Set the Content-Type to text/xml.
curl_setopt ($curl, CURLOPT_HTTPHEADER, array("Content-Type: text/xml"));

//Set CURLOPT_POST to true to send a POST request.
curl_setopt($curl, CURLOPT_POST, true);

//Attach the XML string to the body of our request.
curl_setopt($curl, CURLOPT_POSTFIELDS, $xml);

//Tell cURL that we want the response to be returned as
//a string instead of being dumped to the output.
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

//Execute the POST request and send our XML.
$result = curl_exec($curl);

//Do some basic error checking.
if(curl_errno($curl)){
    throw new Exception(curl_error($curl));
}

//Close the cURL handle.
curl_close($curl);

//Print out the response output.
echo $result;
```

## Database

We've added the Database dump to kick off this project withing the DB folder. Please let us know if you have any
problems spinning up this project.

the admin panel trigger is '/admin'
username: admin 
password:delta5mango

## Extras

Please let us know what you used to set up you local environment whether it is nitro, Docker, DDEV, MAMP or any other
tools of your choice.

# Questions and Submission

When completed please create a pull request with a branch with the following name convention e.g. ```firstname-lastname```.

If you have any questions or some of the instructions are not clear please feel free to reach out
to [jvargas@conversionia.com](jvargas@conversionia.com) or [elafontsee@conversionia.com](elafontsee@conversionia.com).
