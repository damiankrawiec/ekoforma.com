<?php

if($this->checkSection($this->currentSection, 'ekopasnik', true))
    $this->link('sniadania');

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin);

$sectionData = $this->getSection($this->currentSection);

$label = $object->getAllLabel();

?>

<?php

//Show category select on ekopasnik sections
if($sectionData['parent'] == $this->getSection('ekopasnik', 'id')) {

    echo '<style>
            .form-group{
                display: block;
            }
          </style>';

}

?>

<div id="im-content">

    <div id="<?php echo $this->currentSection; ?>">

        <!-- Menu and logo on full width -->

        <div class="container-fluid">

            <!-- Position absolute or fixed -->

            <?php $object->display($sectionData['id'], $label['social-media']); ?>

            <?php $object->display($sectionData['id'], $label['about']); ?>

            <!-- end position -->

            <?php $object->display($sectionData['id'], $label['menu'], 'submenu'); ?>

            <?php $object->display($sectionData['id'], $label['logo']); ?>

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

            //div class to all rows (it is only variable:string)
            $divClass = ' class="' . ($sectionData['class'] === '' ? 'container' : $sectionData['class']) . ' animated fadeIn im-content-inside"';

            if($this->checkSection($this->currentSection, 'home', false) and $sectionData['parent'] != $this->getSection('ekopasnik', 'id')) {

                echo '<div class="text-center h4 p-3 section-title">';

                if($sectionData['icon'] !== '')
                    echo '<i class="'.$sectionData['icon'].'"></i>';

                    echo $sectionData['name'];

                echo '</div>';

            }

            if($this->checkSection($this->currentSection, 'sniadania, dania-glowne, kolacje, przekaski, desery', true)) {

                echo '<div class="container">';

                    $object->display($this->getSection('ekopasnik', 'id'), $label['submenu'], 'parent');

                echo '</div>';

            }

            if($this->checkSection($this->currentSection, 'lifestyle, podroze', false)) {

                echo '<div'.$divClass.'>';

                    $object->display($sectionData['id'], $label['row-1']);

                echo '</div>';

            }

            if($this->checkSection($this->currentSection, 'home, lifestyle', true)) {

                if($this->checkSection($this->currentSection, 'home', true))
                    echo '<div class="im-background">';

                echo '<div'.$divClass.'>';

                    $object->display($sectionData['id'], $label['row-2']);

                echo '</div>';

                if($this->checkSection($this->currentSection, 'home', true))
                    echo '</div>';

            }

            if($this->checkSection($this->currentSection, 'home, podroze', true)) {

                echo '<div'.$divClass.'>';

                    $object->display($sectionData['id'], $label['row-3']);

                echo '</div>';

            }

        ?>

        <?php

        //Static content (when in system is "static" dir, and file is named like current url section) - if both are false static content is not display
        //In static file should be defined class, rows, col, etc. - content fix to rest page box
        //Name of files may only string section - check in foreach(dir) and stristr()
        $object->displayStatic($sectionData['id']);

        ?>

        <div class="container-fluid">

            <?php $object->display($sectionData['id'], $label['footer']); ?>

            <?php $object->display($sectionData['id'], $label['footer-sitemap']); ?>

            <?php $object->display($sectionData['id'], $label['author']); ?>

        </div>

    </div>

</div>

<?php if($this->checkSection($this->currentSection, 'home', true)) { ?>

    <!--Title of first row need to be injection by jQuery (RWD grid) -->

    <?php $object->display($sectionData['id'], $label['title-row']); ?>

    <!--Title of first, second, third row (at the beginning) need to be injection by jQuery (RWD grid) -->

    <?php $object->display($sectionData['id'], $label['title-col']); ?>

<?php } ?>

<?php

if(!isset($session['cookie']))
    $object->display($sectionData['id'], $label['cookie']);