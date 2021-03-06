<?php
/* For licensing terms, see /license.txt */

namespace Chamilo\CoreBundle\Settings;

use Sylius\Bundle\SettingsBundle\Schema\SchemaInterface;
use Sylius\Bundle\SettingsBundle\Schema\SettingsBuilderInterface;
use Symfony\Component\Form\FormBuilderInterface;

/**
 * Class SessionSettingsSchema
 * @package Chamilo\CoreBundle\Settings
 */
class SessionSettingsSchema extends AbstractSettingsSchema
{
    /**
     * {@inheritdoc}
     */
    public function buildSettings(SettingsBuilderInterface $builder)
    {
        $builder
            ->setDefaults(
                array(
                    'add_users_by_coach' => 'false',
                    'extend_rights_for_coach' => 'false',
                    'show_session_coach' => 'false',
                    'show_session_data' => 'false',
                    'allow_coach_to_edit_course_session' => 'true',
                    'show_groups_to_users' => 'false',
                    'hide_courses_in_sessions' => 'false',
                    'allow_session_admins_to_manage_all_sessions' => 'false',
                    'session_tutor_reports_visibility' => 'false',
                    'session_page_enabled' => 'true',
                    'allow_teachers_to_create_sessions' => 'false',
                    'prevent_session_admins_to_manage_all_users' => 'false',
                    'session_course_ordering' => 'false',
                    'limit_session_admin_role' => 'false',
                    'allow_tutors_to_assign_students_to_session' => 'false',
                    'drh_can_access_all_session_content' => 'true',
                    'catalog_allow_session_auto_subscription' => 'false',
                    'allow_session_course_copy_for_teachers' => 'false',
                    'my_courses_view_by_session' => 'false',
                    'session_days_after_coach_access' => '',
                    'session_days_before_coach_access' => '',
                    'show_session_description' => 'false'
                )
            )
        ;

        $allowedTypes = array(
            'add_users_by_coach' => array('string'),
        );
        $this->setMultipleAllowedTypes($allowedTypes, $builder);
    }

    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder)
    {
        $builder
            ->add(
                'add_users_by_coach',
                'yes_no',
                [
                    'label' => 'AddUsersByCoachTitle',
                    'help_block' => 'AddUsersByCoachComment'
                ]
            )
            ->add('extend_rights_for_coach', 'yes_no')
            ->add('show_session_coach', 'yes_no')
            ->add('show_session_data', 'yes_no')
            ->add('allow_coach_to_edit_course_session', 'yes_no')
            ->add('show_groups_to_users', 'yes_no')
            ->add('hide_courses_in_sessions', 'yes_no')
            ->add('allow_session_admins_to_manage_all_sessions', 'yes_no')
            ->add('session_tutor_reports_visibility', 'yes_no')
            ->add('session_page_enabled', 'yes_no')
            ->add('allow_teachers_to_create_sessions', 'yes_no')
            ->add('prevent_session_admins_to_manage_all_users', 'yes_no')
            ->add('session_course_ordering',
                'text',
                [
                    'label' => 'SessionCourseOrderingTitle',
                    'help_block'=>'SessionCourseOrderingComment']
            )
            ->add('limit_session_admin_role', 'yes_no')
            ->add('allow_tutors_to_assign_students_to_session', 'yes_no')
            ->add('drh_can_access_all_session_content', 'yes_no')
            ->add('catalog_allow_session_auto_subscription', 'yes_no')
            ->add('allow_session_course_copy_for_teachers', 'yes_no')
            ->add('my_courses_view_by_session', 'yes_no')
            ->add('session_days_after_coach_access')
            ->add('session_days_before_coach_access')
            ->add('show_session_description', 'yes_no')
        ;
    }
}
