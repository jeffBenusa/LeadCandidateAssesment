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