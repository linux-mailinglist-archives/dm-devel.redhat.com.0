Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C880336
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 01:27:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AB81307D848;
	Fri,  2 Aug 2019 23:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02B205C207;
	Fri,  2 Aug 2019 23:27:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D59741F53;
	Fri,  2 Aug 2019 23:27:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72NL3Tk006513 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 19:21:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A6A65D962; Fri,  2 Aug 2019 23:21:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034A45D9E2;
	Fri,  2 Aug 2019 23:20:58 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71CDDC0AD2A9;
	Fri,  2 Aug 2019 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1564788045; x=1596324045;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=Pe85iWzUNMzwwnMVvmM4cW2DwuPFoqeo7PXWN/blldA=;
	b=k1pc+pzfwzl3URchWOtO0ni8/M9K5tADhY7l/TcByc7cJ0dTKGpMr0LK
	w74hTppm4L8ob1AgHFiihUtcGF/7BSOBgkDhBq+jfRqjXrKtdHMjn3vez
	TiJj6dO3HQMdpNs7phEBTOKKqsQ8MV+LkR8JGJNSe/M1kjmUbqlHRWhhq
	bKb7/o1Mc78Ubqzikmx2N0S3gzFZfq26WVqBubslT0/ygo+OhLbVSdTFj
	6NZZLT3DjlgkOYkagr1VrqJCkGikm6UO7Wv/JlLajMmuA9rnT4nDZdbSl
	LueEmxC47LvPB3TvJ0SjUbjkIYhbhIeGSOFLLX9wNokKcM4nAK6jrBz90 g==;
IronPort-SDR: M/+fBfs6s5A0iYYP6j6zK1RulsFSxW0g4EjJhpTVQ14YF3br00vT1GDjH4so1IXDnutcbruKqJ
	IBmrzDj3paJ4U3EcA+y2+afTi4mi82cvGDaC8gmF5toGizg3xHzgJrRfL8F9zC9u9hcfOq2YUS
	DaM35WrtI+JIesBI+XOqDzBgFyPGRDd/2bOwdOHQ6wW883/zsxhKma8Q6RlsEgvfFR7aWMlXly
	m1ITRxHXaN2R74zqWDa3/QGaTu7ctV0MCFM5UXGeocU1v4gjwHGC/e6g03FNDOHbyAzTo1Lwz1
	Z90=
X-IronPort-AV: E=Sophos;i="5.64,340,1559491200"; d="scan'208";a="114846732"
Received: from mail-by2nam03lp2055.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.55])
	by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2019 07:20:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jzg5vK67NQni96QAn6PNCBzmyx3IjoL5fVdVlolhUz4F9f2AxyDbw99u2jw1fC/IwqVbH5uskJ7wkJ3gxEyIeHv9eoqFxsCYEKQKqvhhdnX68esS40SPDKBdiV7SX9OuaRuqieNeLo7p20oH8xGjs964JgTDctLWo74vY5RUJse111YZ3Y6Z2XBgvAmCPgnx+YZ2btiyW8OJnpsvKC1t9ikcmX+4HKEBn/QVskGlRnAnbzP2fcd/bwWeQEUZrYEXL3tMapC/GWY8Ly7C5zqPQh26G0gkpMDzC8dI4ik0N6AeWqLLoxzyQ//oOB5rhJr5DJC5GSFHtGtCftg3ueQbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I8MrSCsqy8nHGVdb0Mt44hkQD7fBtnV/bgrGSJ6cLM0=;
	b=Jn+MzjIXuNK77QLdVggWNK5/liMgnlGHKhB7eh1pv3VoxF3FEXtKP6NTSJTGom0AkYRByYQCgGT+M3dziXRqUHzcpI2E0+RdDsAEDy5z+F3MH/tZNXeAWPVg/lU9HKwqUoUOcnGNGzwP0rcuFaatCRmWZZGDihpjQYrroajfSCQjL3Kd4y+KrCuqDNREfRKAWlVHqX1xeAo00jXMfjz5tYg3Xbkc+2uMcoSNReQLXy92RekXVi0hGb1pfsVNyfT97TEW7b5xjWYWwbJFggj/QjnlubH2Fq/b/Jf4dCqBVA5hAu7IdCzD206MdjricekYrWiBKbtTrR+LV8bif0beyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I8MrSCsqy8nHGVdb0Mt44hkQD7fBtnV/bgrGSJ6cLM0=;
	b=VYXsr4vXjMnsaed1q3dvBLd32BJBLNEgJGiPEGMfWR1sCBV2dh1W9WrI2ANgmM0kcXTH8Vp+Abaw9x6ZRTOL3XwLtuekfJTfODgRhn9gQJ6w1JxV0zkJmiULmBw2XmQnZSECfldTFjj8H4Lm6iqcb8DcKpED0kQOqGvOHlVXdCY=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4279.namprd04.prod.outlook.com (20.176.251.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.10; Fri, 2 Aug 2019 23:20:22 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.010;
	Fri, 2 Aug 2019 23:20:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/2] dm-zoned: add SPDX license identifiers
