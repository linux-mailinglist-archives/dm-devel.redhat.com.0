Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 829074F30A
	for <lists+dm-devel@lfdr.de>; Sat, 22 Jun 2019 03:16:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED4D33083394;
	Sat, 22 Jun 2019 01:16:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EA855B689;
	Sat, 22 Jun 2019 01:16:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B38D3F6E4;
	Sat, 22 Jun 2019 01:16:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5M1GG9i027297 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 21:16:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 583365B68B; Sat, 22 Jun 2019 01:16:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A93B55D739;
	Sat, 22 Jun 2019 01:16:11 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34E9387620;
	Sat, 22 Jun 2019 01:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561166167; x=1592702167;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=gGa8jvmGG3lwGCAYzw62szrsezSH8eJysHqEY8JDW9c=;
	b=Nerdp9U3Kk1jxmQvqjz96XWZ37OdYlL3CpXxY9MGayoDZPjQGC+X1qpO
	1Qw8LN/g8gkIuU+ImSFYjK8gRnwZCFfGgKv99DKXEX0Wm71I+6Xu1h1FM
	JdFBMfcp9OAPmGJM3KhgiiyWqMGkQeKyuDL2uOSR2f9sdyBfgjMMyci83
	mbtYyXVKZNCo8JUzCHingiP/L3ezcEnpQJaCkjGFf46CgJXOO+Tjy6oRn
	AarCqLiGU99V0k42SVBzJk9/bctM3P5NEMyNzUhnPlEIA6i9rxQ4x4nbd
	I1v9ym2gz+WbgW00Qq56711gnYfPtmSxOgBlEJnrQamXsZOaqQzRZ2X6h w==;
X-IronPort-AV: E=Sophos;i="5.63,402,1557158400"; d="scan'208";a="210966714"
Received: from mail-by2nam01lp2055.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.55])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2019 09:16:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=b33dyQNTS3E9ndnKaizXjDvbdCqpvsEt4HZQu/7I5uo=;
	b=dusbQxU8+zlXYcpo4e2i7FmN2LFUj4jPDCAdAvbnu6JQeivnRBBN4syHM9w0TdppT1kdxNDwvHTpjmUipo69J1mRjtgoTyMns31WO0XQpI2j+KawfyI2gF7yYXLoVhCx7zh8R/xqRUEtfEfghSpi6U+yE+g53JuC/08cK9nlNT4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4135.namprd04.prod.outlook.com (20.176.250.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Sat, 22 Jun 2019 01:15:30 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.1987.014;
	Sat, 22 Jun 2019 01:15:30 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni
	<Chaitanya.Kulkarni@wdc.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 4/4] dm: add zone open, close and finish support
Thread-Index: AQHVKDJPZf/FnpeWOkmi6Il1fuZYGw==
Date: Sat, 22 Jun 2019 01:15:30 +0000
Message-ID: <BYAPR04MB581688295FDAAF91805CD871E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-5-mb@lightnvm.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd3c13c7-af57-4660-d531-08d6f6af1e08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4135; 
x-ms-traffictypediagnostic: BYAPR04MB4135:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4135E419320740677340E3C4E7E60@BYAPR04MB4135.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(136003)(366004)(346002)(376002)(199004)(189003)(14454004)(81166006)(14444005)(26005)(256004)(3846002)(25786009)(6116002)(53936002)(71200400001)(446003)(71190400001)(476003)(486006)(66946007)(55016002)(186003)(66574012)(7696005)(74316002)(6506007)(81156014)(8676002)(5660300002)(9686003)(64756008)(66476007)(66446008)(53546011)(66556008)(102836004)(99286004)(76116006)(73956011)(229853002)(91956017)(8936002)(305945005)(76176011)(7736002)(52536014)(6436002)(4326008)(33656002)(66066001)(6246003)(72206003)(2201001)(2501003)(86362001)(478600001)(2906002)(110136005)(316002)(7416002)(68736007)(54906003)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4135;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E8L15gAswm/xuI5MPfOeMcUUb5/ras4ZQT0XsSlV2THzMx1QhrjBhP0cjZIsEIi9dWsazOxiVtOfN5yTdldEyWTLv+FdEIHKiKg03LJS7frdxeYoh9OhlJOYj6bnMmeXMdqylvaMJPjrH5uLEKWDBYePkOUUzOyH9FUMPJ+xI10U7yJqNzqrXyEfXsNVufr757OZuRKe3oG/1x4YzoafnoNxGsHXCNhHri+v/8Sbpt5wfKjUac/MPsG+FRNQrERuCEd7QKVO8AfkPCzL0mSsaTiighKrUiEhd5M62fEUr/P0u63PJl/oyJ2d4R+5El3E5btlNPwHT9kvqdDBnFmCYzlXIEAAJ9zpO84vHo148hZerVmnPRHkebS8NsgFPKRYwG5zCTW75lEHiGSP1PbPzIeeEY2o6Aqa/txWhlE6ST8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3c13c7-af57-4660-d531-08d6f6af1e08
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 01:15:30.1769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4135
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Sat, 22 Jun 2019 01:16:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Sat, 22 Jun 2019 01:16:02 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com
	68.232.143.124 esa2.hgst.iphmx.com
	<prvs=069675b12=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5M1GG9i027297
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 4/4] dm: add zone open,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 22 Jun 2019 01:16:42 +0000 (UTC)

