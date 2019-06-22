Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB004F2EE
	for <lists+dm-devel@lfdr.de>; Sat, 22 Jun 2019 02:56:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C56AF3083394;
	Sat, 22 Jun 2019 00:56:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5949460142;
	Sat, 22 Jun 2019 00:56:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 128D8C57E;
	Sat, 22 Jun 2019 00:56:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5M0qSR1017590 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 20:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A28491001B32; Sat, 22 Jun 2019 00:52:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE29C1001B2A;
	Sat, 22 Jun 2019 00:52:23 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFB86308218D;
	Sat, 22 Jun 2019 00:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561164725; x=1592700725;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=UHjDQe+9gYA+Nd1wc0Isz2gOWgXr01ETXW0eAbKiqbY=;
	b=GlNGwCwOd6tR/5D7w6x3ls1UL6AbagD/oVPat57e/yHoXUazzBob9tAs
	Abkoey94Q7CbFLdOwlEsQNhWV6+SUL+tSUXlQ68KHs4z97Sg08mUS/5OP
	p3jAuRsCCsRU042EMkak0lO3SqGRW3HLNtWyp91dcv+hg/wMQU14CczhH
	BIZ5SKTtGoHgPLK7c9kqBZ2w4sCTzqz6POs3BJCWcrQvytiksed41nort
	Wk7FIe4DRF5kZetFO3Q4XyGaSAdN3AN168jzB0Nvyi3okw/JGW/spZVyL
	ovv0kh3tNyrqw5uaduqKtoANHA0hf7bnV+cieXpIBZIknkQKAPLdCGvfC Q==;
X-IronPort-AV: E=Sophos;i="5.63,402,1557158400"; d="scan'208";a="217567450"
Received: from mail-co1nam05lp2059.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.59])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2019 08:51:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/kAh/kDxhhKNEzJhxqpmkx9MyjnqYFWcLhPGNukOAZY=;
	b=W7oI69VVrngKfb9Hck8avaAzO9QQlCv8sE4yXr/9gyggfEtKW3W2PNnFURweSX8TUlAo3X6sCteUdyqbsakqLJBGbY08vhk90wa5DV/yFKeAUwopsOYX2mYPTj2yBbnr23J/0XZh8OB17HdEv29iklTO5rwJituRuCICIfGVAn4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4680.namprd04.prod.outlook.com (52.135.240.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.15; Sat, 22 Jun 2019 00:51:36 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.1987.014;
	Sat, 22 Jun 2019 00:51:36 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni
	<Chaitanya.Kulkarni@wdc.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] block: add zone open, close and finish support
Thread-Index: AQHVKDJPztuCEJ+OF0q7RsgYaqLWMQ==
Date: Sat, 22 Jun 2019 00:51:36 +0000
Message-ID: <BYAPR04MB5816F7C8CA5B915DEEAF22D2E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3f8ecb7-dc39-492b-eaaf-08d6f6abc7b3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB4680; 
x-ms-traffictypediagnostic: BYAPR04MB4680:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB46801FC20DCC462BAC49314FE7E60@BYAPR04MB4680.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:590;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(53546011)(446003)(66476007)(66574012)(91956017)(86362001)(305945005)(74316002)(229853002)(7736002)(71190400001)(66556008)(4326008)(66446008)(486006)(64756008)(66946007)(53936002)(81156014)(55016002)(9686003)(8676002)(66066001)(30864003)(72206003)(2201001)(81166006)(25786009)(71200400001)(6246003)(76116006)(476003)(26005)(99286004)(7696005)(6506007)(68736007)(73956011)(102836004)(110136005)(8936002)(14454004)(6116002)(186003)(5660300002)(52536014)(316002)(2906002)(7416002)(256004)(6436002)(76176011)(478600001)(33656002)(3846002)(2501003)(14444005)(54906003)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4680;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XVJhP6uwYtHgyrgCGJg1hph1CsTSLk/kHM9YQ6IOWCzZ1rjXtlditVF/9tU1ExrxfBNhI6LqbU5QcFG6bGa/GULkyL7Zjb8ZJhaoiezBO6JFspiJn7BkSLrzn4oEnLNr5Ey/iKtpQkiq7ylmzFuJvqwMnPW4Pv+ib7giWmV7vEnekiBKk/lKa6Ht1IQNq2kL8AWXT27i5C7ikzKHppKot4TBEJrWxKyOQJP6S1c+eDPZ5uGBpChh297CAfbl68oXIWvvGFFAGUZFQJu+TsfoxpI0UQcwuHs6fkbbMrzbZzE3JwLtnvwaW+19TimUeuZ69hShS2E5omcZkmIilRSRzUFZ36c/HuC/SQteVg5yKTBx68eZnzD5t0vqkk67s6chjHORNe/rBEGGgdDPC8A3RPJEtOlN7fdCMnlUr4Ph/p4=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f8ecb7-dc39-492b-eaaf-08d6f6abc7b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 00:51:36.8552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4680
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sat, 22 Jun 2019 00:52:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sat, 22 Jun 2019 00:52:06 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com
	68.232.141.245 esa1.hgst.iphmx.com
	<prvs=069675b12=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5M0qSR1017590
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 22 Jun 2019 00:56:22 +0000 (UTC)