Thread-Index: AQHVSX4JyT3gkMTM+kmxDZ3qBtp1wA==
Date: Fri, 2 Aug 2019 23:20:21 +0000
Message-ID: <BYAPR04MB5816FF243F61F64FF397622CE7D90@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
	<20190802220251.1217-2-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac52b539-c3a3-4d6b-bda1-08d7179ffdc2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4279; 
x-ms-traffictypediagnostic: BYAPR04MB4279:
x-microsoft-antispam-prvs: <BYAPR04MB4279F03A1E211820D2DBB8F9E7D90@BYAPR04MB4279.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(6116002)(66066001)(76176011)(66446008)(76116006)(25786009)(478600001)(3846002)(2501003)(14454004)(8936002)(6246003)(9686003)(81166006)(86362001)(53936002)(8676002)(229853002)(55016002)(6436002)(486006)(74316002)(81156014)(305945005)(91956017)(102836004)(66476007)(5660300002)(33656002)(110136005)(99286004)(7736002)(64756008)(476003)(71200400001)(186003)(2906002)(316002)(71190400001)(53546011)(446003)(68736007)(6506007)(7696005)(66556008)(66946007)(450100002)(256004)(26005)(52536014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4279;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CVaf0ijnaqmEw6WES6mFbIKhHOtz1Lg+qg/O4jo1ehQYXd9LnWSVPZGxJw3TM34MD2KHrTfRSMTFuFESKjIw7OQ5U5eIJTaR2g/27PrPgFRZJX0n5mPZrpekf8qJQbggwEoBzyHDH+SNi8DSBgxDQxTe7EO0bWgeyYifgw6wDJes6r0/d0lH0xqotmHAl2Wz0P0K/842f05YjDC+RkaN+yhHlZ7Ee1sgqGBoMlO1u4uJl5wEjk1enfes48Z+5X0qyxLrJ0Y6mMm3v+ldAvnapmLlaWxNlj0qeP/EdlagDtoEzb03GYPHucoLhomJy2UtDvC2ew2M22IT69Frdm3Db6wbiWYw48iuqoOucU6dzOD9uYBXsCEqbMU3snoS8LsJTTsrjM+YLgyTCj2DhOqv3FTJRUNdBGn+JwYR6DP0f0A=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac52b539-c3a3-4d6b-bda1-08d7179ffdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 23:20:21.9302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4279
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Fri, 02 Aug 2019 23:20:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 02 Aug 2019 23:20:44 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=110ebdbc6=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x72NL3Tk006513
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] dm-zoned: add SPDX license identifiers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 02 Aug 2019 23:27:57 +0000 (UTC)

On 2019/08/03 7:02, Dmitry Fomichev wrote:
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 1 +
>  drivers/md/dm-zoned-reclaim.c  | 1 +
>  drivers/md/dm-zoned-target.c   | 1 +
>  drivers/md/dm-zoned.h          | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 8545dcee9fd0..23e9a6d9350b 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2017 Western Digital Corporation or its affiliates.
>   *
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index edf4b95eb075..387894e2add1 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2017 Western Digital Corporation or its affiliates.
>   *
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 51d029bbb740..1bf6e6eebee1 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2017 Western Digital Corporation or its affiliates.
>   *
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index ed8de49c9a08..1a3b06de2c00 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (C) 2017 Western Digital Corporation or its affiliates.
>   *
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
