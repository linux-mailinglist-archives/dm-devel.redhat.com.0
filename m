Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0E9C99B
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 08:46:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91AF98980E1;
	Mon, 26 Aug 2019 06:46:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6671460BEC;
	Mon, 26 Aug 2019 06:46:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BA3E4A486;
	Mon, 26 Aug 2019 06:46:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7Q6kPgJ023417 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 02:46:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D7CE44118; Mon, 26 Aug 2019 06:46:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A02D196AE;
	Mon, 26 Aug 2019 06:46:20 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 554FF4E93D;
	Mon, 26 Aug 2019 06:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1566801968; x=1598337968;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=EL6VpruuyMshapfFSzAR7ZARJkT0BKe4o9GhJLUbAO4=;
	b=g7lHhAW9HVzl0BUxY0QutawAzT2kVldFHGW50bQzOKH/r/XuogJu73cb
	DwMvrTdc5DntfofzPV+3RiD6Dbhi01whmKwOPJsPhvhQYTd4dtL9pBL6o
	jtXtQDQApPIiFpHNY45yzqdC2mMZnui+a0QgC30tfwYvsar0iLpKufBbf
	jWzr2aAiADtTuD2XJp9zaxIcjYSLhcC2U4pnqTqnCYhlzyjV9YLcbRVjR
	1cUannrBT2Y9/luuObR9Q3CRd5DWtsP3CemPQoACDeT6xD3Zm7/rT9Vzv
	ivKJSERXfQZqRlThP/CjDxOoTADIiMkFnaLQcWG0BpS58UFlpx9FRyL7s Q==;
IronPort-SDR: Bp/J92YH1/+BxUwCkVjl7sG5g9zvllYDyUgf/nf/e9ZWcVK+oEvblKA/UoEMlPxblT0KPIeKgt
	k14LSXG2EvW11/0XXHz8DJpNS21BqKLZq5Jui0fs8T9SGmc+Kv4BK41KOIzb6q7G4kZcxcXmC+
	609zfwRF0lLpxqrTxXFXfmUbhA8Tb9KFTO2SaSjhMFid86FmJTeVLTp/cfC8j1xye75CTYQY3C
	+wMcuYENkLNJmNKGjIu/THAv8um0GTSLOBiH6Bc5PoMSmX+xMH7Elq9YfByTJGOQPxbowcBvqO
	J/0=
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="117570821"
Received: from mail-bn3nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.50])
	by ob1.hgst.iphmx.com with ESMTP; 26 Aug 2019 14:45:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f4pNxO99JeT7R0QFwRAXFEJMgCNEJFAMbAmAD84s8Csk5mLo8r0ywHMmyvMxcJWWsAOtD6aBT0W5uiGoEQrO9eiogvxzk2Onk4M0m5qTroqXlclGdNaO7eLrE73GvSQTcn4XJhBwWSYeDVt//gySlVuLENnI9RJ0rQ/7Tw/+s4SIlYUZhX2JmUVzmTeu7Z/tOTTwEeNN17cH8Bk8i/DZXYFzyQ8vOgEH37UfBp01hYF4Hc3QKmZK1zWhhqajSDKoCAF3D/FvNreScEjh/bQRxBF5t4LUBLsotka66qiMNnYOpc6a1v4XUiScCQfWUMyZrCoL7jb6fCh0Q2nvocS55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MTYFCxcYvRbh/fRf3s4+Y5MD7y6cVi2YDT+4QAFo2l4=;
	b=hxwUiFHiLOEee9GlpHtNtIcistZ9uZsE+xxZnzkRUeFLI6ChysPIcfIlKkvH1F95uhTgq/FAdI4FXgb66i85XyLqHIr47KZ2r5Z+e0GLNKAgcRfXptqPPnDfzCnbT8l/HWjRY7h8Y9AWz1YuYW8KcpNTECSJgL0mE82cPLPULj8zsf45GwwSNEQp7AtfWUPkFTCdqtUg40LGnISjbrKmEwP3gxYV9Kjwq2ZW/CKix5R5G8SI6tbWKDkaKZlEXNnvGXxphKQj0Y1zCN9d9dxO2vUoEEhS9A5qJl5RDn5jw9XGeMPMUDqhEcVOwyR0NRrDpPUd+aBlbqbhGLeSytFbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MTYFCxcYvRbh/fRf3s4+Y5MD7y6cVi2YDT+4QAFo2l4=;
	b=HUODamy2rbhH4q7AJTG7wFjRLGZ9ydfO7Ehi4Z7OwPMMQeIE6HycJhy1zJjMlry/tg5XhtRN2w5dhUi8/t6pYuqTHABtlyzIP1fo2x+ju5RJvZRq/Fn/culJgZBB/TKMUYRybDzTAF1cJadqAXc63KsyJ6pFgL5QIJxD1v6X3GE=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5992.namprd04.prod.outlook.com (20.178.233.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2199.21; Mon, 26 Aug 2019 06:45:40 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::a538:afd0:d62a:55bc]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::a538:afd0:d62a:55bc%7]) with mapi id 15.20.2199.021;
	Mon, 26 Aug 2019 06:45:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Dmitry Fomichev
	<Dmitry.Fomichev@wdc.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] accessing invalid memory in "dm zoned: properly handle
	backing device failure"
