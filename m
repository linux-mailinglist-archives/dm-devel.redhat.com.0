Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530F84883
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 11:18:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07B1E8FAB9;
	Wed,  7 Aug 2019 09:18:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C177A26186;
	Wed,  7 Aug 2019 09:18:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50D0F180B536;
	Wed,  7 Aug 2019 09:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x779I21G000433 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 05:18:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 82CEF1D0; Wed,  7 Aug 2019 09:18:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21775DAA0;
	Wed,  7 Aug 2019 09:17:57 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2BAD8F4EB;
	Wed,  7 Aug 2019 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565169465; x=1596705465;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=eRfGmUP0HVS4dBVAzweQrdxRO8SRSBpni8SyhImdMQU=;
	b=qjK/fIwCNRnOES9s17T6krgOVT2Z3aCeg20Vk7LkihtczO18KnOS96Wd
	bfCPpzrdjwGHQCV7+elaNWDVUX2G5wjy4S1FNYcuXKBOmNRPlmW3MxnXs
	cJsxOOlh2cJamgydvo++D/PWaw8hY7AQozDyfwTC1AXAucBYRsdW6WMj8
	L4S/GubupRoVHRLBea76ttx/2pNm5w9OKEy/vvyc4JpFmHw34ndTzNYCZ
	f6KVR0WmRFPdfOtj4KQMC9+cMTXoTbNZjzWV2NsrNq7l4E1NFx4sQlHdX
	7h4fPiEmL+VeOlHbQE97gn8WlFUJ6iWj/0jPDp0JCdHdsMdY1am7jdjTq A==;
IronPort-SDR: 4vfVZJbM5l2b8ADzmNwgbelbcUKMFsq6VeeP8CWQfkMgQver2KZDVrrgh1qo9i8cMMVWQ0moch
	BvwcEluxSFaoD21iVuXU24MId40tsRg4uchLY6MrgkRbfd6gF638IXbijGBpBdh7Ne2M6tHXT+
	j6HSteTVCuJy8Mnl9pWSQ+l6TR36QPUMmEomb2B8hI+V4QvuFYTnw3OMscnAqKcnALCYwYUYg+
	xmNut0HZ94bo4oRJlbNV48gC+Z/DJlVIHsGF0JfLPHG33DlTGqURWMZKM16OUrxro6Zju61KNE
	D+M=
X-IronPort-AV: E=Sophos;i="5.64,357,1559491200"; d="scan'208";a="116829893"
Received: from mail-bn3nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.57])
	by ob1.hgst.iphmx.com with ESMTP; 07 Aug 2019 17:17:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=YyVKSO3HrjVWAoFQ+zsuzvRLsABvRdH84y/UZRqXtuhLDzFadQ4jKYJv2zxAnoz3XqGeYvNULcVQtaGtWNFehrmZoK7x9GgyGoN1IfkcSvw1tdWGnp6T52WJakIRlhy1quFZwJVH38TbYOea3zCK3RdaDA/CzQ1iLkMoKuh7YyOkEy2KoCABNhwpaXncawzDaxrzrI3XPr/Exj772/lx8y1VmGGkoG36TftTjUhfhh4+jm5B20KWaS4yu5VcUW+zAllHRvns4OgRr1KcUJfTt/Yl5Jiz3rFYDNWpkWd7GHn+q/rI2vE86LQLwvLXwOrzlpwKfDVDJvsQCbLEQlpO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sRd0EF1Sugwe/DXwth1E6A6Rc/4I0YuIHGSZwZo2uN4=;
	b=gTYHFC4O+OktbO1z/DsMxHslLMFZIXDo7WZ5ZQyferScrapzPm/zyeMWvGbrNGfVdwSX3snqFOt55cOqlxO/zAMThTopapDeSOqBBGtnUFi3Z4a0ouUe3Q6SqUvQ+vKAgeF581Q0PrMIhv5+09PymlPTJGvn+hfYZyL4UXC3Q1bE8S9w9bB2ITjwqk225xoN8N+JHfYuO1eR9q9sUst60Y0fW55mu4VXLQtthd48zXVjnDWIIMygH/1cVzICoXj3/v7eMlv9bJ5uSsgnJHHD4ap3ULMVbwUh0csgnUUa7SOGiNc7SrsbB/2r1hQsKwF5RIGNly6Ksl04xW+cQQRU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sRd0EF1Sugwe/DXwth1E6A6Rc/4I0YuIHGSZwZo2uN4=;
	b=gIAW+nOqf8T6Z2+FPLQnVhSDJhzsmPdkHgS/x/1zTmYWWuUDGQQiBeFIgiiDUNcw7Bt62AHiJXADFulR3kWzmHJOagKNOuarcKLqwCtSE60H8sHZJXzkASBQuyBu+D8lKE2OeAWaaFs3rft3AK7cVlFoWfEXS3PiJHCOAHSsd5k=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5639.namprd04.prod.outlook.com (20.179.56.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.15; Wed, 7 Aug 2019 09:17:22 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 09:17:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/3] dm-zoned: improve error handling in i/o map code
