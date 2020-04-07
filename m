Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0736F1A050D
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586228144;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KojBLhSdtiCSgxHlkoWto9U2N4zapPgbStC8+XfvHJQ=;
	b=gjLtcIxhwU5xFDttx0wgtS5nmKJhkBdBPjrIPkPVyZzWRJnVBQsLW1LAIOqLNlF/J6Ac5w
	dTnHi7aClscrJZEEMH53ICFgeHAq6IEqHnu25RMytQaKJEox1maNiflMynz+yyQuLJcs5k
	/LM1eCqBAv2wSU5zsn8p8q/3sM8txmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-GbHwmzMcPK-l0R7hHKPeqw-1; Mon, 06 Apr 2020 22:55:42 -0400
X-MC-Unique: GbHwmzMcPK-l0R7hHKPeqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD3BA801A00;
	Tue,  7 Apr 2020 02:55:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 732CF19C58;
	Tue,  7 Apr 2020 02:55:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E6E918089CD;
	Tue,  7 Apr 2020 02:55:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372tVc6002668 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:55:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45F39D0B3C; Tue,  7 Apr 2020 02:55:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40FB7D016A
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:55:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E86818FF663
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:55:28 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-114-btYxHQ6wN_qR3lSjQNRfnQ-1; Mon, 06 Apr 2020 22:55:24 -0400
X-MC-Unique: btYxHQ6wN_qR3lSjQNRfnQ-1
IronPort-SDR: lTL5W2ERvSTPwNYliJAzixrrjTzYgj9z7a9FvVxV4TNF3ozRNX8EaAgKNMjU2RyKrGX90snqmo
	gJFGGB5vl5e68a93A1LNQvbCbBeLxoEU3ATJ/VL1eJo/8TtDZeLWJagsnN9XWULzsEnwjEnAqa
	2tSdrRJrwf6+61py5Ulsunne5ruxYKEV7Ln3V/jZ9ZB1jpQ2+NP3GEmpEK/iZ/CzGwYjdRo3oK
	aV2BFa9hgGd2ZBEZ2jAxLjj9bfA8ZAlx1v1w0nuk9jDZiMMJEG6YPDNQR2WR+XhkH2BcB7HKpN
	0P0=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="135051796"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:55:23 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20;
	Tue, 7 Apr 2020 02:55:22 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:55:21 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 09/11] dm-zoned: add metadata logging functions
