Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF44F302
	for <lists+dm-devel@lfdr.de>; Sat, 22 Jun 2019 03:04:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61B2A308FC5F;
	Sat, 22 Jun 2019 01:04:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD0F15D962;
	Sat, 22 Jun 2019 01:04:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E106B1806B19;
	Sat, 22 Jun 2019 01:04:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5M13s0P005540 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 21:03:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1D7060576; Sat, 22 Jun 2019 01:03:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FE28604CC;
	Sat, 22 Jun 2019 01:03:50 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC79E30820E6;
	Sat, 22 Jun 2019 01:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561165453; x=1592701453;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=Udndhz60ZzlfIpHCFeg0jc33OOEAT1IEHGJWYT7AkSI=;
	b=EHF6b7UYs0++7Mhtx4lMKNZe4HQ6OiOTEBZJ+uSao8DMio9+OnI6fekD
	4oq2pWcXl+6TEMPInupMqedJaq/W1jMwqgnXsOQjMNWqYiqKC/eYXMjMj
	el3O8cSGUm1boLGp74GZAl3dVg/z3al9wau7N5NCFuJpbOE6zRTn8jjsY
	M298qcleIVSF3svP2zBn2teEXq5kwcoubLlrY17b63uTgxqa5Ft1rBlwu
	Xqp8E+S0CJLPvSX1ky8nwaInZL/RtEWiUSFCnq/lqyDmraCBvj4Bux0gx
	ckDQgeOYGhruYtLYkbxrdpLYzI6TZ3euF1mgcIzo+ha5ybtD5ooKEoMIF A==;
X-IronPort-AV: E=Sophos;i="5.63,402,1557158400"; d="scan'208";a="210966298"
Received: from mail-bn3nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.53])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jun 2019 09:03:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TxhXsic7HCm3JaUSZgoQTreVYV33L1KfbJ+EQXdKi6o=;
	b=ILEoYwB2jxL1/pMblb8QS49+oV6UFU2CU4YLnsSNtVmmYd/rokHyoL9tHv8RZRKpyZeZeh4WOuFrMzrrP1SLHWhbJCv1YEi29nor5XvDrLPrknoWdDvW7ToVpgCqmr1RvC7GiYpJnP4FHeAB496mQUvgfq27rw/Bc2UtBLkq6w4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5142.namprd04.prod.outlook.com (52.135.235.80) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.16; Sat, 22 Jun 2019 01:02:57 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::e94e:8ead:40b1:fae6%7]) with mapi id 15.20.1987.014;
	Sat, 22 Jun 2019 01:02:57 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: =?iso-8859-1?Q?Matias_Bj=F8rling?= <mb@lightnvm.io>, "axboe@fb.com"
	<axboe@fb.com>, "hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni
	<Chaitanya.Kulkarni@wdc.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	Ajay Joshi <Ajay.Joshi@wdc.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Thread-Topic: [PATCH 2/4] null_blk: add zone open, close, and finish support
