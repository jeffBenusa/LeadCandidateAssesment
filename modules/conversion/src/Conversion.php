<?php

namespace modules\conversion;

use Craft;

use yii\base\Module;
use yii\base\Event;
use Solspace\Freeform\Services\Pro\WebhooksService;
use Solspace\Freeform\Events\Integrations\FetchWebhookTypesEvent;

use modules\conversion\webhooks\WebhookSite;

class Conversion extends Module
{
    // Public Methods
    // =========================================================================

    public function init()
    {
        // Define a custom alias named after the namespace
        Craft::setAlias('@modules/conversion', $this->getBasePath());

        parent::init();

        // Listen for the Fetch Webhook Types event
        Event::on(
            WebhooksService::class,
            WebhooksService::EVENT_FETCH_TYPES,
            function (FetchWebhookTypesEvent $event) {
                // Add the previously created Custom\Plugin\CustomWebhook class
                // by passing its fully qualified name to the event
                $event->addType(WebhookSite::class);
            }
        );
    }
}