Thread-Index: AQHWDDiv5ZXFgWdlukmKV852VfFqRg==
Date: Tue, 7 Apr 2020 02:55:21 +0000
Message-ID: <BY5PR04MB690054E690CD86F7103F6782E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-10-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a8117cc-7b48-43d4-fac6-08d7da9f1d1f
x-ms-traffictypediagnostic: BY5PR04MB7025:
x-microsoft-antispam-prvs: <BY5PR04MB7025B5B75A63122CCC33A0FFE7C30@BY5PR04MB7025.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:40;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(110136005)(54906003)(81156014)(478600001)(53546011)(6506007)(7696005)(8676002)(26005)(316002)(86362001)(2906002)(81166006)(8936002)(33656002)(76116006)(186003)(5660300002)(64756008)(66946007)(66476007)(55016002)(9686003)(4326008)(52536014)(66446008)(66556008)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dASpTWfoTUQziAGI9HB30rDTT1maiuGl2GsZTdnB6PiKCxioglUXuwUcbd61XVT72h5hAtLtavgk7q0SaZqEbXx+fZMyhiaONgONsg/Hf40WD9xaoLMPIeCJveds/NBy3KwPydDVxMF4QwyDIkMb/hJDCaIVPJM7sr/1aBU+dqh2TZkSTXKX1PHHy8oVSoMCcHpuEE70V6qpUvgq+6H450SzQeYmSYllEPDuHmBKI1w5yIjHvt+KZlkh3i9eQdhCKMrhwtlrMr4U26JjbObnfmilihw8tql+6LV+Tg+IuVE3XZbOv8tDr0xabA8AbpvUzpHEIoqckLM6dd+su9/mViopqC+3S8NGjIkOQajvVXRxOnFhcqd/ghMF2BAjdX9qF3Nlaa8+o5O645HX3i74K+Y17PQGE59i0As5IK0DJWY++hkvQI8chIv7h/kKmbw7
x-ms-exchange-antispam-messagedata: yYcHN7X6o8jdo/yNV4R3UpVhllo5wCSt8ToKl19AJuTFFf3/SD9fmp9PT17ohL+4NKCh3p9RNFD0kmboN2E/Dbux3DW/vsNNJP8c3zaTgOLbAAH8EcSNwesNlbnw4532ZOYQz/WmEeLVTVHCy7AdRQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8117cc-7b48-43d4-fac6-08d7da9f1d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:55:21.8638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qC5B1cW6eOoBp2YIg/tgT+yA4ZSEQm5cNLqWwfnEx0w24DaBUOyWC/uWND5hS3DlyCsPxpro/Or6/Mu5zaLNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7025
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372tVc6002668
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/11] dm-zoned: add metadata logging
	functions
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:27, Hannes Reinecke wrote:
> Use the metadata label for logging and not the underlying
> device.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 89 +++++++++++++++++++++-------------
>  drivers/md/dm-zoned-target.c   |  3 +-
>  2 files changed, 56 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 08707c886ca2..6c52cbf290d5 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -194,6 +194,17 @@ struct dmz_metadata {
>  	wait_queue_head_t	free_wq;
>  };
>  
> +#define dmz_zmd_info(zmd, format, args...)	\
> +	DMINFO("(%s): " format, (zmd)->devname, ## args)
> +
> +#define dmz_zmd_err(zmd, format, args...)	\
> +	DMERR("(%s): " format, (zmd)->devname, ## args)
> +
> +#define dmz_zmd_warn(zmd, format, args...)	\
> +	DMWARN("(%s): " format, (zmd)->devname, ## args)
> +
> +#define dmz_zmd_debug(zmd, format, args...)	\
> +	DMDEBUG("(%s): " format, (zmd)->devname, ## args)
>  /*
>   * Various accessors
>   */
> @@ -1098,7 +1109,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	int ret;
>  
>  	if (!zmd->sb[0].zone) {
> -		dmz_dev_err(zmd->dev, "Primary super block zone not set");
> +		dmz_zmd_err(zmd, "Primary super block zone not set");
>  		return -ENXIO;
>  	}
>  
> @@ -1135,7 +1146,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  
>  	/* Use highest generation sb first */
>  	if (!sb_good[0] && !sb_good[1]) {
> -		dmz_dev_err(zmd->dev, "No valid super block found");
> +		dmz_zmd_err(zmd, "No valid super block found");
>  		return -EIO;
>  	}
>  
> @@ -1248,7 +1259,7 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
>   */
>  static int dmz_init_zones(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = &zmd->dev[0];
>  	int ret;
>  
>  	/* Init */
> @@ -1268,8 +1279,8 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  	if (!zmd->zones)
>  		return -ENOMEM;
>  
> -	dmz_dev_info(dev, "Using %zu B for zone information",
> -		     sizeof(struct dm_zone) * zmd->nr_zones);
> +	DMINFO("(%s): Using %zu B for zone information",
> +	       zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
>  
>  	/*
>  	 * Get zone information and initialize zone descriptors.  At the same
> @@ -1412,7 +1423,6 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone);
>   */
>  static int dmz_load_mapping(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
>  	struct dm_zone *dzone, *bzone;
>  	struct dmz_mblock *dmap_mblk = NULL;
>  	struct dmz_map *dmap;
> @@ -1445,7 +1455,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  			goto next;
>  
>  		if (dzone_id >= zmd->nr_zones) {
> -			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
> +			dmz_zmd_err(zmd, "Chunk %u mapping: invalid data zone ID %u",
>  				    chunk, dzone_id);
>  			return -EIO;
>  		}
> @@ -1466,14 +1476,14 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  			goto next;
>  
>  		if (bzone_id >= zmd->nr_zones) {
> -			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
> +			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone ID %u",
>  				    chunk, bzone_id);
>  			return -EIO;
>  		}
>  
>  		bzone = dmz_get(zmd, bzone_id);
>  		if (!dmz_is_rnd(bzone)) {
> -			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone %u",
> +			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
>  				    chunk, bzone_id);
>  			return -EIO;
>  		}
> @@ -1894,7 +1904,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		atomic_dec(&zmd->unmap_nr_seq);
>  
>  	if (dmz_is_offline(zone)) {
> -		dmz_dev_warn(zmd->dev, "Zone %u is offline", dmz_id(zmd, zone));
> +		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> +
> +		dmz_dev_warn(dev, "Zone %u is offline", dmz_id(zmd, zone));
>  		zone = NULL;
>  		goto again;
>  	}
> @@ -2427,7 +2439,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  	while (!list_empty(&zmd->mblk_dirty_list)) {
>  		mblk = list_first_entry(&zmd->mblk_dirty_list,
>  					struct dmz_mblock, link);
> -		dmz_dev_warn(zmd->dev, "mblock %llu still in dirty list (ref %u)",
> +		dmz_zmd_warn(zmd, "mblock %llu still in dirty list (ref %u)",
>  			     (u64)mblk->no, mblk->ref);
>  		list_del_init(&mblk->link);
>  		rb_erase(&mblk->node, &zmd->mblk_rbtree);
> @@ -2445,7 +2457,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  	/* Sanity checks: the mblock rbtree should now be empty */
>  	root = &zmd->mblk_rbtree;
>  	rbtree_postorder_for_each_entry_safe(mblk, next, root, node) {
> -		dmz_dev_warn(zmd->dev, "mblock %llu ref %u still in rbtree",
> +		dmz_zmd_warn(zmd, "mblock %llu ref %u still in rbtree",
>  			     (u64)mblk->no, mblk->ref);
>  		mblk->ref = 0;
>  		dmz_free_mblock(zmd, mblk);
> @@ -2458,6 +2470,18 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  	mutex_destroy(&zmd->map_lock);
>  }
>  
> +void dmz_print_dev(struct dmz_metadata *zmd, int num)
> +{
> +	struct dmz_dev *dev = &zmd->dev[num];
> +
> +	dmz_dev_info(dev, "Host-%s zoned block device",
> +		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
> +		     "aware" : "managed");
> +	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
> +		     (u64)dev->capacity);
> +	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> +		     dev->nr_zones, (u64)zmd->zone_nr_sectors);
> +}
>  /*
>   * Initialize the zoned metadata.
>   */
> @@ -2535,34 +2559,31 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
>  	/* Metadata cache shrinker */
>  	ret = register_shrinker(&zmd->mblk_shrinker);
>  	if (ret) {
> -		dmz_dev_err(dev, "Register metadata cache shrinker failed");
> +		dmz_zmd_err(zmd, "Register metadata cache shrinker failed");
>  		goto err;
>  	}
>  
> -	dmz_dev_info(dev, "Host-%s zoned block device",
> -		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
> -		     "aware" : "managed");
> -	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
> -		     (u64)dev->capacity);
> -	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> +	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", DMZ_META_VER);
> +	dmz_print_dev(zmd, 0);
> +
> +	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
>  		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
> -	dmz_dev_info(dev, "  %u metadata zones",
> +	dmz_zmd_info(zmd, "  %u metadata zones",
>  		     zmd->nr_meta_zones * 2);
> -	dmz_dev_info(dev, "  %u data zones for %u chunks",
> +	dmz_zmd_info(zmd, "  %u data zones for %u chunks",
>  		     zmd->nr_data_zones, zmd->nr_chunks);
> -	dmz_dev_info(dev, "    %u random zones (%u unmapped)",
> +	dmz_zmd_info(zmd, "    %u random zones (%u unmapped)",
>  		     zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
> -	dmz_dev_info(dev, "    %u sequential zones (%u unmapped)",
> +	dmz_zmd_info(zmd, "    %u sequential zones (%u unmapped)",
>  		     zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
> -	dmz_dev_info(dev, "  %u reserved sequential data zones",
> +	dmz_zmd_info(zmd, "  %u reserved sequential data zones",
>  		     zmd->nr_reserved_seq);
> -
> -	dmz_dev_debug(dev, "Format:");
> -	dmz_dev_debug(dev, "%u metadata blocks per set (%u max cache)",
> +	dmz_zmd_debug(zmd, "Format:");
> +	dmz_zmd_debug(zmd, "%u metadata blocks per set (%u max cache)",
>  		      zmd->nr_meta_blocks, zmd->max_nr_mblks);
> -	dmz_dev_debug(dev, "  %u data zone mapping blocks",
> +	dmz_zmd_debug(zmd, "  %u data zone mapping blocks",
>  		      zmd->nr_map_blocks);
> -	dmz_dev_debug(dev, "  %u bitmap blocks",
> +	dmz_zmd_debug(zmd, "  %u bitmap blocks",
>  		      zmd->nr_bitmap_blocks);
>  
>  	*metadata = zmd;
> @@ -2591,7 +2612,6 @@ void dmz_dtr_metadata(struct dmz_metadata *zmd)
>   */
>  int dmz_resume_metadata(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
>  	struct dm_zone *zone;
>  	sector_t wp_block;
>  	unsigned int i;
> @@ -2601,20 +2621,19 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
>  	for (i = 0; i < zmd->nr_zones; i++) {
>  		zone = dmz_get(zmd, i);
>  		if (!zone) {
> -			dmz_dev_err(dev, "Unable to get zone %u", i);
> +			dmz_zmd_err(zmd, "Unable to get zone %u", i);
>  			return -EIO;
>  		}
> -
>  		wp_block = zone->wp_block;
>  
>  		ret = dmz_update_zone(zmd, zone);
>  		if (ret) {
> -			dmz_dev_err(dev, "Broken zone %u", i);
> +			dmz_zmd_err(zmd, "Broken zone %u", i);
>  			return ret;
>  		}
>  
>  		if (dmz_is_offline(zone)) {
> -			dmz_dev_warn(dev, "Zone %u is offline", i);
> +			dmz_zmd_warn(zmd, "Zone %u is offline", i);
>  			continue;
>  		}
>  
> @@ -2622,7 +2641,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
>  		if (!dmz_is_seq(zone))
>  			zone->wp_block = 0;
>  		else if (zone->wp_block != wp_block) {
> -			dmz_dev_err(dev, "Zone %u: Invalid wp (%llu / %llu)",
> +			dmz_zmd_err(zmd, "Zone %u: Invalid wp (%llu / %llu)",
>  				    i, (u64)zone->wp_block, (u64)wp_block);
>  			zone->wp_block = wp_block;
>  			dmz_invalidate_blocks(zmd, zone, zone->wp_block,
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 8ed6d9f2df25..ccf90608f434 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -519,7 +519,8 @@ static void dmz_flush_work(struct work_struct *work)
>  	/* Flush dirty metadata blocks */
>  	ret = dmz_flush_metadata(dmz->metadata);
>  	if (ret)
> -		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
> +		DMDEBUG("(%s): Metadata flush failed, rc=%d\n",
> +			dmz_metadata_label(dmz->metadata), ret);
>  
>  	/* Process queued flush requests */
>  	while (1) {
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