Thread-Index: AQHVKDJPvRqrrDdCI02PGkGKUbxkfQ==
Date: Sat, 22 Jun 2019 01:02:57 +0000
Message-ID: <BYAPR04MB5816D471063D970DDCF9AEC7E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-3-mb@lightnvm.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d46e582-e6b4-4697-e547-08d6f6ad5d27
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5142; 
x-ms-traffictypediagnostic: BYAPR04MB5142:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB514291E08B70C40920C7DC6AE7E60@BYAPR04MB5142.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(6246003)(7416002)(25786009)(14454004)(6436002)(68736007)(52536014)(72206003)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(71190400001)(71200400001)(73956011)(91956017)(76116006)(5660300002)(66574012)(478600001)(55016002)(2501003)(229853002)(2906002)(66066001)(9686003)(74316002)(14444005)(305945005)(7736002)(7696005)(76176011)(81166006)(186003)(476003)(81156014)(486006)(446003)(256004)(8936002)(4326008)(8676002)(110136005)(54906003)(53936002)(6116002)(3846002)(26005)(99286004)(6506007)(86362001)(102836004)(53546011)(33656002)(2201001)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5142;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PkAnvaKGB2HsQemJLvBkMO67uA8gGV03iMOEKSErEPPZmvtRaHQyJ6E0IjzXdkueUZRXIfTzhqtbPSUxGJS2oM2SxFVQzIm+Y6HPT7E9hmpHefvtT64llT6r3QOpdEzjv7nGrsOvdl5C/UGeUqB5GXOG1n2ECR4TvW/QLMed6oU+ze/Fl+Pa4m3DqSHoSZ8IYI4A0u6W7rIL5l0nGfJVWAhDZnryjuPGMxq107YZQmVH9wRIxgY8qcLsTAyH9FeM4sC26F+0CY6mFdCy1RrsEDovnDlnEYmmOJOlIiJG4zu1SZahgEkKYjKDnYS5M7uAPAbbDYX5EZrE1R0aJutnRgszIhKNKo5TQ7dC6BZ3pEKUiWv6oV/s3biY4sgC2qW3m6Xwpuk9brqN50cfmpwRwpS+2mePHUhwViBtvPSxfrc=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d46e582-e6b4-4697-e547-08d6f6ad5d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 01:02:57.1375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5142
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sat, 22 Jun 2019 01:03:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sat, 22 Jun 2019 01:03:30 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com
	68.232.143.124 esa2.hgst.iphmx.com
	<prvs=069675b12=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5M13s0P005540
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/4] null_blk: add zone open, close,
	and finish support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 22 Jun 2019 01:04:48 +0000 (UTC)

On 2019/06/21 22:07, Matias Bj=F8rling wrote:
> From: Ajay Joshi <ajay.joshi@wdc.com>
> =

> Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
> support to allow explicit control of zone states.
> =

> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
> Signed-off-by: Matias Bj=F8rling <matias.bjorling@wdc.com>
> ---
>  drivers/block/null_blk.h       |  4 ++--
>  drivers/block/null_blk_main.c  | 13 ++++++++++---
>  drivers/block/null_blk_zoned.c | 33 ++++++++++++++++++++++++++++++---
>  3 files changed, 42 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
> index 34b22d6523ba..62ef65cb0f3e 100644
> --- a/drivers/block/null_blk.h
> +++ b/drivers/block/null_blk.h
> @@ -93,7 +93,7 @@ int null_zone_report(struct gendisk *disk, sector_t sec=
tor,
>  		     gfp_t gfp_mask);
>  void null_zone_write(struct nullb_cmd *cmd, sector_t sector,
>  			unsigned int nr_sectors);
> -void null_zone_reset(struct nullb_cmd *cmd, sector_t sector);
> +void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t sector);
>  #else
>  static inline int null_zone_init(struct nullb_device *dev)
>  {
> @@ -111,6 +111,6 @@ static inline void null_zone_write(struct nullb_cmd *=
cmd, sector_t sector,
>  				   unsigned int nr_sectors)
>  {
>  }
> -static inline void null_zone_reset(struct nullb_cmd *cmd, sector_t secto=
r) {}
> +static inline void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t sec=
tor) {}
>  #endif /* CONFIG_BLK_DEV_ZONED */
>  #endif /* __NULL_BLK_H */
> diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
> index 447d635c79a2..5058fb980c9c 100644
> --- a/drivers/block/null_blk_main.c
> +++ b/drivers/block/null_blk_main.c
> @@ -1209,10 +1209,17 @@ static blk_status_t null_handle_cmd(struct nullb_=
cmd *cmd)
>  			nr_sectors =3D blk_rq_sectors(cmd->rq);
>  		}
>  =

