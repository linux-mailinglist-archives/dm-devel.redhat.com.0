Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD1D2259BC
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 10:12:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-V2lCozSCNoqacon8cTwtCA-1; Mon, 20 Jul 2020 04:12:13 -0400
X-MC-Unique: V2lCozSCNoqacon8cTwtCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E5F28015F7;
	Mon, 20 Jul 2020 08:12:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 463BD10021B3;
	Mon, 20 Jul 2020 08:12:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 040869A12B;
	Mon, 20 Jul 2020 08:12:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K8C35i012760 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 04:12:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B87CD2026D69; Mon, 20 Jul 2020 08:12:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B342B2026D67
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 000221012444
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:11:58 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-276-Z7mYCI0YNr-1V8zE2sdkGg-1; Mon, 20 Jul 2020 04:11:55 -0400
X-MC-Unique: Z7mYCI0YNr-1V8zE2sdkGg-1
IronPort-SDR: 4SW1Mn9CGPxIRwPq4jToTj1pz4+M4+OvAa2XxV5nsO+yEvYLR30lQ0iN0aHWPfZ+qzfyQpUMGc
	OQ4sGBJtM4UuvKOghmcsawhBncm37zNaaVE6+YL8mtmhjO7Pr4KI1OUMEfKLAWqV7VqUgx9/Aq
	dQCLknARcIkjRlsTL2QoUXWOAagL8yVmmuWh7oiwzJRI9QUt8yYAyPPHeH2BEkBZXv+TO76Bw1
	nBwukOVKbPxllfJ1Aw2jkfPgt6mc2xvbV2SLQn3WdjYuGyges6754RcOdfCZPVxh3w5o2Ex1Jf
	9G0=
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="252169118"
Received: from mail-bl2nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.52])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 16:11:54 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY1PR04MB2220.namprd04.prod.outlook.com (2a01:111:e400:c60e::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23;
	Mon, 20 Jul 2020 08:11:53 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025;
	Mon, 20 Jul 2020 08:11:53 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: [PATCH 3/3] block: remove blk_queue_stack_limits
Thread-Index: AQHWXlzVh7oGnzbSMEeGw8J4Z4JGYg==
Date: Mon, 20 Jul 2020 08:11:53 +0000
Message-ID: <CY4PR04MB37519991BBC1A1341F3CBFA6E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200720061251.652457-1-hch@lst.de>
	<20200720061251.652457-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 47495b88-b2aa-4873-44ee-08d82c848fbb
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB2220E56A3397BBC7AEC3F43BE77B0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pN3tNSp2o96/RaAs3mzVFoz1eXRn6jJpR0H5B5xLcJLxbNlE680CXE24ny5oOf8xVkcCQHrHeNydErvb7fnH/y0YA1CixF0sjZIlB7cAg0LbGe6ABw0MosX7xS2gU3ZnPGlXFX4F6CI3tE6OpsbTpC5IxdoId5Z+7fcqpUG0JEZM0bfWTmFBbTTt63BvcVPnXqs/BlMF4QF8z6g9pw1X2u0fag3q38WPwGNuJnxDDnGbKuoLZTRuLsHqraXNCoMnGk/9cEFhmnzuc4nJIYovuGpONqqV/5S0nfbZo/ubm/dmP5Q8dHASllJbPchf1MC8gwxGOJMWO1takzLjMMwlRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(83380400001)(8676002)(7696005)(71200400001)(66946007)(316002)(55016002)(66476007)(2906002)(8936002)(478600001)(53546011)(6506007)(186003)(33656002)(86362001)(5660300002)(110136005)(52536014)(66446008)(64756008)(66556008)(4326008)(26005)(9686003)(76116006)(91956017)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: H+usXrfvklC4It3GgDcByq9VR0zdO2/byjC1S260C8D6TQexS9Gw0gauF/LLd96dlLANwI1gOxsoBayKIpTg3bhlwGFxkct/I4EcXc6WSllEfDqHHtkzue+nAk0kf4Vv1OHHmS6xi0TA5gyiK6rMbEIfUwTpuJlBQmaNOq3AzkYjuVWlHmrqSDRwtIRXfdNIqLgVGSVpkJzUgflDiVLIHNJJJsBRrwR4cnrbub1SvslepNYkxOxfRnqWJAwZWIGBzVHDusPT1wwBypWUZzRZcWGreuIDFeD6x1K4CDj06v1EUgZCLV2G3yRnWxsmWeP2l0htGMAemcrhvr5vaW5d+jR8Jka4fy//6t7RsBmwiFyQ22+0+PL1gMycJ2dvSfQYMpQSUDbcXVLyiaJZY2Y123SRig1twEiXd+GYvrFEn2TreC6nIPdzFsQYclNG0jaJMWqCLXVXyfb85mZ0+UkDnUmldHn9UgjsNfjxk0lEQMW7c4v0fplcC/GLWP8F0tih
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47495b88-b2aa-4873-44ee-08d82c848fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 08:11:53.0325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdGGmHrVwKrbgbYcE8Ahdm3+0J1JFLTh2R1pJJBXWpnDjP1ooiUMdnRuZud7soaoZIqVMtcA/Iv61VGSH4fkRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K8C35i012760
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/3] block: remove blk_queue_stack_limits
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/20 15:13, Christoph Hellwig wrote:
> This function is just a tiny wrapper around blk_stack_limits.  Open code
> it int the two callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c         | 11 -----------
>  drivers/block/drbd/drbd_nl.c |  4 ++--
>  drivers/nvme/host/core.c     |  3 ++-
>  include/linux/blkdev.h       |  1 -
>  4 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 8c63af7726850c..76a7e03bcd6cac 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -455,17 +455,6 @@ void blk_queue_io_opt(struct request_queue *q, unsigned int opt)
>  }
>  EXPORT_SYMBOL(blk_queue_io_opt);
>  
> -/**
> - * blk_queue_stack_limits - inherit underlying queue limits for stacked drivers
> - * @t:	the stacking driver (top)
> - * @b:  the underlying device (bottom)
> - **/
> -void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b)
> -{
> -	blk_stack_limits(&t->limits, &b->limits, 0);
> -}
> -EXPORT_SYMBOL(blk_queue_stack_limits);
> -
>  /**
>   * blk_stack_limits - adjust queue_limits for stacked devices
>   * @t:	the stacking driver limits (top device)
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index da4a3ebe04efa5..d0d9a549b58388 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1250,7 +1250,7 @@ static void fixup_discard_if_not_supported(struct request_queue *q)
>  
>  static void fixup_write_zeroes(struct drbd_device *device, struct request_queue *q)
>  {
> -	/* Fixup max_write_zeroes_sectors after blk_queue_stack_limits():
> +	/* Fixup max_write_zeroes_sectors after blk_stack_limits():
>  	 * if we can handle "zeroes" efficiently on the protocol,
>  	 * we want to do that, even if our backend does not announce
>  	 * max_write_zeroes_sectors itself. */
> @@ -1361,7 +1361,7 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
>  	decide_on_write_same_support(device, q, b, o, disable_write_same);
>  
>  	if (b) {
> -		blk_queue_stack_limits(q, b);
> +		blk_stack_limits(&q->limits, &b->limits, 0);
>  
>  		if (q->backing_dev_info->ra_pages !=
>  		    b->backing_dev_info->ra_pages) {
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 5192a024dc1b9c..45c4c408649080 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -1973,7 +1973,8 @@ static int __nvme_revalidate_disk(struct gendisk *disk, struct nvme_id_ns *id)
>  #ifdef CONFIG_NVME_MULTIPATH
>  	if (ns->head->disk) {
>  		nvme_update_disk_info(ns->head->disk, ns, id);
> -		blk_queue_stack_limits(ns->head->disk->queue, ns->queue);
> +		blk_stack_limits(&ns->head->disk->queue->limits,
> +				 &ns->queue->limits, 0);
>  		revalidate_disk(ns->head->disk);
>  	}
>  #endif
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 247b0e0a2901f0..484cd3c8447452 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1108,7 +1108,6 @@ extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  			    sector_t offset);
>  extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  			      sector_t offset);
> -extern void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b);
>  extern void blk_queue_update_dma_pad(struct request_queue *, unsigned int);
>  extern void blk_queue_segment_boundary(struct request_queue *, unsigned long);
>  extern void blk_queue_virt_boundary(struct request_queue *, unsigned long);
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