Thread-Index: AQHVW9lM2TS+j2OdP0edD+cN88evfw==
Date: Mon, 26 Aug 2019 06:45:39 +0000
Message-ID: <BYAPR04MB58169660ACD5E6B68DBCB070E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <alpine.LRH.2.02.1908260232180.7419@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c51cf5c-6608-45bf-fc73-08d729f10253
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5992; 
x-ms-traffictypediagnostic: BYAPR04MB5992:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB59924FE9C2105BD736305999E7A10@BYAPR04MB5992.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(53546011)(4326008)(86362001)(53936002)(99286004)(71190400001)(71200400001)(6506007)(55016002)(76176011)(8936002)(14444005)(7696005)(256004)(6116002)(3846002)(6436002)(5660300002)(229853002)(9686003)(52536014)(446003)(186003)(102836004)(33656002)(26005)(74316002)(66446008)(64756008)(76116006)(66476007)(91956017)(81156014)(81166006)(7736002)(486006)(476003)(305945005)(478600001)(25786009)(66066001)(316002)(14454004)(110136005)(66946007)(8676002)(66556008)(450100002)(2906002)(6246003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5992;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s//zTCtWg0mmadP6EwS0aahlnk502BIoOz/C9ggPjzwch1o7yxWw6TNivXH9Pim5hAbH/nuekPfyD+/DcPX0ZD6wYlvS7oIQVGlfhCIqtU+Jrm0UADcRGB2u31wmW1oWlt8/9ELTmrKpsnkHBiUIwP0neUREWk/2IUeGFVENI8+zfYY7xtH/QWLmnKGI2ZRqKZLa7kda2VJ/DAiMu9qQzFxy2gutkGhEDE+xiaApL0aAp7iC6LBhzPLF/0xOm8mzUz4iYARGOyzJVCwQMcyRXC1oQEOyp2dL7Eg0fwIliDvIajSiMKioMY/fbXGVnDXFfrIdT/ics9GBAaUtHG7DZjj0lFmHbG+6UeZd96p24xWC9OZFzBpI77Yz00tUCBcm8mZCEJAHDhRV/CGazjKvsFzhXDoCeOBnM7565a2XAA8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c51cf5c-6608-45bf-fc73-08d729f10253
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 06:45:39.7571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNeKxu7EyJn852+CyCAwBGwRGfoR3JPZTyk9rIeFohFm4mqpyWFvvpVz1pvqwPXvscil/tzMUJS6t52uVGm5yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5992
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 26 Aug 2019 06:46:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 26 Aug 2019 06:46:08 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=13447a3b6=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7Q6kPgJ023417
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] accessing invalid memory in "dm zoned:
 properly handle backing device failure"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Mon, 26 Aug 2019 06:46:32 +0000 (UTC)

On 2019/08/26 15:41, Mikulas Patocka wrote:
> The patch 75d66ffb48efb30f2dd42f041ba8b39c5b2bd115 ("dm zoned: properly 
> handle backing device failure") triggers a coverity warning:
> 
> *** CID 1452808:  Memory - illegal accesses  (USE_AFTER_FREE)
> /drivers/md/dm-zoned-target.c: 137 in dmz_submit_bio()
> 131             clone->bi_private = bioctx;
> 132
> 133             bio_advance(bio, clone->bi_iter.bi_size);
> 134
> 135             refcount_inc(&bioctx->ref);
> 136             generic_make_request(clone);
>>>>     CID 1452808:  Memory - illegal accesses  (USE_AFTER_FREE)
>>>>     Dereferencing freed pointer "clone".
> 137             if (clone->bi_status == BLK_STS_IOERR)
> 138                     return -EIO;
> 139
> 140             if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
> 141                     zone->wp_block += nr_blocks;
> 142
> 
> The "clone" bio may be processed and freed before the check 
> "clone->bi_status == BLK_STS_IOERR" - so this check can access invalid 
> memory.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  drivers/md/dm-zoned-target.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-zoned-target.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-zoned-target.c	2019-08-26 08:30:30.000000000 +0200
> +++ linux-2.6/drivers/md/dm-zoned-target.c	2019-08-26 08:36:23.000000000 +0200
> @@ -134,8 +134,6 @@ static int dmz_submit_bio(struct dmz_tar
>  
>  	refcount_inc(&bioctx->ref);
>  	generic_make_request(clone);
> -	if (clone->bi_status == BLK_STS_IOERR)
> -		return -EIO;
>  
>  	if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
>  		zone->wp_block += nr_blocks;
> 

Argh... Indeed. Thanks Mikulas.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