Matias,

Some comments inline below.

On 2019/06/21 22:07, Matias Bj=F8rling wrote:
> From: Ajay Joshi <ajay.joshi@wdc.com>
> =

> Zoned block devices allows one to control zone transitions by using
> explicit commands. The available transitions are:
> =

>   * Open zone: Transition a zone to open state.
>   * Close zone: Transition a zone to closed state.
>   * Finish zone: Transition a zone to full state.
> =

> Allow kernel to issue these transitions by introducing
> blkdev_zones_mgmt_op() and add three new request opcodes:
> =

>   * REQ_IO_ZONE_OPEN, REQ_IO_ZONE_CLOSE, and REQ_OP_ZONE_FINISH
> =

> Allow user-space to issue the transitions through the following ioctls:
> =

>   * BLKOPENZONE, BLKCLOSEZONE, and BLKFINISHZONE.
> =

> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Matias Bj=F8rling <matias.bjorling@wdc.com>
> ---
>  block/blk-core.c              |  3 ++
>  block/blk-zoned.c             | 51 ++++++++++++++++++++++---------
>  block/ioctl.c                 |  5 ++-
>  include/linux/blk_types.h     | 27 +++++++++++++++--
>  include/linux/blkdev.h        | 57 ++++++++++++++++++++++++++++++-----
>  include/uapi/linux/blkzoned.h | 17 +++++++++--
>  6 files changed, 133 insertions(+), 27 deletions(-)
> =

