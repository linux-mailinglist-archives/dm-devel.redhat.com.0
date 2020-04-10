Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8691A42B2
	for <lists+dm-devel@lfdr.de>; Fri, 10 Apr 2020 08:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586501587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lUTjr6stg4xvwyvXzcRIh5DLkHPCItXNrzNE9y1aDyE=;
	b=PeU0N7iv6XueeOGNtjWLbHfwixnvQtmh907bcZKpdr/kfpdP1ucMcv1UwW+dHHtb5gepxb
	Og498NehdTF4uTAuK8fV0WeYUDsP9Hwp2j67eEvMrZp59w1lbWrkmcm/BRGQr8q0hRzkae
	p6F0wiF3h+1czoBsfI1rr3fXpEfc5iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153--isMFvOHO9S6b-gNwOoZTA-1; Fri, 10 Apr 2020 02:53:05 -0400
X-MC-Unique: -isMFvOHO9S6b-gNwOoZTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6020518C35A4;
	Fri, 10 Apr 2020 06:52:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36DEBC0DB4;
	Fri, 10 Apr 2020 06:52:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69DBE1809567;
	Fri, 10 Apr 2020 06:52:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A6qlQL029075 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 02:52:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 714442022EB2; Fri, 10 Apr 2020 06:52:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BE5920230A9
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:52:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FF09802D22
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:52:43 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-fH2a0MHgMFqP5LxFl-jV4A-1; Fri, 10 Apr 2020 02:52:38 -0400
X-MC-Unique: fH2a0MHgMFqP5LxFl-jV4A-1
IronPort-SDR: K4Mm7Lkhgo2vXVFzn0t6VG4+WpahKVjdwmOvqIQLOCYcXaGf/FQLJPl0Gx1j26cwbykkdB37co
	9tfgh7/CgOCVmFxDOrgP4AZSlbD4ZPLXl/PzqCCHIMsoxTbnv8MxVFKYFwPbyUkldlvnYfAgY3
	hK/ob9GR+HDAfVzhIJslzSr0nryHHXvUMcBTGogIEJJsWBthVfYgeM3rNGPqMDHt4takwoHd77
	KqnZQNidr66VDUTMB0hYmtkN9xenF7g1WxUpIMYN5HJu3T14rX7AZlq2rSZB18D852fLTcJ/gU
	fJw=
X-IronPort-AV: E=Sophos;i="5.72,364,1580745600"; d="scan'208";a="135346238"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
	by ob1.hgst.iphmx.com with ESMTP; 10 Apr 2020 14:52:36 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6502.namprd04.prod.outlook.com (2603:10b6:a03:1db::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20;
	Fri, 10 Apr 2020 06:52:35 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.2900.015;
	Fri, 10 Apr 2020 06:52:35 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 07/11] dm-zoned: replace 'target' pointer in the bio
	context
Thread-Index: AQHWDjp60JnuA1COAUKvhlCgeJdQ7w==
Date: Fri, 10 Apr 2020 06:52:35 +0000
Message-ID: <BY5PR04MB6900300E586A0BD669A88305E7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-8-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 06f0b231-2f5f-4e55-22e9-08d7dd1bc015
x-ms-traffictypediagnostic: BY5PR04MB6502:
x-microsoft-antispam-prvs: <BY5PR04MB65028B9588F9BE8CE8EE6BE2E7DE0@BY5PR04MB6502.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:40;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(4326008)(55016002)(71200400001)(5660300002)(110136005)(54906003)(86362001)(52536014)(316002)(9686003)(33656002)(66476007)(66556008)(66946007)(7696005)(6506007)(53546011)(2906002)(26005)(8676002)(76116006)(64756008)(66446008)(81156014)(186003)(8936002)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NOZjwlEXv59Bo1Up6f2ik7D1+zsxzcDPV1MMHL7RlF+VGxVwS15YJaR714cmOxRc9b05G3Jg2CWc8k+pzYBfQpIExu67A3EA8QcFPCc6OZ1PPD4Up5tovqPOUla5+/CHrOJMjcPB8b7EvGpBhk5OdufIXJe6uuw9jKjdg4fDlAOCN3mn/s4wcAWyHSJSVnJT5FARr9WN8z7kc/SmRCLr5y/FVF7shVLwtpWo2tfuc6nbugoqQ4gwP87FEGsXkQZfEQK/EWUMVacjm6l6Xavh/jeUxMkGaL6J7vt5RAphYCOxnKbvUfRdJKFwZHYnCfPghtNUuK+DIdhO6oOcaXvkhfxfgdI6qF2CNk3VG8ONZxJbSet0dCfWaZkGjZAiCtHmDkJkSykklAgbO07WieW15ClBv08CrEKfOnQ/Q1wDho2gSRg6nlabGZSObM8+0t0J
x-ms-exchange-antispam-messagedata: jWGBwVjlUcvcBlNMOryllJZSZNRACOSZ9VCL43odgqmKhOazZUjfMXWGbFSFZtAFbE4cZx12cy3e8gd1vX7DOQcO2rgd1i8QId8grMxvjO73zp0J4bTp3aPzq+35j+x1KVAfna5LGQlXiYVBgxe/TQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f0b231-2f5f-4e55-22e9-08d7dd1bc015
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 06:52:35.1256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCXyV/eWsPQpCTyZ3P5Ej4CpPYnghvITkcz74gVrQMCRgcDYxyS/hEx7wQyE+yBnisZ5gxgkKA4gINtHzATnHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6502
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A6qlQL029075
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/11] dm-zoned: replace 'target' pointer in
 the bio context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/09 15:45, Hannes Reinecke wrote:
> Replace the 'target' pointer in the bio context with the
> device pointer as this is what's actually used.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-target.c | 54 +++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index fa297348f0bb..1ee10789f04d 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -17,7 +17,7 @@
>   * Zone BIO context.
>   */
>  struct dmz_bioctx {
> -	struct dmz_target	*target;
> +	struct dmz_dev		*dev;
>  	struct dm_zone		*zone;
>  	struct bio		*bio;
>  	refcount_t		ref;
> @@ -71,6 +71,11 @@ struct dmz_target {
>   */
>  #define DMZ_FLUSH_PERIOD	(10 * HZ)
>  
> +struct dmz_dev *dmz_sect_to_dev(struct dmz_target *dmz, sector_t sect)
> +{
> +	return &dmz->dev[0];
> +}
> +
>  /*
>   * Target BIO completion.
>   */
> @@ -81,7 +86,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
>  	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
>  		bio->bi_status = status;
>  	if (bio->bi_status != BLK_STS_OK)
> -		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
> +		bioctx->dev->flags |= DMZ_CHECK_BDEV;
>  
>  	if (refcount_dec_and_test(&bioctx->ref)) {
>  		struct dm_zone *zone = bioctx->zone;
> @@ -118,14 +123,20 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
>  			  struct bio *bio, sector_t chunk_block,
>  			  unsigned int nr_blocks)
>  {
> -	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
> +	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
> +	struct dmz_bioctx *bioctx =
> +		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	struct bio *clone;
>  
> +	if (dev->flags & DMZ_BDEV_DYING)
> +		return -EIO;
> +
>  	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
>  	if (!clone)
>  		return -ENOMEM;
>  
> -	bio_set_dev(clone, dmz->dev->bdev);
> +	bio_set_dev(clone, dev->bdev);
> +	bioctx->dev = dev;
>  	clone->bi_iter.bi_sector =
>  		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
>  	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
> @@ -218,8 +229,10 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  
>  		if (nr_blocks) {
>  			/* Valid blocks found: read them */
> -			nr_blocks = min_t(unsigned int, nr_blocks, end_block - chunk_block);
> -			ret = dmz_submit_bio(dmz, rzone, bio, chunk_block, nr_blocks);
> +			nr_blocks = min_t(unsigned int, nr_blocks,
> +					  end_block - chunk_block);
> +			ret = dmz_submit_bio(dmz, rzone, bio,
> +					     chunk_block, nr_blocks);
>  			if (ret)
>  				return ret;
>  			chunk_block += nr_blocks;
> @@ -330,14 +343,16 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  		 * and the BIO is aligned to the zone write pointer:
>  		 * direct write the zone.
>  		 */
> -		return dmz_handle_direct_write(dmz, zone, bio, chunk_block, nr_blocks);
> +		return dmz_handle_direct_write(dmz, zone, bio,
> +					       chunk_block, nr_blocks);
>  	}
>  
>  	/*
>  	 * This is an unaligned write in a sequential zone:
>  	 * use buffered write.
>  	 */
> -	return dmz_handle_buffered_write(dmz, zone, bio, chunk_block, nr_blocks);
> +	return dmz_handle_buffered_write(dmz, zone, bio,
> +					 chunk_block, nr_blocks);
>  }
>  
>  /*
> @@ -383,7 +398,6 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  			   struct bio *bio)
>  {
> -	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	struct dm_zone *zone;
>  	int ret;
> @@ -397,11 +411,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	dmz_lock_metadata(zmd);
>  
> -	if (dmz->dev->flags & DMZ_BDEV_DYING) {
> -		ret = -EIO;
> -		goto out;
> -	}

Are you removing this because you added the check to dmz_submit_bio() ?

> -
>  	/*
>  	 * Get the data zone mapping the chunk. There may be no
>  	 * mapping for read and discard. If a mapping is obtained,
> @@ -415,10 +424,8 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  	}
>  
>  	/* Process the BIO */
> -	if (zone) {
> +	if (zone)
>  		dmz_activate_zone(zone);
> -		bioctx->zone = zone;

Why are you removing this ? This is used in dmz_bio_endio()...


> -	}
>  
>  	switch (bio_op(bio)) {
>  	case REQ_OP_READ:
> @@ -625,14 +632,14 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct dmz_metadata *zmd = dmz->metadata;
> -	struct dmz_dev *dev = dmz->dev;
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	sector_t sector = bio->bi_iter.bi_sector;
>  	unsigned int nr_sectors = bio_sectors(bio);
> +	struct dmz_dev *dev = dmz_sect_to_dev(dmz, sector);
>  	sector_t chunk_sector;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(dmz->dev))
> +	if (dmz_bdev_is_dying(dev))
>  		return DM_MAPIO_KILL;
>  
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
> @@ -651,7 +658,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  		return DM_MAPIO_KILL;
>  
>  	/* Initialize the BIO context */
> -	bioctx->target = dmz;
> +	bioctx->dev = NULL;
>  	bioctx->zone = NULL;
>  	bioctx->bio = bio;
>  	refcount_set(&bioctx->ref, 1);
> @@ -673,7 +680,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	/* Now ready to handle this BIO */
>  	ret = dmz_queue_chunk_work(dmz, bio);
>  	if (ret) {
> -		dmz_dev_debug(dmz->dev,
> +		dmz_dev_debug(dev,
>  			      "BIO op %d, can't process chunk %llu, err %i\n",
>  			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
>  			      ret);
> @@ -930,11 +937,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	struct dmz_dev *dev = dmz_sect_to_dev(dmz, 0);
>  
> -	if (!dmz_check_bdev(dmz->dev))
> +	if (!dmz_check_bdev(dev))
>  		return -EIO;
>  
> -	*bdev = dmz->dev->bdev;
> +	*bdev = dev->bdev;
>  
>  	return 0;
>  }
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

