Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375E84880
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 11:18:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 753EA30BCBBB;
	Wed,  7 Aug 2019 09:18:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 240495D9E1;
	Wed,  7 Aug 2019 09:18:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E8C62551B;
	Wed,  7 Aug 2019 09:18:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x779GvGo000390 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 05:16:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70BB55D71A; Wed,  7 Aug 2019 09:16:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4905D717;
	Wed,  7 Aug 2019 09:16:48 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2777E316D8D3;
	Wed,  7 Aug 2019 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565169398; x=1596705398;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=mjax/9XYze/zTb20VAF0yWrJiI7DMVuwXvQ8eazWhNY=;
	b=e//aX5lFcNucL3wedhbwMQ0axeqz9fGk0rmUubLsW88r70tgHBbEyl7e
	PcyB1glnpyUA/3EAyDah8zbeLGt0+unGDnZqgmNBYUCmxyYf0qxDpDi7U
	Pi9djON+Bm6EfYJdahDyAqcAAVr7AJPCbS7r0AiHf23UnRVuyq1Rg79Sp
	bFE1nVfragU4v5C9fnRMLG6ZvogmJpjamiTei3HCHR/RLULegjLuLZ+b+
	tapVnPYqHoicKOsULD25uvERpG+eoGBoW7TCUsXhaHg9z4CyPgrP69XAY
	qRBT21LNWZnLyptjpaWbnj+QMywaNvQgMFxgfbD4CT5/Yfvf1HQMZ6lT2 g==;
IronPort-SDR: e3qsr1kSG5+ijblYEbtk50BLFFpOitOdVLk55xip+pTuk1jYxisLToNf6Yix5Nld7ZqNvtWQEP
	7vNaq+zJOB7QC3oNJ6DoNP+y1OLpf5PzWsoYIn8EFBix+kDZQO5Y5JB9ddnO9yi0lPbgdQG9HR
	c8F0nlUl8JVe9B5hxHOn9j2pI7lO8pQ4XYSdmaFkIpMpiJ2iX2Fp7S7ub7hxcuOr/TQWr7uJk8
	bW6BhHY6ZtqRYaf9Jzq172ggK3UznUsz/mQcmRwjn51DmCQcleyRmEM0gMRnMGCHWv9mzruIlb
	vNo=
X-IronPort-AV: E=Sophos;i="5.64,357,1559491200"; d="scan'208";a="115229778"
Received: from mail-co1nam03lp2053.outbound.protection.outlook.com (HELO
	NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.53])
	by ob1.hgst.iphmx.com with ESMTP; 07 Aug 2019 17:16:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ldh5Z3ezSBDKoWb8ySdpbexWtXMAHkcmju7zCPfeAaZsG7SrXCrUIP+C9fmbdJQLtyEmQhw4XwXbg6uyuYpVRy2akAbyl40jzyX/8v292bMZmdI7TQE9vRVeH+A2TIteIMoPDlfYG0REA1pTJqpjdocwpsNYTKxzZCmqtruSiDwjt6q6EYRa1dXCDPiwD+ah9SiiQknsALKtUW7sElO3tQxRsHDS3mUV80mo0LBlnSe99yRVlahRWp+ql37Jk7/VZlRLiNfLwQG1qxrMGHxnUTx/JfJo9twcfhSVTtQ0DJVVVgU1o+6vtuYm7m/e6V0n1Piw/c40mB6aFZqb/coXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HrV69JM0u3qvHE9oinfLbh64HXZlK4pGHhveYxqy6Gk=;
	b=D8FHXw6TDmgEBoeZdCqJ4TPi5uZI1sAymoXk3RZCuTMq0YSAdgH0CWwUkk7su/czwQVOCQZGmRmjla8MEdJACJJ+pLptI6/GLPcp2WfRRPMv/UV5PBkgMPDlfK+nXBP+WSK3Rx2ttU665QRauMpU2WXyCtBP8FQJJ5vDouL/9EvZy4mSlHhF9yyWJB1hFTz8uLkeN7QFW8RQgXdCOR/iSGjwNvL0gU6L9U2Bf26/rMIQA9E+QohUYQQtrIboC+VO2uMqHiosggzJswr2e7tq2iV8G8mGiMlKSJ25LC2ye0mPEq/DlZFFC6x7isdHXbxTe5jSvuUfzp78Q8O/XtWseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HrV69JM0u3qvHE9oinfLbh64HXZlK4pGHhveYxqy6Gk=;
	b=IH/0KXW7ylk2R8abBbTB/nywhzb4ZKnADJ47r763i8ZRZqFDSkgQJlfYYJ3wLHarzJJjLZFfPwa96Qa3dSiTuNMNIwM4YY2RXD2L6t79GddqeLX1aizfXg4/fo7IpPsCda+a/5kpkRitm0Dv5sLvccGpCi5xPD+S4DkXA0lZSnM=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5639.namprd04.prod.outlook.com (20.179.56.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.15; Wed, 7 Aug 2019 09:16:14 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 09:16:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/3] dm-zoned: improve error handling in reclaim
Thread-Index: AQHVS/Mwf7NGhd/m8USnMRMD9phJEA==
Date: Wed, 7 Aug 2019 09:16:14 +0000
Message-ID: <BYAPR04MB5816DCF509654E00D3241EE0E7D40@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
	<20190806010625.27503-2-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5463df26-b3f0-42f0-f257-08d71b17e58b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5639; 
