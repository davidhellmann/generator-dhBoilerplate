<?php

namespace Craft;

/**
 * TaskManager Model Test.
 *
 * Asserts for the TaskManagerModel class
 *
 * @author    Bob Olde Hampsink <b.oldehampsink@itmundi.nl>
 * @copyright Copyright (c) 2015, Bob Olde Hampsink
 * @license   MIT
 *
 * @link      http://github.com/boboldehampsink
 *
 * @coversDefaultClass Craft\TaskManagerModel
 * @covers ::<!public>
 */
class TaskManager_ModelTest extends BaseTest
{
    /**
     * {@inheritdoc}
     */
    public static function setUpBeforeClass()
    {
        parent::setUpBeforeClass();
        require_once __DIR__ . '/../models/TaskManagerModel.php';
    }

    /**
     * Test getTitle.
     *
     * @covers ::getTitle
     */
    final public function testGetTitle()
    {
        // Mock localization service
        $this->setMockLocalizationService();

        // Set up model
        $model = new TaskManagerModel();

        // Set description attribute
        $model->description = 'test';

        // Assert title/description
        $this->assertSame($model->getTitle(), $model->description);
    }

    /**
     * Test getStatus.
     *
     * @covers ::getStatus
     * @dataProvider provideStatuses
     */
    final public function testGetStatus($taskStatus, $elementStatus)
    {
        // Mock localization service
        $this->setMockLocalizationService();

        // Set up model
        $model = new TaskManagerModel();

        // Set status attribute
        $model->status = $taskStatus;

        // Assert element status
        $this->assertSame($model->getStatus(), $elementStatus);
    }

    /**
     * Mock localization service.
     *
     * @return LocalizationService
     */
    private function setMockLocalizationService()
    {
        $mock = $this->getMockBuilder('Craft\LocalizationService')
                    ->disableOriginalConstructor()
                    ->getMock();

        $this->setComponent(craft(), 'i18n', $mock);
    }

    /**
     * Provide statuses.
     *
     * @return array
     */
    final public function provideStatuses()
    {
        return array(
            'Pending' => array(TaskStatus::Pending, EntryModel::PENDING),
            'Error'   => array(TaskStatus::Error, EntryModel::EXPIRED),
            'Running' => array(TaskStatus::Running, EntryModel::LIVE),
            'Unknown' => array('unknown', EntryModel::DISABLED),
        );
    }
}
