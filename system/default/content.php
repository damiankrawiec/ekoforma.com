<?php

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin);

$sectionData = $this->getSection();

$label = $object->getAllLabel();

?>

<div id="im-content">

    <div id="<?php echo $sectionData->url; ?>">

        <!-- Menu and logo on full width -->

        <div class="container-fluid">

            <!-- Position absolute or fixed -->

            <?php $object->display($sectionData->id, $label['social-media']); ?>

            <?php $object->display($sectionData->id, $label['about']); ?>

            <!-- end position -->

            <?php $object->display($sectionData->id, $label['menu'], 'submenu'); ?>

            <?php $object->display($sectionData->id, $label['logo']); ?>

        </div>

        <?php

        //Option:
        //    //- parent (to section field, show child sections of current section)
        //    //- begin, end (must be together) - connected 2 or more label group in one row
        //    //- pagination always with :X on the right (number of objects show on one page of paging)
        //    //- submenu show section name and his children via dropdown
        //    //- scroll insert a scroll tag (animate scrolling)

        ?>

        <?php

            if($sectionData->url !== 'home') {

                echo '<div class="text-center h4 p-3 section-title">';

                if($sectionData->icon !== '')
                    echo '<i class="'.$sectionData->icon.'"></i>';

                    echo $sectionData->name;

                echo '</div>';

            }

            if($sectionData->url === 'sniadania') {

                $object->display($sectionData->id, $label['menu'], 'parent');

            }

            if($sectionData->url !== 'lifestyle' and $sectionData->url !== 'podroze') {

                echo '<div class="' . (!isset($sectionData->class) ? 'container' : $sectionData->class) . ' animated fadeIn im-content-inside">';

                    $object->display($sectionData->id, $label['row-1']);

                echo '</div>';

            }

            if($sectionData->url === 'home' or $sectionData->url === 'lifestyle') {

                if($sectionData->url === 'home')
                    echo '<div class="im-background">';

                echo '<div class="'.(!isset($sectionData->class) ? 'container' : $sectionData->class).' animated fadeIn im-content-inside">';

                    $object->display($sectionData->id, $label['row-2']);

                echo '</div>';

                if($sectionData->url === 'home')
                    echo '</div>';

            }

            if($sectionData->url === 'home' or $sectionData->url === 'podroze') {

                echo '<div class="'.(!isset($sectionData->class) ? 'container' : $sectionData->class).' animated fadeIn im-content-inside">';

                    $object->display($sectionData->id, $label['row-3']);

                echo '</div>';

            }

        ?>

        <?php

        //Static content (when in system is "static" dir, and file is named like current url section) - if both are false static content is not display
        //In static file should be defined class, rows, col, etc. - content fix to rest page box
        //Name of files may only string section - check in foreach(dir) and stristr()
        $object->displayStatic($sectionData->id);

        ?>

        <div class="container-fluid">

            <?php $object->display($sectionData->id, $label['footer']); ?>

            <?php $object->display($sectionData->id, $label['footer-sitemap']); ?>

            <?php $object->display($sectionData->id, $label['author']); ?>

        </div>

    </div>

</div>

<?php if($sectionData->url === 'home') { ?>

    <!--Title of first row need to be injection by jQuery (RWD grid) -->

    <?php $object->display($sectionData->id, $label['title-row']); ?>

    <!--Title of first, second, third row (at the beginning) need to be injection by jQuery (RWD grid) -->

    <?php $object->display($sectionData->id, $label['title-col']); ?>

<?php } ?>

<?php

if(!isset($session['cookie']))
    $object->display($sectionData->id, $label['cookie']);