x-ms-traffictypediagnostic: BYAPR04MB5639:
x-microsoft-antispam-prvs: <BYAPR04MB5639D65611117DDA36FC2F45E7D40@BYAPR04MB5639.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(66556008)(66946007)(229853002)(2501003)(66476007)(76116006)(3846002)(86362001)(91956017)(8936002)(33656002)(74316002)(66446008)(76176011)(2906002)(8676002)(305945005)(6116002)(81166006)(81156014)(14454004)(64756008)(53546011)(6506007)(7736002)(9686003)(55016002)(316002)(25786009)(99286004)(186003)(486006)(110136005)(6436002)(476003)(53936002)(68736007)(446003)(6246003)(52536014)(26005)(478600001)(450100002)(7696005)(102836004)(71200400001)(5660300002)(14444005)(256004)(71190400001)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5639;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XJHlTvHzMhs46YUqp9EkutCtGs6eCzrjRy6ktvUHcg60RGkrz8lpzc/FHNI3qkC5O/ViUYMgEjWlzMeRPc5GXYmjQFWcpBjQkFK6Sq7J9dN6wscbITdz1EdkFpIxEAnaDsobNjRqhcRqGkOZ2kYMLyPAAI7eb1z1Y7AxJnESrohxMi2qMMvayO4BuzRPNHQR0Mobd2kNgU5UWcT4C841MOzNt/SvYih2MMJwCQeJFN0T9m51o3SwnusV0R4HKGQ2CPeBJIGi1UbqiXtOCMVu6Je1XGIz2FS7BjR/kxzIhaVTwos1z7h/e/bb9dsIu4NYjZvIp0kW4nGqsMMGo5m/OQjgrJNE5gPJPtxFp/IiF/JnDr7EwUkUHmHurq5prBDImxi4mSqlHIXzUHFMmljiUrRErWJGMcXI03JnZyHqZsA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5463df26-b3f0-42f0-f257-08d71b17e58b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 09:16:14.3447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5639
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 07 Aug 2019 09:16:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 07 Aug 2019 09:16:37 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=1151cfe65=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x779GvGo000390
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/3] dm-zoned: improve error handling in
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 07 Aug 2019 09:18:17 +0000 (UTC)

On 2019/08/06 10:06, Dmitry Fomichev wrote:
> There are several places in reclaim code where errors are not
> propagated to the main function, dmz_reclaim(). This function
> is responsible for unlocking zones that might be still locked
> at the end of any failed reclaim iterations. As the result,
> some device zones may be left permanently locked for reclaim,
> degrading target's capability to reclaim zones.
> 
> This patch fixes these issues as follows -
> 
> Make sure that dmz_reclaim_buf(), dmz_reclaim_seq_data() and
> dmz_reclaim_rnd_data() return error codes to the caller.
> 
> dmz_reclaim() function is renamed to dmz_do_reclaim() to avoid
> clashing with "struct dmz_reclaim" and is modified to return the
> error to the caller.
> 
> dmz_get_zone_for_reclaim() now returns an error instead of NULL
> pointer and reclaim code checks for that error.
> 
> Error logging/debug messages are added where necessary.
> 
> Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c |  4 ++--
>  drivers/md/dm-zoned-reclaim.c  | 28 +++++++++++++++++++---------
>  2 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index ded4984d18c9..6b7fbbd735ef 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1543,7 +1543,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>  	struct dm_zone *zone;
>  
>  	if (list_empty(&zmd->map_rnd_list))
> -		return NULL;
> +		return ERR_PTR(-EBUSY);
>  
>  	list_for_each_entry(zone, &zmd->map_rnd_list, link) {
>  		if (dmz_is_buf(zone))
> @@ -1554,7 +1554,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>  			return dzone;
>  	}
>  
> -	return NULL;
> +	return ERR_PTR(-EBUSY);
>  }
>  
>  /*
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 260e3598199e..26e34493a2db 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -216,7 +216,7 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_unlock_flush(zmd);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> @@ -260,7 +260,7 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_unlock_flush(zmd);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> @@ -313,7 +313,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_unlock_flush(zmd);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> @@ -335,7 +335,7 @@ static void dmz_reclaim_empty(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  /*
>   * Find a candidate zone for reclaim and process it.
>   */
> -static void dmz_reclaim(struct dmz_reclaim *zrc)
> +static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	struct dm_zone *dzone;
> @@ -345,8 +345,8 @@ static void dmz_reclaim(struct dmz_reclaim *zrc)
>  
>  	/* Get a data zone */
>  	dzone = dmz_get_zone_for_reclaim(zmd);
> -	if (!dzone)
> -		return;
> +	if (IS_ERR(dzone))
> +		return PTR_ERR(dzone);
>  
>  	start = jiffies;
>  
> @@ -392,13 +392,20 @@ static void dmz_reclaim(struct dmz_reclaim *zrc)
>  out:
>  	if (ret) {
>  		dmz_unlock_zone_reclaim(dzone);
> -		return;
> +		return ret;
>  	}
>  
> -	(void) dmz_flush_metadata(zrc->metadata);
> +	ret = dmz_flush_metadata(zrc->metadata);
> +	if (ret) {
> +		dmz_dev_debug(zrc->dev,
> +			      "Metadata flush for zone %u failed, err %d\n",
> +			      dmz_id(zmd, rzone), ret);
> +		return ret;
> +	}
>  
>  	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
>  		      dmz_id(zmd, rzone), jiffies_to_msecs(jiffies - start));
> +	return 0;
>  }
>  
>  /*
> @@ -443,6 +450,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	unsigned int nr_rnd, nr_unmap_rnd;
>  	unsigned int p_unmap_rnd;
> +	int ret;
>  
>  	if (!dmz_should_reclaim(zrc)) {
>  		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
> @@ -472,7 +480,9 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		      (dmz_target_idle(zrc) ? "Idle" : "Busy"),
>  		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
>  
> -	dmz_reclaim(zrc);
> +	ret = dmz_do_reclaim(zrc);
> +	if (ret)
> +		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
>  
>  	dmz_schedule_reclaim(zrc);
>  }
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
