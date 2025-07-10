<?php

namespace Dockworker\Robo\Plugin\Commands;

use Dockworker\DockworkerDaemonCommands;

/**
 * Provides commands for building and deploying the Solr application.
 */
class SolrDeployCommands extends DockworkerDaemonCommands
{
    /**
     * Provides error log trigers and exceptions for the solr application.
     *
     * @hook on-event dockworker-logs-errors-exceptions
     *
     * @return mixed[]
     *   The error log exceptions.
     */
    public function provideErrorLogConfiguration(): array
    {
        return [
            [],
            array_values(
                [
                    'Warning, not an error.' => 'VM warning: Failed to reserve shared memory',
                ]
            ),
        ];
    }
}