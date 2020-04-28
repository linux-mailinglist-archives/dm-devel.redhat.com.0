Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 60CE41BBA13
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 11:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588066855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WQaaXjk+i4sbJLSggje6GRgBNCeLm+ASXhz3TKdChpg=;
	b=Dst6eidNBQnKen32zzJr/A8Q1fBwBMrxnJbDzM4XxoJ4PAAPyEflWvAV02MRJExDl+1blQ
	w6DcfzK4dDKb+L2tUnPZyuQRoqg4ZmnOSn0Bd1cptSR1jQmUb+OAhPJFobyJNlqdi59NGO
	OON1Dcvnw5NFGs4BEfsDiom4usvSZGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-h2aj_Ia2OAWg9Jdci3GGBg-1; Tue, 28 Apr 2020 05:40:53 -0400
X-MC-Unique: h2aj_Ia2OAWg9Jdci3GGBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD21446B;
	Tue, 28 Apr 2020 09:40:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DA2550F5F;
	Tue, 28 Apr 2020 09:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E1E24CAA0;
	Tue, 28 Apr 2020 09:40:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S9edV7023170 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 05:40:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 901E51007BA9; Tue, 28 Apr 2020 09:40:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A03911422DE
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:40:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B37F85A59F
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:40:36 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363-nb7PmbXTOLucrppggxplZA-1; Tue, 28 Apr 2020 05:40:33 -0400
X-MC-Unique: nb7PmbXTOLucrppggxplZA-1
IronPort-SDR: KLBzogvNLXZM21yEvuzkIlQeu8bPWkr7IrW1lZ04msAaSzUjfekthFVMbcb6rsbuIeDUj5sB2R
	UW/4necxtzQQIXVGVItuMFJy2NY9j3RGOXZZhGNsj9vjKSimGnsga/KTi7EmnsE25S60aJPPUg
	jzO97US0XyWm1LFpDjjqHcgf9kJB16NfPp/uGjPiFA3lX98LdQYFCCzez7gZDodR2U50OFaYzk
	q4bv6SqkZGQB6irBOdvinb25ibwn1vNn2POZiA1b3IkKGSy8l5NM1tqCJhNHrSVOlW+6TDJlMq
	fPA=
X-IronPort-AV: E=Sophos;i="5.73,327,1583164800"; d="scan'208";a="136335620"
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
	by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2020 17:40:32 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6373.namprd04.prod.outlook.com (2603:10b6:a03:1e7::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22;
	Tue, 28 Apr 2020 09:40:30 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%8]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 09:40:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 08/13] dm-zoned: remove 'dev' argument from reclaim