On 2019/06/21 22:07, Matias Bj=F8rling wrote:
> From: Ajay Joshi <ajay.joshi@wdc.com>
> =

> Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
> support to allow explicit control of zone states.
> =

> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
> ---
>  drivers/md/dm-flakey.c    | 7 +++----
>  drivers/md/dm-linear.c    | 2 +-
>  drivers/md/dm.c           | 5 +++--
>  include/linux/blk_types.h | 8 ++++++++
>  4 files changed, 15 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
> index a9bc518156f2..fff529c0732c 100644
> --- a/drivers/md/dm-flakey.c
> +++ b/drivers/md/dm-flakey.c
> @@ -280,7 +280,7 @@ static void flakey_map_bio(struct dm_target *ti, stru=
ct bio *bio)
>  	struct flakey_c *fc =3D ti->private;
>  =

>  	bio_set_dev(bio, fc->dev->bdev);
> -	if (bio_sectors(bio) || bio_op(bio) =3D=3D REQ_OP_ZONE_RESET)
> +	if (bio_sectors(bio) || bio_is_zone_mgmt_op(bio))
>  		bio->bi_iter.bi_sector =3D
>  			flakey_map_sector(ti, bio->bi_iter.bi_sector);
>  }
> @@ -322,8 +322,7 @@ static int flakey_map(struct dm_target *ti, struct bi=
o *bio)
>  	struct per_bio_data *pb =3D dm_per_bio_data(bio, sizeof(struct per_bio_=
data));
>  	pb->bio_submitted =3D false;
>  =

> -	/* Do not fail reset zone */
> -	if (bio_op(bio) =3D=3D REQ_OP_ZONE_RESET)
> +	if (bio_is_zone_mgmt_op(bio))
>  		goto map_bio;
>  =

>  	/* Are we alive ? */
> @@ -384,7 +383,7 @@ static int flakey_end_io(struct dm_target *ti, struct=
 bio *bio,
>  	struct flakey_c *fc =3D ti->private;
>  	struct per_bio_data *pb =3D dm_per_bio_data(bio, sizeof(struct per_bio_=
data));
>  =

> -	if (bio_op(bio) =3D=3D REQ_OP_ZONE_RESET)
> +	if (bio_is_zone_mgmt_op(bio))
>  		return DM_ENDIO_DONE;
>  =

>  	if (!*error && pb->bio_submitted && (bio_data_dir(bio) =3D=3D READ)) {
> diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
> index ad980a38fb1e..217a1dee8197 100644
> --- a/drivers/md/dm-linear.c
> +++ b/drivers/md/dm-linear.c
> @@ -90,7 +90,7 @@ static void linear_map_bio(struct dm_target *ti, struct=
 bio *bio)
>  	struct linear_c *lc =3D ti->private;
>  =

>  	bio_set_dev(bio, lc->dev->bdev);
> -	if (bio_sectors(bio) || bio_op(bio) =3D=3D REQ_OP_ZONE_RESET)
> +	if (bio_sectors(bio) || bio_is_zone_mgmt_op(bio))
>  		bio->bi_iter.bi_sector =3D
>  			linear_map_sector(ti, bio->bi_iter.bi_sector);
>  }
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 5475081dcbd6..f4507ec20a57 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1176,7 +1176,8 @@ static size_t dm_dax_copy_to_iter(struct dax_device=
 *dax_dev, pgoff_t pgoff,
>  =

>  /*
>   * A target may call dm_accept_partial_bio only from the map routine.  I=
t is
> - * allowed for all bio types except REQ_PREFLUSH and REQ_OP_ZONE_RESET.
> + * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_RESET,
> + * REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH.
>   *
>   * dm_accept_partial_bio informs the dm that the target only wants to pr=
ocess
>   * additional n_sectors sectors of the bio and the rest of the data shou=
ld be
> @@ -1629,7 +1630,7 @@ static blk_qc_t __split_and_process_bio(struct mapp=
ed_device *md,
>  		ci.sector_count =3D 0;
>  		error =3D __send_empty_flush(&ci);
>  		/* dec_pending submits any data associated with flush */
> -	} else if (bio_op(bio) =3D=3D REQ_OP_ZONE_RESET) {
> +	} else if (bio_is_zone_mgmt_op(bio)) {
>  		ci.bio =3D bio;
>  		ci.sector_count =3D 0;
>  		error =3D __split_and_process_non_flush(&ci);
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 067ef9242275..fd2458cd1a49 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -398,6 +398,14 @@ static inline bool op_is_zone_mgmt_op(enum req_opf o=
p)
>  	}
>  }
>  =

> +/*
> + * Check if the bio is zoned operation.
> + */
> +static inline bool bio_is_zone_mgmt_op(struct bio *bio)
> +{
> +	return op_is_zone_mgmt_op(bio_op(bio));
> +}
> +
>  static inline bool op_is_write(unsigned int op)
>  {
>  	return (op & 1);
> =


Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
