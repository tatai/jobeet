<?php
// Connection Component Binding
Doctrine_Manager::getInstance()->bindComponent('JobeetCategory', 'doctrine');

/**
 * BaseJobeetCategory
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @property integer $id
 * @property string $name
 * @property timestamp $created_at
 * @property timestamp $updated_at
 * @property Doctrine_Collection $JobeetCategoryAffiliate
 * @property Doctrine_Collection $JobeetJobs
 * 
 * @method integer             getId()                      Returns the current record's "id" value
 * @method string              getName()                    Returns the current record's "name" value
 * @method timestamp           getCreatedAt()               Returns the current record's "created_at" value
 * @method timestamp           getUpdatedAt()               Returns the current record's "updated_at" value
 * @method Doctrine_Collection getJobeetCategoryAffiliate() Returns the current record's "JobeetCategoryAffiliate" collection
 * @method Doctrine_Collection getJobeetJobs()              Returns the current record's "JobeetJobs" collection
 * @method JobeetCategory      setId()                      Sets the current record's "id" value
 * @method JobeetCategory      setName()                    Sets the current record's "name" value
 * @method JobeetCategory      setCreatedAt()               Sets the current record's "created_at" value
 * @method JobeetCategory      setUpdatedAt()               Sets the current record's "updated_at" value
 * @method JobeetCategory      setJobeetCategoryAffiliate() Sets the current record's "JobeetCategoryAffiliate" collection
 * @method JobeetCategory      setJobeetJobs()              Sets the current record's "JobeetJobs" collection
 * 
 * @package    jobeet
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 6820 2009-11-30 17:27:49Z jwage $
 */
abstract class BaseJobeetCategory extends sfDoctrineRecord
{
    public function setTableDefinition()
    {
        $this->setTableName('jobeet_category');
        $this->hasColumn('id', 'integer', 8, array(
             'type' => 'integer',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => true,
             'autoincrement' => true,
             'length' => '8',
             ));
        $this->hasColumn('name', 'string', 255, array(
             'type' => 'string',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => '255',
             ));
        $this->hasColumn('created_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => '25',
             ));
        $this->hasColumn('updated_at', 'timestamp', 25, array(
             'type' => 'timestamp',
             'fixed' => 0,
             'unsigned' => false,
             'primary' => false,
             'notnull' => true,
             'autoincrement' => false,
             'length' => '25',
             ));
    }

    public function setUp()
    {
        parent::setUp();
        $this->hasMany('JobeetCategoryAffiliate', array(
             'local' => 'id',
             'foreign' => 'category_id'));

        $this->hasMany('JobeetJobs', array(
             'local' => 'id',
             'foreign' => 'category_id'));

        $timestampable0 = new Doctrine_Template_Timestampable();
        $sluggable0 = new Doctrine_Template_Sluggable(array(
             'fields' => 
             array(
              0 => 'name',
             ),
             ));
        $this->actAs($timestampable0);
        $this->actAs($sluggable0);
    }
}