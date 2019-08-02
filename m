Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092580337
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 01:28:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15A7E81DF1;
	Fri,  2 Aug 2019 23:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E9F1001B02;
	Fri,  2 Aug 2019 23:28:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A73541F53;
	Fri,  2 Aug 2019 23:28:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72NLSkM006533 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 19:21:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E22260925; Fri,  2 Aug 2019 23:21:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E886A60605;
	Fri,  2 Aug 2019 23:21:20 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35D802F8BE1;
	Fri,  2 Aug 2019 23:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1564788071; x=1596324071;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=ASsdlZeU3OfHyMXoDsWjptlmBPqghXmt6oCt1GY13Mc=;
	b=Ad1mMSHMIKxgIyhl7He2BJu5Brfou5u6SJfd6suq57xUs4gv6nw59aCG
	UHilvlcrq4MdMsFyTClasLgqGc3v5qgKeO/mNI9R1Ug1x95q/ufMber22
	mlB7lbpB39zmBstndITksWgjGp/0o1IAJyvlA6Y2mGtcEII55FeNbCcaL
	dcksyG5fkVr4B4pBWcyUF1ymy2MFngvqZFDtMLNFRgjOGyOeUvqTYM7wS
	fnMSXEU8US09Hr4NpYiWVB93oBGZ20AvDu1hiaosf6jumpwCSPhsbOkDr
	027oyn8S0qYyfovHYK9tZ+jQBl8uIS5Zar5Ui5rIvUI9NijkgyZspxEJN Q==;
IronPort-SDR: OflVWi2G35PednKZPAKNTzgVCoB8DkmNpdffYcDpOEadOJAGT0oPH+ohR8Rn9Zg8EpIavSTbtu
	Vp+jcvgdBx3nxm0znEQBDS62HgSRuZuEKQFSk/JhZ7iZ7rwzypL2fff5xJGqWeRHmY41TIiRl4
	p6xwh8c41UAxTPfCYyL1bQ1Qrxyugke7sFMP8fSNieunmnv2jDwdzUgD2z8mYJjH6YW/xm2N3b
	8Grb6sznos32BXUrNgS5WkgM/qL6UHmh5N0TmsfFPqpv1VhHbfvbjlae/z+TP660v6qGSm//BJ
	GYU=
X-IronPort-AV: E=Sophos;i="5.64,340,1559491200"; d="scan'208";a="115837624"
Received: from mail-by2nam03lp2059.outbound.protection.outlook.com (HELO
	NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.59])
	by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2019 07:20:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Za+XqsnaT5XifIMVRxuxWCEnRdIZWC/FbAbfci6+d4wJcDHzPnZEh8AkkRvY4zpXQUy4xO4guMHwN++QqJxpQFLN2Gc7mWqmd+jinPL6sRbrlvTfCqWwp3m24Ju/+h2W25ugrwKV1XowCDmbnDtTsCl03CLpyreKLdLSB/gbe1fTKXk+lTBkoyQph1C5g3T/O/zl/mlr0w3PA4EVdQZM7BOd/+n6u9TMl5ZJpWsHZarqMi+OP4XsI/Cn/Buou17w5sKh5/qpOOJh/Lp1NPMv7uf64grXDHXFuiq52vOxfDBuAJxJk+U6nYeR1pjiFuOxf0wLRhdg/PzoRFIYP1SuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=13SABnhdfj2tVWZskvjdGliPo5CcchnQLhfdEuzUrL0=;
	b=dQWYgcnecCC05ttvVQ7XcT6vgHDD2dU/PrBWDAKPkp7xuvgO6jogm95hVnbZdVUN0/6I498rfFmGnseNXz6ugi/+dTPkH9ZP2kBkVK2/nmM5F5n6yfwUGIOK3zLkusIvGicnLVQnC4j2XdbagWUV6KJ9Dbyj8GQqkXETVwX08J+PFjvjuq3WakrAmmV0FqTJmKuLUDohFRhpqBaHTNxrbyZgN+CQ/hGuTe2LqeSOCo4kPh0N79AmODOA2swPsPPhYrrFZpMkxRXwM2J7WUB3aaA9XMDkE91kTP21B3AA0AYstT5/lfq350XRbcsJGzGOUOkoKCjNDEtMRrlUMBemFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=13SABnhdfj2tVWZskvjdGliPo5CcchnQLhfdEuzUrL0=;
	b=ir//XaapLNxMZMzidT1+hFUI2Fi3FUv3plGBi5zw/grLCdIiKKPIDRdBdBrqsGYvlC9rTOuELeQQdJnO1E19IAVzjbJvSwIiKgs1opSPo+rhek2WIBPnRISg2MWB2UDI5aoRPhAgiTuyIMTPn5xoUtiLwVXdmqlmITkWcS8HzYg=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4279.namprd04.prod.outlook.com (20.176.251.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.10; Fri, 2 Aug 2019 23:20:47 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.010;
	Fri, 2 Aug 2019 23:20:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm-zoned: fix a few typos
