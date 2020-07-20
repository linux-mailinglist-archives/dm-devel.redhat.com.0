Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D71E82259BA
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 10:11:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-01yYgZhFMq-REoqRsCgMIA-1; Mon, 20 Jul 2020 04:11:41 -0400
X-MC-Unique: 01yYgZhFMq-REoqRsCgMIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05EA100AA23;
	Mon, 20 Jul 2020 08:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BA5F710A4;
	Mon, 20 Jul 2020 08:11:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C91791809554;
	Mon, 20 Jul 2020 08:11:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K8BVX0012709 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 04:11:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58F512026D69; Mon, 20 Jul 2020 08:11:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2B62026D5D
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:11:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C12858EE4
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 08:11:28 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-445-YXFqq9boNMe8Thqihnq8AQ-1; Mon, 20 Jul 2020 04:11:25 -0400
X-MC-Unique: YXFqq9boNMe8Thqihnq8AQ-1
IronPort-SDR: S34q55maSgTn6B/WZMVfyGIqCrH2DC7bT+RVlrRJwTkj1IbM1VTcVcqgknjy+IvtotVsMJtmY6
	tZtAnJ4VEWIfpFpERW/YXYnRIS9iI2mfh4iNzQYwUD+1LL+VsTONX7y0pMo/IEIWTlA23++yqv
	lNUpVvfw8FjW7uz077wBSjEb0GPNxnlPxSUa/oES4NKzn8UKHfKc2TOhFHGKmwqwbDhN88lbew
	Hd8qYGR4LC3Yx6Lh1m0UK5MXK0AeSW2BFvqwDmSwBd9/nW7yKZZzjNoeIHVWkmjIujGVbeeuTu
	5Y8=
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="252169072"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jul 2020 16:11:24 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY1PR04MB2220.namprd04.prod.outlook.com (2a01:111:e400:c60e::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23;
	Mon, 20 Jul 2020 08:11:23 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0]) by
	CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::d9e5:135e:cfd9:4de0%7]) with mapi id 15.20.3195.025;
	Mon, 20 Jul 2020 08:11:23 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>
Thread-Topic: [PATCH 2/3] block: remove bdev_stack_limits
Thread-Index: AQHWXlzTg7R0GrKIAkSqC/1NtcRXyQ==
Date: Mon, 20 Jul 2020 08:11:23 +0000
Message-ID: <CY4PR04MB3751CDE47A50C4F06D4C97F9E77B0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200720061251.652457-1-hch@lst.de>
	<20200720061251.652457-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c512c907-4ff0-4fd7-d266-08d82c847de3
