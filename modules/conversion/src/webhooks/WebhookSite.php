<?php

namespace modules\conversion\webhooks;

use GuzzleHttp\Client;
use Solspace\Freeform\Events\Submissions\ProcessSubmissionEvent;
use Solspace\Freeform\Freeform;
use Solspace\Freeform\Library\Webhooks\AbstractWebhook;

class WebhookSite extends AbstractWebhook
{
    /**
     * @return string
     */
    public function getProviderName(): string
    {
        return 'Webhook.site';
    }

    /**
     * @param ProcessSubmissionEvent $event
     *
     * @return bool
     */
    public function triggerWebhook(ProcessSubmissionEvent $event): bool
    {
        $form       = $event->getForm();
        $submission = $event->getSubmission();

        $json = [
            'form' => $form->getName(),
            'submission'    => $submission->title,
            'field_params'       => [
                'firstName' => $_POST['firstName'],
                'lastName'  => $_POST['lastName'],
                'email'     => $_POST['email'],
                'message'   => $_POST['message']
            ],
        ];

        $client = new Client();
        $url = $this->getWebhook();
        try {
            $client->post($url, ['json' => $json]);

            return true;
        } catch (\Exception $e) {
            Freeform::getInstance()->logger->getLogger($this->getProviderName())->error($e->getMessage());
        }

        return false;
    }
}