Thread-Index: AQHVSX4Liiyf96F/a0OdBeVzdSYXIg==
Date: Fri, 2 Aug 2019 23:20:46 +0000
Message-ID: <BYAPR04MB58160397B744B3D48AB11F9FE7D90@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
	<20190802220251.1217-3-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 515ca35f-c3a8-4dfb-bafb-08d717a00ca8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4279; 
x-ms-traffictypediagnostic: BYAPR04MB4279:
x-microsoft-antispam-prvs: <BYAPR04MB427942D6D032D43D6D6EEAE8E7D90@BYAPR04MB4279.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(6116002)(66066001)(76176011)(66446008)(76116006)(25786009)(478600001)(3846002)(2501003)(14454004)(8936002)(6246003)(9686003)(81166006)(86362001)(53936002)(8676002)(229853002)(55016002)(6436002)(486006)(74316002)(81156014)(305945005)(91956017)(102836004)(66476007)(5660300002)(33656002)(110136005)(99286004)(7736002)(64756008)(476003)(71200400001)(186003)(2906002)(316002)(71190400001)(53546011)(446003)(68736007)(6506007)(7696005)(66556008)(66946007)(450100002)(14444005)(256004)(26005)(52536014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4279;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fjEMnYxZ6K/2vHRzY4jKOjvOvjpGbU+2xuUxxUmqMt2GdgOrjRyw3bqGRnnk+3LMMP3Ew09UngIXr68A0pPJu4MJ8+racYlhoqpRrz2mckx6f1bzXbW2+8Qy+90wQY3Rs4VzEE/sRYCvPQjo5gCOs2nBiBPupqbPkTxnYizU/YsleZS1JWF39wq/yP1vHb7ScPlmpumZp3PGPC+UYu3qyWMJEUgRBSEjOxV1WjmU4VizVdV2ld02urGmb0uFRNkY8inXfGlCV38zdDBpjHdypJ5drTVkr1ZRFxepGhcHxtYPv8s8klONHsSrwAfF0fKEteocUzRnu3mah0fRnQEAVUXPzCQqdgMHUYiiWPjDmixULw3an2tRyyGAtPG7GvkQfS3lsYFA4b2cjH9AZFYWRQzWzu2EdEM2Jpj66B9FdQ0=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515ca35f-c3a8-4dfb-bafb-08d717a00ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 23:20:46.9775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4279
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Fri, 02 Aug 2019 23:21:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 02 Aug 2019 23:21:10 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=110ebdbc6=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x72NLSkM006533
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: fix a few typos
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 02 Aug 2019 23:28:44 +0000 (UTC)

On 2019/08/03 7:02, Dmitry Fomichev wrote:
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 8 ++++----
>  drivers/md/dm-zoned-reclaim.c  | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 23e9a6d9350b..ded4984d18c9 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -35,7 +35,7 @@
>   *    (1) Super block (1 block)
>   *    (2) Chunk mapping table (nr_map_blocks)
>   *    (3) Bitmap blocks (nr_bitmap_blocks)
> - * All metadata blocks are stored in conventional zones, starting from the
> + * All metadata blocks are stored in conventional zones, starting from
>   * the first conventional zone found on disk.
>   */
>  struct dmz_super {
> @@ -234,7 +234,7 @@ void dmz_unlock_map(struct dmz_metadata *zmd)
>   * Lock/unlock metadata access. This is a "read" lock on a semaphore
>   * that prevents metadata flush from running while metadata are being
>   * modified. The actual metadata write mutual exclusion is achieved with
> - * the map lock and zone styate management (active and reclaim state are
> + * the map lock and zone state management (active and reclaim state are
>   * mutually exclusive).
>   */
>  void dmz_lock_metadata(struct dmz_metadata *zmd)
> @@ -1629,7 +1629,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		if (op != REQ_OP_WRITE)
>  			goto out;
>  
> -		/* Alloate a random zone */
> +		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
>  			dmz_wait_for_free_zones(zmd);
> @@ -1726,7 +1726,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	if (bzone)
>  		goto out;
>  
> -	/* Alloate a random zone */
> +	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
>  		dmz_wait_for_free_zones(zmd);
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 387894e2add1..260e3598199e 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -428,7 +428,7 @@ static bool dmz_should_reclaim(struct dmz_reclaim *zrc)
>  		return false;
>  
>  	/*
> -	 * If the percentage of unmappped random zones is low,
> +	 * If the percentage of unmapped random zones is low,
>  	 * reclaim even if the target is busy.
>  	 */
>  	return p_unmap_rnd <= DMZ_RECLAIM_LOW_UNMAP_RND;
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