Thread-Index: AQHWFvu4Emtjj6zFeU6KFnmnDe9gWg==
Date: Tue, 28 Apr 2020 09:40:30 +0000
Message-ID: <BY5PR04MB6900D58FD6A5CBDFB92ECE22E7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-9-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ac1938a-f106-425d-7ac9-08d7eb5830fa
x-ms-traffictypediagnostic: BY5PR04MB6373:
x-microsoft-antispam-prvs: <BY5PR04MB6373B23CD530489EB96A0ADEE7AC0@BY5PR04MB6373.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:152;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(26005)(8936002)(8676002)(54906003)(6506007)(110136005)(316002)(33656002)(7696005)(53546011)(71200400001)(86362001)(81156014)(186003)(5660300002)(2906002)(478600001)(4326008)(52536014)(55016002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u6xxO/1YlAM1BsiyBTzOtoXt+2//elzWpuDlXXOEn4eE2rpwaGsNYZX45QYvC3Lh/SEFgBXSjbnsxHpJjwgVxKTRDlj9oQc1GHEcqdS0X7jkvJxlw2D842AO+aGjjzHf32zrczGdLtWQpVQY5JGO6i+Wyu4pyiaMKL9PceE5JBkK/Xu6bsE5gBGUzbtsu+LMccbfADz4mHjbI/ePfvpleGSigGsNYR8XFhrNGiU3Xm608+B+5uk64kDCp7dL8G6i3AaY1CYs2URuFI+/5ij6SHOop36O+4rXZ/HQP3Jdi2ZCcgSvLqYdCnBHMwdw8qm9T5v8pnMgt3JtIXFICaJcGtlWlLTmnROroRlQypTwhO/nS7GzBn37fAm4DWmoqEOg/aEF2WN0pZUGO/3YNRPG6vosj+xer/eHR6VAbSoHDDP38eHkfwbtTQTI5mQ9bbDD
x-ms-exchange-antispam-messagedata: 4Hs3Gacmqa3Hnhtq4P+53bavnZQ8v5dlptMMPsTgbtqyxqqYORr6cb/b8+sAMOTPlTgrEp8/gARRc2TptKlK2c0IxKPCLL6S7NSsptsV3UcvaYNFs1Rdp19OVKAWsnUdafEF29ME53SBMyHhJEDB8mARF05Yc2vzOFQNjcBCo5nyF771QvXXl4YT9aX/mshTout3vk1Nl9M6SXwABTX7wNdwBNd5tPjX70j/KXjLGvA1SyLXrPDfQiwdLO1sZsafYtGXRJT1R//vFvgERTtqp5f+pSqsD4A9MPpPuSaKA+QoOayS51t8QFHxTyKZVSFzpaWPKrcbdNOzAn8KHSAb0VmGfG9qelQIs6aJ47XKG6eWYCjcs4oY1+vdaZeB4KnGHKI4aKnAq6/CQQuDlyB6JmgvvaJDLm3m4gBJLeEwajaym1HPU8N8KncgxLXqFmd3pTsouN4UFSayN99lSfL77id/qZ1D0UVM+TuYro6jkznT8WdC1E47KH8bDj07FNm+tpAFES3sIbVz7tymJPfbAumNR3lHjxMYJDzmXAHZ0HGvtWyG3cSioB0SHvJoqLXZ7yXKBLBBjV+vPS+BcHhqo6ILEpvW+iFXDj6zvXT7Ip0XOWZbzNrBgxWMKlDzGTffo9C34DtNmyDrvcuQjoVf3c2PDI0O1Ig/YBDw0RprOabT5el05NJHi6pDU+w+YmUJx0hBNln+/zh0sdFo4+3Sa9R8cKMuBOgOoxpClNMjEnyzsxzybQXZq9R9uDd658M/GDdbjp7FjdSuC5VldWTf/RqFXu3JqM2byPoGOUYW7aQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac1938a-f106-425d-7ac9-08d7eb5830fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 09:40:30.5315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEHAefr6N0wtQVNOEW+8d54N5c9Cjee3Vc6dNIN7O3FhonqovatRuImdAIhcbtPXnY9/EgJNuYID2MPfsUfx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6373
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S9edV7023170
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/13] dm-zoned: remove 'dev' argument from
	reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/20 19:09, Hannes Reinecke wrote:
> Use the dmz_zone_to_dev() mapping function to remove the
> 'dev' argument from reclaim.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-reclaim.c | 58 +++++++++++++++++++++++--------------------
>  drivers/md/dm-zoned-target.c  |  2 +-
>  drivers/md/dm-zoned.h         |  3 ++-
>  3 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 5daede0daf92..39ea0d5d4706 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -13,7 +13,6 @@
>  
>  struct dmz_reclaim {
>  	struct dmz_metadata     *metadata;
> -	struct dmz_dev		*dev;
>  
>  	struct delayed_work	work;
>  	struct workqueue_struct *wq;
> @@ -59,6 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  				sector_t block)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	sector_t wp_block = zone->wp_block;
>  	unsigned int nr_blocks;
>  	int ret;
> @@ -74,15 +74,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  	 * pointer and the requested position.
>  	 */
>  	nr_blocks = block - wp_block;
> -	ret = blkdev_issue_zeroout(zrc->dev->bdev,
> +	ret = blkdev_issue_zeroout(dev->bdev,
>  				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
>  				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
>  	if (ret) {
> -		dmz_dev_err(zrc->dev,
> +		dmz_dev_err(dev,
>  			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
>  			    zone->id, (unsigned long long)wp_block,
>  			    (unsigned long long)block, nr_blocks, ret);
> -		dmz_check_bdev(zrc->dev);
> +		dmz_check_bdev(dev);
>  		return ret;
>  	}
>  
> @@ -116,7 +116,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	struct dmz_dev *dev = zrc->dev;
> +	struct dmz_dev *src_dev, *dst_dev;
>  	struct dm_io_region src, dst;
>  	sector_t block = 0, end_block;
>  	sector_t nr_blocks;
> @@ -130,13 +130,17 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  	else
>  		end_block = dmz_zone_nr_blocks(zmd);
>  	src_zone_block = dmz_start_block(zmd, src_zone);
> +	src_dev = dmz_zone_to_dev(zmd, src_zone);
>  	dst_zone_block = dmz_start_block(zmd, dst_zone);
> +	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
>  
>  	if (dmz_is_seq(dst_zone))
>  		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>  
>  	while (block < end_block) {
> -		if (dev->flags & DMZ_BDEV_DYING)
> +		if (src_dev->flags & DMZ_BDEV_DYING)
> +			return -EIO;
> +		if (dst_dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
>  
>  		/* Get a valid region from the source zone */
> @@ -156,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  				return ret;
>  		}
>  
> -		src.bdev = dev->bdev;
> +		src.bdev = src_dev->bdev;
>  		src.sector = dmz_blk2sect(src_zone_block + block);
>  		src.count = dmz_blk2sect(nr_blocks);
>  
> -		dst.bdev = dev->bdev;
> +		dst.bdev = dst_dev->bdev;
>  		dst.sector = dmz_blk2sect(dst_zone_block + block);
>  		dst.count = src.count;
>  
> @@ -194,10 +198,10 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> -		      dzone->chunk, bzone->id, dmz_weight(bzone),
> -		      dzone->id, dmz_weight(dzone));
> +	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> +		dmz_metadata_label(zmd),
> +		dzone->chunk, bzone->id, dmz_weight(bzone),
> +		dzone->id, dmz_weight(dzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, bzone, dzone);
> @@ -233,10 +237,10 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret = 0;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> -		      chunk, dzone->id, dmz_weight(dzone),
> -		      bzone->id, dmz_weight(bzone));
> +	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> +		dmz_metadata_label(zmd),
> +		chunk, dzone->id, dmz_weight(dzone),
> +		bzone->id, dmz_weight(bzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, bzone);
> @@ -285,9 +289,9 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	if (!szone)
>  		return -ENOSPC;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> -		      chunk, dzone->id, dmz_weight(dzone), szone->id);
> +	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> +		dmz_metadata_label(zmd),
> +		chunk, dzone->id, dmz_weight(dzone), szone->id);
>  
>  	/* Flush the random data zone into the sequential zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, szone);
> @@ -343,6 +347,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	struct dm_zone *dzone;
>  	struct dm_zone *rzone;
> +	struct dmz_dev *dev;
>  	unsigned long start;
>  	int ret;
>  
> @@ -352,7 +357,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  		return PTR_ERR(dzone);
>  
>  	start = jiffies;
> -
> +	dev = dmz_zone_to_dev(zmd, dzone);
>  	if (dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
> @@ -400,14 +405,14 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	ret = dmz_flush_metadata(zrc->metadata);
>  	if (ret) {
> -		dmz_dev_debug(zrc->dev,
> -			      "Metadata flush for zone %u failed, err %d\n",
> -			      rzone->id, ret);
> +		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
> +			dmz_metadata_label(zmd), rzone->id, ret);
>  		return ret;
>  	}
>  
> -	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
> -		      rzone->id, jiffies_to_msecs(jiffies - start));
> +	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
> +		dmz_metadata_label(zmd),
> +		rzone->id, jiffies_to_msecs(jiffies - start));
>  	return 0;
>  }
>  
> @@ -500,7 +505,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  /*
>   * Initialize reclaim.
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **reclaim)
>  {
>  	struct dmz_reclaim *zrc;
> @@ -510,7 +515,6 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
>  	if (!zrc)
>  		return -ENOMEM;
>  
> -	zrc->dev = dev;
>  	zrc->metadata = zmd;
>  	zrc->atime = jiffies;
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 15f00535060f..a1f42af2877c 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -840,7 +840,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
>  	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
> +	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
>  	if (ret) {
>  		ti->error = "Zone reclaim initialization failed";
>  		goto err_fwq;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index e0883df8a903..454ebd628cca 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -180,6 +180,7 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd);
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
> +struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  bool dmz_check_dev(struct dmz_metadata *zmd);
>  bool dmz_dev_is_dying(struct dmz_metadata *zmd);
> @@ -254,7 +255,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  /*
>   * Functions defined in dm-zoned-reclaim.c
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **zrc);

Nit: this should fit on a single line, no ?

>  void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
>  void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