Thread-Index: AQHVS/Mw7g3+WkpXrk61WfY9QHLSkw==
Date: Wed, 7 Aug 2019 09:17:22 +0000
Message-ID: <BYAPR04MB5816D8422527943E3D4F4BE7E7D40@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
	<20190806010625.27503-3-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e243817d-d353-441b-49ea-08d71b180e30
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5639; 
x-ms-traffictypediagnostic: BYAPR04MB5639:
x-microsoft-antispam-prvs: <BYAPR04MB56399BDCF84DE06B4A976F1AE7D40@BYAPR04MB5639.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(66556008)(66946007)(229853002)(2501003)(66476007)(76116006)(3846002)(86362001)(91956017)(8936002)(33656002)(74316002)(66446008)(76176011)(2906002)(8676002)(305945005)(6116002)(81166006)(81156014)(14454004)(64756008)(53546011)(6506007)(7736002)(9686003)(55016002)(316002)(25786009)(99286004)(186003)(486006)(110136005)(6436002)(476003)(53936002)(68736007)(446003)(6246003)(52536014)(26005)(478600001)(450100002)(7696005)(102836004)(71200400001)(5660300002)(14444005)(256004)(71190400001)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5639;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8H7uG2dXDkp+5c1LyoIThKuLVjsc+vjJ+UVm8i+PQBI9I8/mMBl9HnWIB8RDb0l+9d2dzzT6IPeZlKMgOA9wUsAtEdSUecqHPVH/NX2sbuDeS0tK40YmHCkvl2cT3tfa7YM1nKtkEl3Ow4lF5JJh+IsV3ppac1pKNCsvGphWYECc2uFudqc3NZq5GUFKer4TBY4boiOukGQgHoBmKtAmaLwEQ12n20xCEAbGq8d3TftNt0aZ/TW7bn61vyxbTxTSkEFedPwhR8PvPT6NRwCPIVqR8ETeGuM0q1mPbXDbu5KGUtMSjbNivs+9Rk83q2JUByByzn/vTqB/eQ+dQleqp1OgFJ4NjHnOXXABUHp1TsJzDFEF8l1ts9+y2V4amzVMS+gs2jLK0EMDcz5I4FYeuNcp+gFxfb4GWAlvqcD/7Y4=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e243817d-d353-441b-49ea-08d71b180e30
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 09:17:22.5956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5639
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Wed, 07 Aug 2019 09:17:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 07 Aug 2019 09:17:45 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=1151cfe65=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x779I21G000433
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/3] dm-zoned: improve error handling in i/o
	map code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 07 Aug 2019 09:18:23 +0000 (UTC)

On 2019/08/06 10:06, Dmitry Fomichev wrote:
> Some errors are ignored in the I/O path during queueing chunks
> for processing by chunk works. Since at least these errors are
> transient in nature, it should be possible to retry the failed
> incoming commands.
> 
> The fix -
> 
> Errors that can happen while queueing chunks are carried upwards
> to the main mapping function and it now returns DM_MAPIO_REQUEUE
> for any incoming requests that can not be properly queued.
> 
> Error logging/debug messages are added where needed.
> 
> Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-target.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 1bf6e6eebee1..c1992034c099 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -514,22 +514,24 @@ static void dmz_flush_work(struct work_struct *work)
>   * Get a chunk work and start it to process a new BIO.
>   * If the BIO chunk has no work yet, create one.
>   */
> -static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
> +static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  {
>  	unsigned int chunk = dmz_bio_chunk(dmz->dev, bio);
>  	struct dm_chunk_work *cw;
> +	int ret = 0;
>  
>  	mutex_lock(&dmz->chunk_lock);
>  
>  	/* Get the BIO chunk work. If one is not active yet, create one */
>  	cw = radix_tree_lookup(&dmz->chunk_rxtree, chunk);
>  	if (!cw) {
> -		int ret;
>  
>  		/* Create a new chunk work */
>  		cw = kmalloc(sizeof(struct dm_chunk_work), GFP_NOIO);
> -		if (!cw)
> +		if (unlikely(!cw)) {
> +			ret = -ENOMEM;
>  			goto out;
> +		}
>  
>  		INIT_WORK(&cw->work, dmz_chunk_work);
>  		refcount_set(&cw->refcount, 0);
> @@ -540,7 +542,6 @@ static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  		ret = radix_tree_insert(&dmz->chunk_rxtree, chunk, cw);
>  		if (unlikely(ret)) {
>  			kfree(cw);
> -			cw = NULL;
>  			goto out;
>  		}
>  	}
> @@ -548,10 +549,12 @@ static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  	bio_list_add(&cw->bio_list, bio);
>  	dmz_get_chunk_work(cw);
>  
> +	dmz_reclaim_bio_acc(dmz->reclaim);
>  	if (queue_work(dmz->chunk_wq, &cw->work))
>  		dmz_get_chunk_work(cw);
>  out:
>  	mutex_unlock(&dmz->chunk_lock);
> +	return ret;
>  }
>  
>  /*
> @@ -565,6 +568,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	sector_t sector = bio->bi_iter.bi_sector;
>  	unsigned int nr_sectors = bio_sectors(bio);
>  	sector_t chunk_sector;
> +	int ret;
>  
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
>  		      bio_op(bio), (unsigned long long)sector, nr_sectors,
> @@ -602,8 +606,14 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  		dm_accept_partial_bio(bio, dev->zone_nr_sectors - chunk_sector);
>  
>  	/* Now ready to handle this BIO */
> -	dmz_reclaim_bio_acc(dmz->reclaim);
> -	dmz_queue_chunk_work(dmz, bio);
> +	ret = dmz_queue_chunk_work(dmz, bio);
> +	if (ret) {
> +		dmz_dev_debug(dmz->dev,
> +			      "BIO op %d, can't process chunk %llu, err %i\n",
> +			      bio_op(bio), (u64)dmz_bio_chunk(dmz->dev, bio),
> +			      ret);
> +		return DM_MAPIO_REQUEUE;
> +	}
>  
>  	return DM_MAPIO_SUBMITTED;
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
