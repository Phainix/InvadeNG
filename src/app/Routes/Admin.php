<?php

namespace App\Routes;

use App\Controllers\Admin\Auth as AdminAuthController;
use App\Controllers\Admin\Account as AdminAccountController;
use App\Controllers\Admin\Admin as AdminController;
use App\Controllers\Admin\Measurement as AdminMeasurementController;
use App\Controllers\Admin\Category as AdminCategoryController;
use App\Controllers\Admin\Material as AdminMaterialController;
use App\Controllers\Admin\Design as AdminDesignController;
use App\Controllers\Admin\Setting as AdminSettingController;
use App\MiddleWare\AuthMiddleware;

class Admin {

    public static function declare($app) {
        $container = $app->getContainer();
        $container['AdminAuthController'] = function ($c) {
            return new AdminAuthController($c);
        };
        $container['AdminController'] = function ($c) {
            return new AdminController($c);
        };
        $container['AdminAccountController'] = function ($c) {
            return new AdminAccountController($c);
        };
        $container['AdminMeasurementController'] = function ($c) {
            return new AdminMeasurementController($c);
        };
        $container['AdminCategoryController'] = function ($c) {
            return new AdminCategoryController($c);
        };
        $container['AdminMaterialController'] = function ($c) {
            return new AdminMaterialController($c);
        };
        $container['AdminDesignController'] = function ($c) {
            return new AdminDesignController($c);
        };
        $container['AdminSettingController'] = function ($c) {
            return new AdminSettingController($c);
        };

        $app->group('/backend', function($app) use ($container) {
            $app->get('', 'AdminController:home');
            $app->post('/login', 'AdminAuthController:login');

            $app->group('/account', function($app) {
                $app->get('/dashboard', 'AdminAccountController:dashboard');

                $app->group('/users', function($app) {
                    $app->get('', 'AdminAccountController:users');
                    $app->get('/status/{status}/{user}', 'AdminAccountController:changeStatus');
                    $app->get('/type/{type}/{user}', 'AdminAccountController:changeType');
                });

                $app->group('/measurements', function($app) {
                    $app->get('', 'AdminMeasurementController:measurements');
                    $app->post('', 'AdminMeasurementController:measurementsPost');
                    $app->get('/delete/{index}', 'AdminMeasurementController:deleteMeasurement');
                    $app->get('/toggle/{index}', 'AdminMeasurementController:toggleMeasurement');
                });

                $app->group('/categories', function($app) {
                    $app->get('', 'AdminCategoryController:categories');
                    $app->post('', 'AdminCategoryController:categoriesPost');
                    $app->get('/delete/{id}', 'AdminCategoryController:deleteCategories');
                    $app->get('/toggle/{id}/{status}', 'AdminCategoryController:toggleCategories');
                });
               
                $app->group('/materials', function($app) {
                    $app->get('', 'AdminMaterialController:materials');
                    $app->get('/manage/[{material_id}]', 'AdminMaterialController:materialsManage');
                    $app->post('/manage', 'AdminMaterialController:materialsManagePost');
                    $app->get('/status/{status}/{material_id}', 'AdminMaterialController:changeMaterialStatus');
                });

                $app->group('/designs', function($app) {
                    $app->get('', 'AdminDesignController:designs');
                    $app->get('/manage/[{design_id}]', 'AdminDesignController:designsManage');
                    $app->post('/manage', 'AdminDesignController:designsManagePost');
                    $app->get('/status/{status}/{design_id}', 'AdminDesignController:changeDesignStatus');
                    $app->get('/featured/{featured}/{design_id}', 'AdminDesignController:changeDesignFeatured');
                });

                $app->group('/settings', function($app) {
                    $app->get('', 'AdminSettingController:settings');
                    $app->group('/banners', function($app) {
                        $app->get('/manage/[{banner_id}]', 'AdminSettingController:bannersManage');
                        $app->post('/manage', 'AdminSettingController:bannersManagePost');
                        $app->get('/delete/{banner_id}', 'AdminSettingController:deleteBanner');
                    });
                    $app->get('/update/{setting}', 'AdminSettingController:updateSetting');
                    $app->group('/business_categories', function($app) {
                        $app->post('', 'AdminSettingController:businessCategoriesPost');
                        $app->get('/delete/{id}', 'AdminSettingController:deleteBusinessCategories');
                        $app->get('/toggle/{id}/{status}', 'AdminSettingController:toggleBusinessCategories');
                    });
                    $app->group('/pages', function($app) {
                        $app->get('/manage/[{page_id}]', 'AdminSettingController:pagesManage');
                        $app->post('/manage', 'AdminSettingController:pagesManagePost');
                        $app->get('/delete/{page_id}', 'AdminSettingController:deletePage');
                    });
                    $app->post('/images', 'AdminSettingController:imagesPost');
                    $app->get('/shipping/{shipping_method_id}', 'AdminSettingController:updateShipping');
                });

                $app->get('/contactus', 'AdminAccountController:contact');
            })->add(new AuthMiddleware($container, 1));
        });
    }

}