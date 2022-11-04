{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
<div class="images-container js-images-container">
  {block name='product_cover'}
    <div class="product-cover">
      {if $product.default_image}
        <picture>
          {if isset($product.default_image.bySize.product_main.sources.avif)}
            <source 
              srcset="
                {$product.default_image.bySize.product_main.sources.avif},
                {$product.default_image.bySize.product_main_2x.sources.avif} 2x"
              type="image/avif"
            >
          {/if}

          {if isset($product.default_image.bySize.product_main.sources.webp)}
            <source 
              srcset="
                {$product.default_image.bySize.product_main.sources.webp},
                {$product.default_image.bySize.product_main_2x.sources.webp} 2x"
              type="image/webp"
            >
          {/if}

          <img
            class="js-qv-product-cover img-fluid"
            srcset="
              {$product.default_image.bySize.product_main.url},
              {$product.default_image.bySize.product_main_2x.url} 2x"
            src="{$product.default_image.bySize.product_main.url}" 
            width="{$product.default_image.bySize.product_main.width}"
            height="{$product.default_image.bySize.product_main.height}"
            loading="eager"
            alt="{if !empty($product.default_image)}{$product.default_image.legend}{else}{$product.name}{/if}"
            title="{if !empty($product.default_image.legend)}{$product.default_image.legend}{else}{$product.name}{/if}"
            data-full-size-image-url="{$product.default_image.bySize.home_default.url}"
        </picture>

        <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
          <i class="material-icons zoom-in">search</i>
        </div>
      {else}
        <picture>
          {if isset($urls.no_picture_image.bySize.product_main.sources.avif)}
            <source 
              srcset="
                {$urls.no_picture_image.bySize.product_main.sources.avif},
                {$urls.no_picture_image.bySize.product_main_2x.sources.avif} 2x"
              type="image/avif"
            >
          {/if}

          {if isset($urls.no_picture_image.bySize.product_main.sources.webp)}
            <source 
              srcset="
                {$urls.no_picture_image.bySize.product_main.sources.webp},
                {$urls.no_picture_image.bySize.product_main_2x.sources.webp} 2x"
              type="image/webp"
            >
          {/if}

          <img
            class="img-fluid"
            srcset="
              {$urls.no_picture_image.bySize.product_main.url},
              {$urls.no_picture_image.bySize.product_main_2x.url} 2x"
            width="{$urls.no_picture_image.bySize.product_main.width}"
            height="{$urls.no_picture_image.bySize.product_main.height}"
            src="{$urls.no_picture_image.bySize.product_main.url}" 
            loading="lazy"
            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}"
            title="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name}{/if}"
          >
        </picture>
      {/if}
    </div>
  {/block}

  {block name='product_images'}
    <div class="js-qv-mask mask">
      <ul class="product-images js-qv-product-images">
        {foreach from=$product.images item=image}
          <li class="thumb-container js-thumb-container">
            <picture>
              {if isset($image.bySize.default_xs.sources.avif)}
                <source 
                  srcset="
                    {$image.bySize.default_xs.sources.avif},
                    {$image.bySize.default_m.sources.avif} 2x",
                  type="image/avif"
                >
              {/if}

              {if isset($image.bySize.default_xs.sources.webp)}
                <source 
                  srcset="
                    {$image.bySize.default_xs.sources.webp},
                    {$image.bySize.default_m.sources.webp} 2x"
                  type="image/webp"
                >
              {/if}

              <img
                class="thumb js-thumb {if $image.id_image == $product.default_image.id_image} selected js-thumb-selected {/if}"
                srcset="
                  {$image.bySize.default_xs.url},
                  {$image.bySize.default_m.url} 2x"
                width="{$image.bySize.default_xs.width}"
                height="{$image.bySize.default_xs.height}"
                loading="lazy"
                alt="{if !empty($image)}{$image.legend}{else}{$product.name}{/if}"
                title="{if !empty($image.legend)}{$image.legend}{else}{$product.name}{/if}"
                data-full-size-image-url="{$product.cover.bySize.home_default.url}"
                data-image-medium-src="{$image.bySize.product_main.url}"
                data-image-large-src="{$image.bySize.product_main_2x.url}"
              >
            </picture>
          </li>
        {/foreach}
      </ul>
    </div>
  {/block}
{hook h='displayAfterProductThumbs' product=$product}
</div>