> -		if (op =3D=3D REQ_OP_WRITE)
> +		switch (op) {
> +		case REQ_OP_WRITE:
>  			null_zone_write(cmd, sector, nr_sectors);
> -		else if (op =3D=3D REQ_OP_ZONE_RESET)
> -			null_zone_reset(cmd, sector);
> +			break;
> +		case REQ_OP_ZONE_RESET:
> +		case REQ_OP_ZONE_OPEN:
> +		case REQ_OP_ZONE_CLOSE:
> +		case REQ_OP_ZONE_FINISH:
> +			null_zone_mgmt_op(cmd, sector);
> +			break;
> +		}
>  	}
>  out:
>  	/* Complete IO by inline, softirq or timer */
> diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zone=
d.c
> index fca0c97ff1aa..47d956b2e148 100644
> --- a/drivers/block/null_blk_zoned.c
> +++ b/drivers/block/null_blk_zoned.c
> @@ -121,17 +121,44 @@ void null_zone_write(struct nullb_cmd *cmd, sector_=
t sector,
>  	}
>  }
>  =

> -void null_zone_reset(struct nullb_cmd *cmd, sector_t sector)
> +void null_zone_mgmt_op(struct nullb_cmd *cmd, sector_t sector)
>  {
>  	struct nullb_device *dev =3D cmd->nq->dev;
>  	unsigned int zno =3D null_zone_no(dev, sector);
>  	struct blk_zone *zone =3D &dev->zones[zno];
> +	enum req_opf op =3D req_op(cmd->rq);
>  =

>  	if (zone->type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
>  		cmd->error =3D BLK_STS_IOERR;
>  		return;
>  	}
>  =

> -	zone->cond =3D BLK_ZONE_COND_EMPTY;
> -	zone->wp =3D zone->start;
> +	switch (op) {
> +	case REQ_OP_ZONE_RESET:
> +		zone->cond =3D BLK_ZONE_COND_EMPTY;
> +		zone->wp =3D zone->start;
> +		return;
> +	case REQ_OP_ZONE_OPEN:
> +		if (zone->cond =3D=3D BLK_ZONE_COND_FULL) {
> +			cmd->error =3D BLK_STS_IOERR;
> +			return;
> +		}
> +		zone->cond =3D BLK_ZONE_COND_EXP_OPEN;


With ZBC, open of a full zone is a "nop". No error. So I would rather have =
this as:

		if (zone->cond !=3D BLK_ZONE_COND_FULL)
			zone->cond =3D BLK_ZONE_COND_EXP_OPEN;
		=


> +		return;
> +	case REQ_OP_ZONE_CLOSE:
> +		if (zone->cond =3D=3D BLK_ZONE_COND_FULL) {
> +			cmd->error =3D BLK_STS_IOERR;
> +			return;
> +		}
> +		zone->cond =3D BLK_ZONE_COND_CLOSED;

Sam as for open. Closing a full zone on ZBC is a nop. And the code above wo=
uld
also set an empty zone to closed. Finally, if the zone is open but nothing =
was
written to it, it must be returned to empty condition, not closed. So somet=
hing
like this is needed.

		switch (zone->cond) {
		case BLK_ZONE_COND_FULL:
		case BLK_ZONE_COND_EMPTY:
			break;
		case BLK_ZONE_COND_EXP_OPEN:
			if (zone->wp =3D=3D zone->start) {
				zone->cond =3D BLK_ZONE_COND_EMPTY;
				break;
			}
		/* fallthrough */
		default:
			zone->cond =3D BLK_ZONE_COND_CLOSED;
		}

> +		return;
> +	case REQ_OP_ZONE_FINISH:
> +		zone->cond =3D BLK_ZONE_COND_FULL;
> +		zone->wp =3D zone->start + zone->len;
> +		return;
> +	default:
> +		/* Invalid zone condition */
> +		cmd->error =3D BLK_STS_IOERR;
> +		return;
> +	}
>  }
> =



-- =

Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
