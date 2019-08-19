Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C69498D
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 18:12:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 526163CA21;
	Mon, 19 Aug 2019 16:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61CA4B32C5;
	Mon, 19 Aug 2019 16:12:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FE3F1800202;
	Mon, 19 Aug 2019 16:12:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JGCFFe017564 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 12:12:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEE325C226; Mon, 19 Aug 2019 16:12:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1575C1D6;
	Mon, 19 Aug 2019 16:12:10 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C905307D95F;
	Mon, 19 Aug 2019 16:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1566231124; x=1597767124;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
	b=WKra0LhlBRtzDInhnjPpuS0pudDonudBPNlMyLiYYDwWqe4f6jc7EWwY
	dQOGyKc4wvKo6aYR/lU9SFeRHeM2BEfGKNlaswTtumLiCqZLak3hl5/vW
	LCbjmJKe/soDGkR8jhFBdFLWT7/IcxJOWWRo7qkphsCFQ3dzhbzRgzTZG
	tN6Z1vttmkQMHeHwxNEb3tG+lKGDI6UpatnDCaoJn7YNqIn+Cr4mNfPWN
	23y80ZfYjfq9M1RYGXmDotUXPoPb//sNdBIBu3vviizyjtHf6L1rD66bm
	wO9nRDgaV133uI6iicerPL+cArQXSZvva6jXhBO048vPcVm2CYqfJZoln A==;
IronPort-SDR: 0lRV1rUdaDIvjUFfKWbsx+dfPb7Xg9rl/2CnZgiIMQksT8g5k+5b52yRuWjWcYqOcxZ5LyAalR
	9Yjm9guiNwgF6MOJiBZO/uGYTxl80/qcaF50wa8UJP6Q1/s5Qi8EocBV5RMcm+PixftMRcUghG
	pg5UC3dtS4lRtMU+/mNfEMkk+SD/801pkfQyzvG33604fVqj13z4PLoy3Yb00NjObBwBNCZ3n5
	xYeo6hq3yJtEne/2VaHaGzbWiGQ6JcAGpT4qo4fllvWzGyoYm3W0h83thduVQp2Gro4AR5VJnh
	jqg=
X-IronPort-AV: E=Sophos;i="5.64,405,1559491200"; d="scan'208";a="222712813"
Received: from mail-dm3nam03lp2054.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.54])
	by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2019 00:11:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IakxQKdT1H/dfHs08TGWJ5KMOM1jg69+uJojFhgx9o956zlame3U2UavvLZNKomSrpzt+60cFd11BHpSAQ/csoWLsY20RId5hCUJlDJBF0jLVdAdUaAR3+QVyhp5DiRo+505bVNdLEqXcfYEsGhBQjg7jpt7EYZWh+3L+MoZHzW5zPDjtUOn18JSST4FrLR7uobaWOTjP18FAOqY7L9/T2SMuGnMIc2kxi0e6jQxoHH2N+XToMzP2yTVf/x6KlDorY1jLQbhj6ZrQeCHx2nQbb/R4ex4sbL3zSPZwaZxBZ/e5LUVEyR64FurpsWlzPOycgwM6wa4DOXeybE5Yoh/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
	b=OsJFrjBObvZJEPI2roNwwju/WT5vUvyDxtbYP4I4YImkGfUNU3CBCUB6xkcVtGRQnyiQxZol5fvr4W1vmXNQ9wseewrcvf5ZEG+NyPpKDHZO/h0Jz9WAp+JhFz3AgstGieuuEXzQHlfTpyUXQ3gFSfnqsIqk2G0cO2HKgwZK0no035Z1FP+QI0aOUp0Up//p33Q3O1D0styhxAX6CuI0PMg4tqs4ngN1znovtHiu6iYJXiKgg/2Eq9JE5vu42Mxv57izs7mMAZxcBSubiLLX5+ltPqaAQ9Xo/Jd4l2OaZ2vheNONf5ZbrPR7JGrU28WhYSgZosGdM7Q/p2ROTH9xhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=l/0rZR/21QQsnRaWat27wCS5R6P1+ev1sCocT8pucy8=;
	b=lu97F3wW3keAi1j9KsHEAghjvvvbnEsxDlSZIuiwdwjX0xOymfuHn/PAtUU3GZlUtOw7XrvjANwesonjs39O11Xa0/Va91RtAO7bwNcBVWsUcrLUy5EBEXk6kCqV6c1kGTNxOLXvOij7Dg8+najugkpIglhQ2yoWR7OoMxsWdjQ=
