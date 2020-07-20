Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 700892259AF
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 10:10:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-Hyhdzt3-NQqxq05uwaJcgQ-1; Mon, 20 Jul 2020 04:10:29 -0400
X-MC-Unique: Hyhdzt3-NQqxq05uwaJcgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8338107ACCA;
	Mon, 20 Jul 2020 08:10:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D699879501;
	Mon, 20 Jul 2020 08:10:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 848629A12B;
	Mon, 20 Jul 2020 08:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K8A0SK012618 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 04:10:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C75511004C75; Mon, 20 Jul 2020 08:10:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B0F1004C60
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:09:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B71178007A4
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:09:58 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-wQ_ZmIABNX-zrdzXid3O_Q-1; Mon, 20 Jul 2020 04:09:56 -0400
X-MC-Unique: wQ_ZmIABNX-zrdzXid3O_Q-1
IronPort-SDR: ye/+FbEi7lgpi2fe1X65Oy/gA8iMgEi27TtChDOnm6C9raCyWN+EoEsh4ktJSOK+6gHQ0rPLIw
	93AY5fMUaPSNFuN+xcGqIGE+xHwXRnf1lSU1CPKI0S8uIQ/amau4Z6y9CYMkxUqCtUyBCIbDh4
	dMb/scIR3gzuecpnd53yLRsmZY03inwQsdv0pmI8oTkFx0R6HKT4dITl4bFdMIU6+wDKM+frf/
	ijsZhHPd44sF+nHi4Pjd4i5bQwL3ny4edZZu8bar4SWI9oi8/b38FTHHUYubTW9N4BS4VEFm7B
	wb4=
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="142898114"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 16:09:54 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY1PR04MB2220.namprd04.prod.outlook.com (2a01:111:e400:c60e::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23;
	Mon, 20 Jul 2020 08:09:53 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025;
	Mon, 20 Jul 2020 08:09:53 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: [PATCH 1/3] block: inherit the zoned characteristics in
	blk_stack_limits
Thread-Index: AQHWXlzT/5z8bylnBUWWeTTqHXLFAg==
Date: Mon, 20 Jul 2020 08:09:53 +0000
Message-ID: <CY4PR04MB37515CAD1C2FBE1F85574CAAE77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200720061251.652457-1-hch@lst.de>
	<20200720061251.652457-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08963483-03ac-4365-69eb-08d82c844853
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB222053FAEE7AF2207BA538F6E77B0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z2W0Ogqe2SvztDFgmkyS5b0VOXZdcuD1GqpFvTmzSniTUgh6UF8Xhoq3qjxx39Xr78Y+pOeQaCyTUIdqr8MiwPeIombSJ87Hai1rwnqeLdNWIc2qaxa2IFZXOML/Ozk/FyB1lpmKRtbXVdx8pVExIGmnzD7Hy3hkCT/Ay6MqSORuJluPqWFONPYOT7hkOWEwfutE33aFW58LXRp807es/x/Zjo0/hOc7HLqgbxwkwa/TlvWKVNF2TlE0Tps2D3BTBntIvPd5U2nYcu9Mh6/kmjVAcjftmKv/GL5dAfEafOPWpAV87DhZhaoPqFcFHoqxXtoI8wbL7vcBYdMc6iPkmA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(83380400001)(8676002)(7696005)(71200400001)(66946007)(316002)(55016002)(66476007)(2906002)(8936002)(478600001)(53546011)(6506007)(186003)(33656002)(86362001)(5660300002)(110136005)(52536014)(66446008)(64756008)(66556008)(4326008)(26005)(9686003)(76116006)(91956017)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: SpyzHKoaKQKUt0ntFjbpjzovdlo57EsrN8iT9i9H0wiPe8fNkxPbSK2NQDsnT5pJics0+YkWki/KK3of/uFUe7jYo3Nbf18b2lv31gZNPQL6BO6KiU8+X81G8qDWhgRW9Keui5feKz1YTy5RPJGSMZT+3/82Gm2iGgoOhKwk0Oa2LaZxtuHBdjwWD95VVG/wIHN/Ae7mAtlk3nabvNrUERSar2YwlFnoyJJqE54q2LCV37mJymsl6hQ0aLMC+qzH24QxYlchrCgOcNZNSzBCLM6CP6CjFjpcFsTbQMKWcS1wRJWZXpU229E9gph1ppwP3L9c7IJ+aEUDyVJgXNCCm5RB5RF/53s29OVlJfvcQ0x6AhOJUDg6ojHE/XzDf1wOOcd4irIQSYzU0nrKj9zRjG08ARSowr+/NrD9rYzTSALicbiQ6XYI6Pw2vlrEbMPKKBd/Y40V0w8jTvfyvT7dHjI2VZSbRV2mFX9qwi9dzdjSRlO0ZtiowAXQqVtX2Imv
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08963483-03ac-4365-69eb-08d82c844853
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 08:09:53.3256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5VNG9wH6scBqFLWV8bCxf9/xoaqEUKNnqsYPf1ao9gEFuLmN1CrTdgiSLKspDhSA0vzIEQD8YxwFzYGaIU5Hvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K8A0SK012618
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: inherit the zoned characteristics
 in blk_stack_limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/20 15:13, Christoph Hellwig wrote:
> Lift the code from device mapper into blk_stack_limits to inherity
> the stacking limitations.  This ensures we do the right thing for
> all stacked zoned block devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c   |  1 +
>  drivers/md/dm-table.c  | 19 -------------------
>  include/linux/blkdev.h |  9 ++++++---
>  3 files changed, 7 insertions(+), 22 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 9a2c23cd970073..9cddbd73647405 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -609,6 +609,7 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  		t->chunk_sectors = min_not_zero(t->chunk_sectors,
>  						b->chunk_sectors);
>  
> +	t->zoned = max(t->zoned, b->zoned);
>  	return ret;
>  }
>  EXPORT_SYMBOL(blk_stack_limits);
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 0ea5b7367179ff..ec5364133cef7f 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -467,9 +467,6 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
>  		       q->limits.logical_block_size,
>  		       q->limits.alignment_offset,
>  		       (unsigned long long) start << SECTOR_SHIFT);
> -
> -	limits->zoned = blk_queue_zoned_model(q);
> -
>  	return 0;
>  }
>  
> @@ -1528,22 +1525,6 @@ int dm_calculate_queue_limits(struct dm_table *table,
>  			       dm_device_name(table->md),
>  			       (unsigned long long) ti->begin,
>  			       (unsigned long long) ti->len);
> -
> -		/*
> -		 * FIXME: this should likely be moved to blk_stack_limits(), would
> -		 * also eliminate limits->zoned stacking hack in dm_set_device_limits()
> -		 */
> -		if (limits->zoned == BLK_ZONED_NONE && ti_limits.zoned != BLK_ZONED_NONE) {
> -			/*
> -			 * By default, the stacked limits zoned model is set to
> -			 * BLK_ZONED_NONE in blk_set_stacking_limits(). Update
> -			 * this model using the first target model reported
> -			 * that is not BLK_ZONED_NONE. This will be either the
> -			 * first target device zoned model or the model reported
> -			 * by the target .io_hints.
> -			 */
> -			limits->zoned = ti_limits.zoned;
> -		}
>  	}
>  
>  	/*
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 06995b96e94679..67b9ccc1da3560 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -306,11 +306,14 @@ enum blk_queue_state {
>  
>  /*
>   * Zoned block device models (zoned limit).
> + *
> + * Note: This needs to be ordered from the least to the most severe
> + * restrictions for the inheritance in blk_stack_limits() to work.
>   */
>  enum blk_zoned_model {
> -	BLK_ZONED_NONE,	/* Regular block device */
> -	BLK_ZONED_HA,	/* Host-aware zoned block device */
> -	BLK_ZONED_HM,	/* Host-managed zoned block device */
> +	BLK_ZONED_NONE = 0,	/* Regular block device */
> +	BLK_ZONED_HA,		/* Host-aware zoned block device */
> +	BLK_ZONED_HM,		/* Host-managed zoned block device */
>  };
>  
>  struct queue_limits {
> 

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