x-ms-traffictypediagnostic: CY1PR04MB2220:
x-microsoft-antispam-prvs: <CY1PR04MB2220AFF26A5AED40C3E0574AE77B0@CY1PR04MB2220.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:172;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: duaJhkUFj1GSZPJhP44F0kfpKgLGQbAEqeQE9+SmOgfMLD8o2Bqkd6J8lZnZVpV53L1ORh9zrvPv89yMh68OI4CUvnnIsrXRax+gsYWQgJ0ZMTDQob5Z6HT7WML72D6F8eGdXjvIcF1G1fzYHrmQ9iCIxDji+D6JRKFpx7bHCl5O1BJrpfLSWQ6hF14TRGBERw33hJQLKASNvXHDy3mi0+0dl3JaJqgRsDJi1BwEYMOvTXscvVIxCoKSaWQ6XisazdamJoZOKAxo/I2PxRG5YA80an7xJlQIy07njKxFpKpMnJsfPZFeXtrUKzJ9oecWTvkGeEzJ2nnu68U8omgCUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(83380400001)(8676002)(7696005)(71200400001)(66946007)(316002)(55016002)(66476007)(2906002)(8936002)(478600001)(53546011)(6506007)(186003)(33656002)(86362001)(5660300002)(110136005)(52536014)(66446008)(64756008)(66556008)(4326008)(26005)(9686003)(76116006)(91956017)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: mtCAzvsctP+s7uiEiFTwa+5OO0O5YueLp/yMyrVREfuFxCn9pAPntaUTvzefIiYnm9POdhsoyvIXmvug/15LtuZmmSedUVuxVxPs133opAPIzdadTnRW2KaHRw8uUtB6UT/eDe0Kwl7tT53Hql/EwUKgddMSsXnzusqJKRzggwPwKhduNys0FkeD7jTnlDclu3Fqs+AK6r2BLbVetbKtVq8q/XBL4VYHHaBlEpw1LPHajaIaKwsXfy7Hm86feBPYtWaMxpHks20HIq/HA6DfV+8v0+6dGhqzXHRyEnJVKnzCxlPuCCr65T7FRviW3G84SI5EZ6QPPfTFrhAkMl7xD8/KFtYVkrrT4fXXLx19CqXfkGziHULC6OHYyAKBbIMnxSC/80/pue/0NrTY2n9hgAlEABcCtt+02ibg47LxcPgum/Cg17owetc9ykI3hjVTNFQv6CwWbQAO0ZSAkUXYJx00J/pGf1hFfvJ4O/lUfvrYBQkPpM9xhn3eQ72AYM6n
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c512c907-4ff0-4fd7-d266-08d82c847de3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2020 08:11:23.1703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4jXMbUCC8hRIQbYv3uy7j5UDlW3DxWazzx7Mgo+HenB4gTgMY5X5RNuNpQ7XJmDvxVELiHuJvRRgXkRYBuektQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2220
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K8BVX0012709
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] block: remove bdev_stack_limits
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/07/20 15:13, Christoph Hellwig wrote:
> This function is just a tiny wrapper around blk_stack_limit and has
> two callers.  Simplify the stack a bit by open coding it in the two
> callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c   | 25 ++-----------------------
>  drivers/md/dm-table.c  |  3 ++-
>  include/linux/blkdev.h |  2 --
>  3 files changed, 4 insertions(+), 26 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 9cddbd73647405..8c63af7726850c 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -614,28 +614,6 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  }
>  EXPORT_SYMBOL(blk_stack_limits);
>  
> -/**
> - * bdev_stack_limits - adjust queue limits for stacked drivers
> - * @t:	the stacking driver limits (top device)
> - * @bdev:  the component block_device (bottom)
> - * @start:  first data sector within component device
> - *
> - * Description:
> - *    Merges queue limits for a top device and a block_device.  Returns
> - *    0 if alignment didn't change.  Returns -1 if adding the bottom
> - *    device caused misalignment.
> - */
> -int bdev_stack_limits(struct queue_limits *t, struct block_device *bdev,
> -		      sector_t start)
> -{
> -	struct request_queue *bq = bdev_get_queue(bdev);
> -
> -	start += get_start_sect(bdev);
> -
> -	return blk_stack_limits(t, &bq->limits, start);
> -}
> -EXPORT_SYMBOL(bdev_stack_limits);
> -
>  /**
>   * disk_stack_limits - adjust queue limits for stacked drivers
>   * @disk:  MD/DM gendisk (top)
> @@ -651,7 +629,8 @@ void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  {
>  	struct request_queue *t = disk->queue;
>  
> -	if (bdev_stack_limits(&t->limits, bdev, offset >> 9) < 0) {
> +	if (blk_stack_limits(&t->limits, &bdev_get_queue(bdev)->limits,
> +			get_start_sect(bdev) + (offset >> 9)) < 0) {
>  		char top[BDEVNAME_SIZE], bottom[BDEVNAME_SIZE];
>  
>  		disk_name(disk, 0, top);
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index ec5364133cef7f..aac4c31cfc8498 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -458,7 +458,8 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
>  		return 0;
>  	}
>  
> -	if (bdev_stack_limits(limits, bdev, start) < 0)
> +	if (blk_stack_limits(limits, &q->limits,
> +			get_start_sect(bdev) + start) < 0)
>  		DMWARN("%s: adding target device %s caused an alignment inconsistency: "
>  		       "physical_block_size=%u, logical_block_size=%u, "
>  		       "alignment_offset=%u, start=%llu",
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 67b9ccc1da3560..247b0e0a2901f0 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1106,8 +1106,6 @@ extern void blk_set_default_limits(struct queue_limits *lim);
>  extern void blk_set_stacking_limits(struct queue_limits *lim);
>  extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  			    sector_t offset);
> -extern int bdev_stack_limits(struct queue_limits *t, struct block_device *bdev,
> -			    sector_t offset);
>  extern void disk_stack_limits(struct gendisk *disk, struct block_device *bdev,
>  			      sector_t offset);
>  extern void blk_queue_stack_limits(struct request_queue *t, struct request_queue *b);
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