Received: from CO2PR04MB2328.namprd04.prod.outlook.com (10.166.95.11) by
	CO2PR04MB2341.namprd04.prod.outlook.com (10.166.94.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.18; Mon, 19 Aug 2019 16:11:19 +0000
Received: from CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::b44d:f58f:f4bd:fdea]) by
	CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::b44d:f58f:f4bd:fdea%12]) with mapi id 15.20.2178.018;
	Mon, 19 Aug 2019 16:11:18 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "agk@redhat.com" <agk@redhat.com>, "dan.carpenter@oracle.com"
	<dan.carpenter@oracle.com>
Thread-Topic: [PATCH] dm zoned: Potential NULL dereference in dmz_do_reclaim()
Thread-Index: AQHVVnTErbZG/DKk902JuPlWENvAGKcCpIyA
Date: Mon, 19 Aug 2019 16:11:18 +0000
Message-ID: <d53fb01681501c2a777f74a3acc145df37b97458.camel@wdc.com>
References: <20190819095814.GA19905@mwanda>
In-Reply-To: <20190819095814.GA19905@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Dmitry.Fomichev@wdc.com; 
x-originating-ip: [199.255.45.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76243c75-4504-4f1e-cc25-08d724bfde9d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:CO2PR04MB2341; 
x-ms-traffictypediagnostic: CO2PR04MB2341:
x-microsoft-antispam-prvs: <CO2PR04MB2341BE151ABACD18E10A4E33E1A80@CO2PR04MB2341.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(53936002)(118296001)(256004)(5660300002)(81156014)(81166006)(7736002)(25786009)(8676002)(6246003)(86362001)(4326008)(305945005)(36756003)(66946007)(316002)(66446008)(64756008)(66066001)(66556008)(66476007)(110136005)(54906003)(99286004)(486006)(446003)(11346002)(229853002)(2616005)(476003)(2906002)(76176011)(3846002)(6116002)(6512007)(91956017)(14454004)(76116006)(8936002)(6506007)(102836004)(186003)(2501003)(26005)(6436002)(6486002)(478600001)(71200400001)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2341;
	H:CO2PR04MB2328.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RRZE5kz1HkDtKWDvJrjlLi1XkXp+A8ik+ygwuYzwaKvTXNU5uy+jMXoMOpM1qB2QpMYAsVxwL0FQPc9o45IleETsZ4fMo0BeO7yvtisAOrwqFfrYe0EZLSQEAkXFDtTdoo+dIhtWWGaplqkJ8q9rgiUzxlizCLnd7UR3DWjqqjsvit0Dy6tLnHYT5n+uDsCOT3PcCvJP/fO4QcxXAecjgV8l4FNmESpiyllWhmDB0tbPWlgFe9Z0K2M3qArrkh1bkvEcLJ2L8xigIA0vBPsM5m5GhpGjtvGxaW1ib9bSlk1sOnyyrRs5Zmx8k/I752ylwmtQdaZ44b4W5nfLlwxYj1PUXa+YhSpRgHxw9uAS2eXAIKj0H14Y7fi14hDHDHj3QF3Tghvb2ISy+2Yu72K2fQmC1mbVV3rydNpvOOnxhac=
x-ms-exchange-transport-forked: True
Content-ID: <7183DCDF3A8793459F8D2975F778DB12@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76243c75-4504-4f1e-cc25-08d724bfde9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 16:11:18.6522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CYVs58iUB8QNMZs76OlXIQgNc/iNEhvART4Ol4TrE4/hgwgUlQ7kY7JtDZeUuXLPykvT79+KPeaNReZVeF7puA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2341
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 19 Aug 2019 16:12:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 19 Aug 2019 16:12:04 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'Dmitry.Fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com 68.232.141.245
	esa1.hgst.iphmx.com <prvs=127b0b08e=Dmitry.Fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7JGCFFe017564
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm zoned: Potential NULL dereference in
	dmz_do_reclaim()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 19 Aug 2019 16:12:28 +0000 (UTC)

Dan,

On Mon, 2019-08-19 at 12:58 +0300, Dan Carpenter wrote:
> This function is supposed to return error pointers so it matches the
> dmz_get_rnd_zone_for_reclaim() function.  The current code could lead to
> a NULL dereference in dmz_do_reclaim()
> 
> Fixes: b234c6d7a703 ("dm zoned: improve error handling in reclaim")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 2a5bc51fd6d5..595a73110e17 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1588,7 +1588,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  	struct dm_zone *zone;
>  
>  	if (list_empty(&zmd->map_seq_list))
> -		return NULL;
> +		return ERR_PTR(-EBUSY);
>  
>  	list_for_each_entry(zone, &zmd->map_seq_list, link) {
>  		if (!zone->bzone)
> @@ -1597,7 +1597,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  			return zone;
>  	}
>  
> -	return NULL;
> +	return ERR_PTR(-EBUSY);
>  }
>  
>  /*

thanks for noticing this -

Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