> diff --git a/block/blk-core.c b/block/blk-core.c
> index 8340f69670d8..c0f0dbad548d 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -897,6 +897,9 @@ generic_make_request_checks(struct bio *bio)
>  			goto not_supported;
>  		break;
>  	case REQ_OP_ZONE_RESET:
> +	case REQ_OP_ZONE_OPEN:
> +	case REQ_OP_ZONE_CLOSE:
> +	case REQ_OP_ZONE_FINISH:
>  		if (!blk_queue_is_zoned(q))
>  			goto not_supported;
>  		break;
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index ae7e91bd0618..d0c933593b93 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -201,20 +201,22 @@ int blkdev_report_zones(struct block_device *bdev, =
sector_t sector,
>  EXPORT_SYMBOL_GPL(blkdev_report_zones);
>  =

>  /**
> - * blkdev_reset_zones - Reset zones write pointer
> + * blkdev_zones_mgmt_op - Perform the specified operation on the zone(s)
>   * @bdev:	Target block device
> - * @sector:	Start sector of the first zone to reset
> - * @nr_sectors:	Number of sectors, at least the length of one zone
> + * @op:		Operation to be performed on the zone(s)
> + * @sector:	Start sector of the first zone to operate on
> + * @nr_sectors:	Number of sectors, at least the length of one zone and
> + *              must be zone size aligned.
>   * @gfp_mask:	Memory allocation flags (for bio_alloc)
>   *
>   * Description:
> - *    Reset the write pointer of the zones contained in the range
> + *    Perform the specified operation contained in the range
	Perform the specified operation over the sector range
>   *    @sector..@sector+@nr_sectors. Specifying the entire disk sector ra=
nge
>   *    is valid, but the specified range should not contain conventional =
zones.
>   */
> -int blkdev_reset_zones(struct block_device *bdev,
> -		       sector_t sector, sector_t nr_sectors,
> -		       gfp_t gfp_mask)
> +int blkdev_zones_mgmt_op(struct block_device *bdev, enum req_opf op,
> +			 sector_t sector, sector_t nr_sectors,
> +			 gfp_t gfp_mask)
>  {
>  	struct request_queue *q =3D bdev_get_queue(bdev);
>  	sector_t zone_sectors;
> @@ -226,6 +228,9 @@ int blkdev_reset_zones(struct block_device *bdev,
>  	if (!blk_queue_is_zoned(q))
>  		return -EOPNOTSUPP;
>  =

> +	if (!op_is_zone_mgmt_op(op))
> +		return -EOPNOTSUPP;

EINVAL may be better here.

> +
>  	if (bdev_read_only(bdev))
>  		return -EPERM;
>  =

> @@ -248,7 +253,7 @@ int blkdev_reset_zones(struct block_device *bdev,
>  		bio =3D blk_next_bio(bio, 0, gfp_mask);
>  		bio->bi_iter.bi_sector =3D sector;
>  		bio_set_dev(bio, bdev);
> -		bio_set_op_attrs(bio, REQ_OP_ZONE_RESET, 0);
> +		bio_set_op_attrs(bio, op, 0);
>  =

>  		sector +=3D zone_sectors;
>  =

> @@ -264,7 +269,7 @@ int blkdev_reset_zones(struct block_device *bdev,
>  =

>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(blkdev_reset_zones);
> +EXPORT_SYMBOL_GPL(blkdev_zones_mgmt_op);
>  =

>  /*
>   * BLKREPORTZONE ioctl processing.
> @@ -329,15 +334,16 @@ int blkdev_report_zones_ioctl(struct block_device *=
bdev, fmode_t mode,
>  }
>  =

>  /*
> - * BLKRESETZONE ioctl processing.
> + * Zone operation (open, close, finish or reset) ioctl processing.
>   * Called from blkdev_ioctl.
>   */
> -int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t mode,
> -			     unsigned int cmd, unsigned long arg)
> +int blkdev_zones_mgmt_op_ioctl(struct block_device *bdev, fmode_t mode,
> +				unsigned int cmd, unsigned long arg)
>  {
>  	void __user *argp =3D (void __user *)arg;
>  	struct request_queue *q;
>  	struct blk_zone_range zrange;
> +	enum req_opf op;
>  =

>  	if (!argp)
>  		return -EINVAL;
> @@ -358,8 +364,25 @@ int blkdev_reset_zones_ioctl(struct block_device *bd=
ev, fmode_t mode,
>  	if (copy_from_user(&zrange, argp, sizeof(struct blk_zone_range)))
>  		return -EFAULT;
>  =

> -	return blkdev_reset_zones(bdev, zrange.sector, zrange.nr_sectors,
> -				  GFP_KERNEL);
> +	switch (cmd) {
> +	case BLKRESETZONE:
> +		op =3D REQ_OP_ZONE_RESET;
> +		break;
> +	case BLKOPENZONE:
> +		op =3D REQ_OP_ZONE_OPEN;
> +		break;
> +	case BLKCLOSEZONE:
> +		op =3D REQ_OP_ZONE_CLOSE;
> +		break;
> +	case BLKFINISHZONE:
> +		op =3D REQ_OP_ZONE_FINISH;
> +		break;
> +	default:
> +		return -ENOTTY;
> +	}
> +
> +	return blkdev_zones_mgmt_op(bdev, op, zrange.sector, zrange.nr_sectors,
> +				    GFP_KERNEL);
>  }
>  =

>  static inline unsigned long *blk_alloc_zone_bitmap(int node,
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 15a0eb80ada9..df7fe54db158 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -532,7 +532,10 @@ int blkdev_ioctl(struct block_device *bdev, fmode_t =
mode, unsigned cmd,
>  	case BLKREPORTZONE:
>  		return blkdev_report_zones_ioctl(bdev, mode, cmd, arg);
>  	case BLKRESETZONE:
> -		return blkdev_reset_zones_ioctl(bdev, mode, cmd, arg);
> +	case BLKOPENZONE:
> +	case BLKCLOSEZONE:
> +	case BLKFINISHZONE:
> +		return blkdev_zones_mgmt_op_ioctl(bdev, mode, cmd, arg);
>  	case BLKGETZONESZ:
>  		return put_uint(arg, bdev_zone_sectors(bdev));
>  	case BLKGETNRZONES:
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 95202f80676c..067ef9242275 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -284,13 +284,20 @@ enum req_opf {
>  	REQ_OP_DISCARD		=3D 3,
>  	/* securely erase sectors */
>  	REQ_OP_SECURE_ERASE	=3D 5,
> -	/* reset a zone write pointer */
> -	REQ_OP_ZONE_RESET	=3D 6,
>  	/* write the same sector many times */
>  	REQ_OP_WRITE_SAME	=3D 7,
>  	/* write the zero filled sector many times */
>  	REQ_OP_WRITE_ZEROES	=3D 9,
>  =

> +	/* reset a zone write pointer */
> +	REQ_OP_ZONE_RESET	=3D 16,
> +	/* Open zone(s) */
> +	REQ_OP_ZONE_OPEN	=3D 17,
> +	/* Close zone(s) */
> +	REQ_OP_ZONE_CLOSE	=3D 18,
> +	/* Finish zone(s) */
> +	REQ_OP_ZONE_FINISH	=3D 19,
> +
>  	/* SCSI passthrough using struct scsi_request */
>  	REQ_OP_SCSI_IN		=3D 32,
>  	REQ_OP_SCSI_OUT		=3D 33,
> @@ -375,6 +382,22 @@ static inline void bio_set_op_attrs(struct bio *bio,=
 unsigned op,
>  	bio->bi_opf =3D op | op_flags;
>  }
>  =

> +/*
> + * Check if the op is zoned operation.
      Check if op is a zone management operation.
> + */
> +static inline bool op_is_zone_mgmt_op(enum req_opf op)

Similarly to "op_is_write" pattern, "op_is_zone_mgmt" may be a better name.

> +{
> +	switch (op) {
> +	case REQ_OP_ZONE_RESET:
> +	case REQ_OP_ZONE_OPEN:
> +	case REQ_OP_ZONE_CLOSE:
> +	case REQ_OP_ZONE_FINISH:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static inline bool op_is_write(unsigned int op)
>  {
>  	return (op & 1);
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 592669bcc536..943084f9dc9c 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -348,14 +348,15 @@ extern unsigned int blkdev_nr_zones(struct block_de=
vice *bdev);
>  extern int blkdev_report_zones(struct block_device *bdev,
>  			       sector_t sector, struct blk_zone *zones,
>  			       unsigned int *nr_zones, gfp_t gfp_mask);
> -extern int blkdev_reset_zones(struct block_device *bdev, sector_t sector=
s,
> -			      sector_t nr_sectors, gfp_t gfp_mask);
>  extern int blk_revalidate_disk_zones(struct gendisk *disk);
>  =

>  extern int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t =
mode,
>  				     unsigned int cmd, unsigned long arg);
> -extern int blkdev_reset_zones_ioctl(struct block_device *bdev, fmode_t m=
ode,
> -				    unsigned int cmd, unsigned long arg);
> +extern int blkdev_zones_mgmt_op_ioctl(struct block_device *bdev, fmode_t=
 mode,
> +					unsigned int cmd, unsigned long arg);
> +extern int blkdev_zones_mgmt_op(struct block_device *bdev, enum req_opf =
op,
> +				sector_t sector, sector_t nr_sectors,
> +				gfp_t gfp_mask);

To keep the grouping of declarations, may be declare this one where
blkdev_reset_zones() was ?

>  =

>  #else /* CONFIG_BLK_DEV_ZONED */
>  =

> @@ -376,15 +377,57 @@ static inline int blkdev_report_zones_ioctl(struct =
block_device *bdev,
>  	return -ENOTTY;
>  }
>  =

> -static inline int blkdev_reset_zones_ioctl(struct block_device *bdev,
> -					   fmode_t mode, unsigned int cmd,
> -					   unsigned long arg)
> +static inline int blkdev_zones_mgmt_op_ioctl(struct block_device *bdev,
> +					     fmode_t mode, unsigned int cmd,
> +					     unsigned long arg)
> +{
> +	return -ENOTTY;
> +}
> +
> +static inline int blkdev_zones_mgmt_op(struct block_device *bdev,
> +				       enum req_opf op,
> +				       sector_t sector, sector_t nr_sectors,
> +				       gfp_t gfp_mask)
>  {
>  	return -ENOTTY;

That should be -ENOTSUPP. This is not an ioctl. The ioctl call is above thi=
s one.

>  }
>  =

>  #endif /* CONFIG_BLK_DEV_ZONED */
>  =

> +static inline int blkdev_reset_zones(struct block_device *bdev,
> +				     sector_t sector, sector_t nr_sectors,
> +				     gfp_t gfp_mask)
> +{
> +	return blkdev_zones_mgmt_op(bdev, REQ_OP_ZONE_RESET,
> +				    sector, nr_sectors, gfp_mask);
> +}
> +
> +static inline int blkdev_open_zones(struct block_device *bdev,
> +				    sector_t sector, sector_t nr_sectors,
> +				    gfp_t gfp_mask)
> +{
> +	return blkdev_zones_mgmt_op(bdev, REQ_OP_ZONE_OPEN,
> +				    sector, nr_sectors, gfp_mask);
> +}
> +
> +static inline int blkdev_close_zones(struct block_device *bdev,
> +				     sector_t sector, sector_t nr_sectors,
> +				     gfp_t gfp_mask)
> +{
> +	return blkdev_zones_mgmt_op(bdev, REQ_OP_ZONE_CLOSE,
> +				    sector, nr_sectors,
> +				    gfp_mask);
> +}
> +
> +static inline int blkdev_finish_zones(struct block_device *bdev,
> +				      sector_t sector, sector_t nr_sectors,
> +				      gfp_t gfp_mask)
> +{
> +	return blkdev_zones_mgmt_op(bdev, REQ_OP_ZONE_FINISH,
> +				    sector, nr_sectors,
> +				    gfp_mask);
> +}
> +
>  struct request_queue {
>  	/*
>  	 * Together with queue_head for cacheline sharing
> diff --git a/include/uapi/linux/blkzoned.h b/include/uapi/linux/blkzoned.h
> index 498eec813494..701e0692b8d3 100644
> --- a/include/uapi/linux/blkzoned.h
> +++ b/include/uapi/linux/blkzoned.h
> @@ -120,9 +120,11 @@ struct blk_zone_report {
>  };
>  =

>  /**
> - * struct blk_zone_range - BLKRESETZONE ioctl request
> - * @sector: starting sector of the first zone to issue reset write point=
er
> - * @nr_sectors: Total number of sectors of 1 or more zones to reset
> + * struct blk_zone_range - BLKRESETZONE/BLKOPENZONE/
> + *			   BLKCLOSEZONE/BLKFINISHZONE ioctl
> + *			   request
> + * @sector: starting sector of the first zone to operate on
> + * @nr_sectors: Total number of sectors of all zones to operate on
>   */
>  struct blk_zone_range {
>  	__u64		sector;
> @@ -139,10 +141,19 @@ struct blk_zone_range {
>   *                sector range. The sector range must be zone aligned.
>   * @BLKGETZONESZ: Get the device zone size in number of 512 B sectors.
>   * @BLKGETNRZONES: Get the total number of zones of the device.
> + * @BLKOPENZONE: Open the zones in the specified sector range. The
> + *               sector range must be zone aligned.
> + * @BLKCLOSEZONE: Close the zones in the specified sector range. The
> + *                sector range must be zone aligned.
> + * @BLKFINISHZONE: Finish the zones in the specified sector range. The
> + *                 sector range must be zone aligned.
>   */
>  #define BLKREPORTZONE	_IOWR(0x12, 130, struct blk_zone_report)
>  #define BLKRESETZONE	_IOW(0x12, 131, struct blk_zone_range)
>  #define BLKGETZONESZ	_IOR(0x12, 132, __u32)
>  #define BLKGETNRZONES	_IOR(0x12, 133, __u32)
> +#define BLKOPENZONE	_IOW(0x12, 134, struct blk_zone_range)
> +#define BLKCLOSEZONE	_IOW(0x12, 135, struct blk_zone_range)
> +#define BLKFINISHZONE	_IOW(0x12, 136, struct blk_zone_range)
>  =

>  #endif /* _UAPI_BLKZONED_H */
> =



-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
