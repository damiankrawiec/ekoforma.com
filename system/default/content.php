<?php

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin);

$sectionData = $this->getSection();

$label = $object->getAllLabel();

?>

<div id="im-content">

<!-- Menu and logo on full width -->

    <div class="container-fluid">

        <!-- Position absolute or fixed -->

        <?php $object->display($sectionData->id, $label['social-media']); ?>

        <?php $object->display($sectionData->id, $label['about']); ?>

        <!-- end position -->

        <?php $object->display($sectionData->id, $label['menu']); ?>

        <?php $object->display($sectionData->id, $label['logo']); ?>

    </div>

    <!-- Only this section is displayed in everything section -->
    <div class="<?php echo (!isset($sectionData->class) ? 'container' : $sectionData->class) ?> animated fadeIn im-content-inside">

        <?php

        //Option:
        //    //- parent (to section field, show child sections of current section)
        //    //- begin, end (must be together) - connected 2 or more label group in one row
        //    //- pagination always with :X on the right (number of objects show on one page of paging)
        //    //- submenu show section name and his children via dropdown
        //    //- scroll insert a scroll tag (animate scrolling)

        ?>

        <?php

        if($sectionData->url === 'home') {

            $object->display($sectionData->id, $label['row-1']);

        }else{

            $object->display($sectionData->id, $label['content']);

        }

        ?>

    </div>

    <?php if($sectionData->url === 'home') { ?>

        <div class="im-background">

            <div class="<?php echo (!isset($sectionData->class) ? 'container' : $sectionData->class) ?> animated fadeIn im-content-inside">

                <?php $object->display($sectionData->id, $label['row-2']); ?>

            </div>

        </div>

        <div class="<?php echo (!isset($sectionData->class) ? 'container' : $sectionData->class) ?> animated fadeIn im-content-inside">

            <?php $object->display($sectionData->id, $label['row-3']); ?>

        </div>

    <?php } ?>

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

<!--Title of first row need to be injection by jQuery (RWD grid) -->

<?php $object->display($sectionData->id, $label['title-row']); ?>

<!--Title of first, second, third row (at the beginning) need to be injection by jQuery (RWD grid) -->

<?php $object->display($sectionData->id, $label['title-col']); ?>

<?php

if(!isset($session['cookie']))
    $object->display($sectionData->id, $label['cookie']);