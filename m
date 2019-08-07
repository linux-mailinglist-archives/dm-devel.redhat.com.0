Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B6782848A8
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 11:32:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DB4730C62A7;
	Wed,  7 Aug 2019 09:32:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51EB85D9E1;
	Wed,  7 Aug 2019 09:32:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D00501800202;
	Wed,  7 Aug 2019 09:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x779NYf4001291 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 05:23:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27AD65C231; Wed,  7 Aug 2019 09:23:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C394D5C21E;
	Wed,  7 Aug 2019 09:23:29 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E54B79B297;
	Wed,  7 Aug 2019 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565169797; x=1596705797;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=SXKbmo+Nw50xJJa9Y68mgFGM5yOTgL1Yg+vnWloCOYA=;
	b=hm1k7HDAgirPx0mHIrnztAZASQvDJHnjZh66IurItOLfkoTbH8GwKrGv
	je8FQ/2CcmiPLWt/bSnrfQfrtJeaNJqclxZGD3QwQWOMvYjU6tpqLiw/Z
	17MkYJ4EyMizeBDxWhzC+eAYgzvh+gOs/UZ4GeDkA/vR2QZ5JuwpUXW7i
	8CdWyVT+y3p2KBYvJX/oZC0tdnkZzdf5NBu59MwEGbnYhi4r360xRrxu3
	Ax10uzs+LzSMM2t+lCQjuZk8smc//8PljJqV8U8JAiSK51CPUUbFhe14l
	iMf494SF5wzPtv/BMWNOeEGiNw7FcRZR4yywy7gNb3fVB2kpV0kKfP9qm Q==;
IronPort-SDR: 6qlmCsL/sXcPVBi8g8w/S/922tJKgx7bMxJ6uns/mke0My9nWfYxPZHMhXykjtgcwe70lmqtKx
	DnS0Y399ZdZUz5KWZxilvKIH7voGLSGL9Kffd9FlVXVHYYogY4hFbiPs6r3ZLWn4lqOA0/YG61
	l0h+/gfVcDmIpebAI5DJ1kj3v14qLkl/dsGORBH71sbB5rcoWsq1G8ghmQPImKfSM6c39S5x+l
	Jk51e8GzTVbqvCTwYKRoCRwqh/SaF3oa8rChFacSPgQ/ASa15TNfketaHYVr/Q+8/VEt6adc4D
	Z/M=
X-IronPort-AV: E=Sophos;i="5.64,357,1559491200"; d="scan'208";a="119853286"
Received: from mail-co1nam05lp2058.outbound.protection.outlook.com (HELO
	NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.58])
	by ob1.hgst.iphmx.com with ESMTP; 07 Aug 2019 17:22:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=C3Bva7cWrgVVSbd3IFcLADzhYa54c3750ZSALdxcTFiQ7WnotKvdsqOYLnS026RC5UXWvvPIKV/9oaruUtyvydQbYTZCZ9OI4xp54jzRConEMs4FEqbIB+OrbrFhMschTZtL+COBMD1J4Z8+eY3nL1mMB7T9HkdVCt7wKK6NXdYYzJQDklRUWMQZj92FZ8sjz+f0WscwMEnEfTaPHGZdYyRk/D6hPxnz8vMV1JDkzbZgZjrdRDxfr4CcmJFvJ+nfWFo9RfVEjBnKESiudhxle6X8hqoFYKJJE1+ps/wFo2bjrejC6tgCpzhoUHxxZBgzUcS/yyaON/KIebDhLLvRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AVHyrylvVRkqIBlTsF/uBNkyripNxC7vGKpXXV1Bgrc=;
	b=RtO1cgLwPFLBwVDiRJeQyLb+2Gcc6WXvYnqIvWNPhIMEUfoxmxxK7RKUpGb4u9USSUWh29Y388MTETmXt0E960H7UY+BMeDRuDazE8KTmqnhWqf8hwNPbPg9FSrq74lQtlgOgaoZR+7FMuaeBE3+BYBIlAaZnm3xK8H/6mqEcvFK7g9alc0+UTTzrv0nJ27VFq76ISp8vh6zhTEeZcqJ3eJJnAXMIHiOWErfRU2owvZxKUKwrh+r2ODaOBYZ9B6Q5Pl1CaGUSb9+rSh8gq8DbB3VW4LTGU8TBa6jyr/luu+Fg56bjnOXEOsRwG5FX9ndTyipZx/Pfxiukl/tk4DBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AVHyrylvVRkqIBlTsF/uBNkyripNxC7vGKpXXV1Bgrc=;
	b=zioWx8F70nIUxlO+oHH17/HOmE6UOsB0wTqOe5fg+wrsfRTPWB1DjpoixlNuM1yPwGjxfXkL6F501iYqpLM3qiBwpnUQJl/eHt0X7HqHJaRwMSjv7ps44UUl+daq1QqHg9A5hLU6zblUeuH4KKrhuYfQlJxAAKo/9hRbgWkMTW4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB5639.namprd04.prod.outlook.com (20.179.56.149) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.15; Wed, 7 Aug 2019 09:22:53 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 09:22:53 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 3/3] dm-zoned: properly handle backing device failure
Thread-Index: AQHVS/Mwa+M3kJcCYEqUumYVtqtlbQ==
Date: Wed, 7 Aug 2019 09:22:53 +0000
Message-ID: <BYAPR04MB58161DAE3EB6B54E67B068A5E7D40@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
	<20190806010625.27503-4-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55617a5d-f60c-4686-c42c-08d71b18d35c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB5639; 
x-ms-traffictypediagnostic: BYAPR04MB5639:
x-microsoft-antispam-prvs: <BYAPR04MB563912EA86C7F345D9675A54E7D40@BYAPR04MB5639.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:167;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(66556008)(66946007)(229853002)(2501003)(66476007)(76116006)(3846002)(86362001)(91956017)(8936002)(33656002)(74316002)(66446008)(76176011)(2906002)(8676002)(305945005)(6116002)(81166006)(81156014)(14454004)(64756008)(53546011)(6506007)(7736002)(9686003)(55016002)(316002)(25786009)(99286004)(186003)(486006)(110136005)(6436002)(476003)(53936002)(68736007)(30864003)(446003)(6246003)(52536014)(26005)(478600001)(450100002)(7696005)(102836004)(71200400001)(5660300002)(14444005)(256004)(71190400001)(66066001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5639;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z7bttP/lsDiRmpscX5DpYrK5KghnyLfAL5OM95GmIhzTyOeb4DrY7Plh3JFFV0m9dXArqLdFVdmbsBkprvTfey40ugRP3pXNCRPaZXDGTtU2KeoSMNjdPz74R+QDEJK6T8EykJiul61s1SAzzHJWzA/SFoK72iD7Fi1rXeitCnFhUXPY5cTo8WmqXTfeu9XoY0mNPCFec6vdjEuTZKPYaY7qmhnHoN9D2zohfPK2LNg0pUvfZRCvGBrPE56XWRs0ic6wqipbHzxCYsMbDOTtCW+N503F985I1E9Hf95/7qREIHY8at3rR+bg6mDdmF9I6ls2B2lbZt4azEqTbS31zxNUSUWYodQuhNHwKlUfCLSLK1RRr9opmNpV1Lr97LUAcBxdUh+NVrYkpbe7x20TEwx+ktJcRVfvItkivkxha1I=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55617a5d-f60c-4686-c42c-08d71b18d35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 09:22:53.3942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5639
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Wed, 07 Aug 2019 09:23:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 07 Aug 2019 09:23:17 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com
	216.71.153.141 esa3.hgst.iphmx.com
	<prvs=1151cfe65=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x779NYf4001291
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 3/3] dm-zoned: properly handle backing device
	failure
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 07 Aug 2019 09:32:03 +0000 (UTC)

On 2019/08/06 10:06, Dmitry Fomichev wrote:
> dm-zoned is observed to lock up or livelock in case of hardware
> failure or some misconfiguration of the backing zoned device.
> 
> This patch adds a new function in the target code that checks the
> status of the backing device request queue. If it goes to dying state,
> the health check code marks dm-zoned DM target read-only and begins

...target read-only and dying and beignins...

Marking the target as read-only seems useless though since *all* incoming
requests are rejected with DM_MAPIO_KILL for a dying device, including read
requests. So we can remove the set_disk_ro() call I think.

> to reject any further incoming I/O. In order to timely detect backing
> device failure, this new function is called in the request mapping
> path, at the beginning of every reclaim run and before performing any
> metadata I/O.
> 
> The proper way out of this situation is to do
> 
> dmsetup remove <dm-zoned target>
> 
> and recreate the target when the problem with the backing device
> is resolved.
> 
> Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 51 +++++++++++++++++++++++++++-------
>  drivers/md/dm-zoned-reclaim.c  | 18 ++++++++++--
>  drivers/md/dm-zoned-target.c   | 50 +++++++++++++++++++++++++++++++--
>  drivers/md/dm-zoned.h          | 10 +++++++
>  4 files changed, 115 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 6b7fbbd735ef..2a5bc51fd6d5 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -403,15 +403,18 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
>  	struct bio *bio;
>  
> +	if (dmz_bdev_is_dying(zmd->dev))
> +		return ERR_PTR(-EIO);
> +
>  	/* Get a new block and a BIO to read it */
>  	mblk = dmz_alloc_mblock(zmd, mblk_no);
>  	if (!mblk)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  
>  	bio = bio_alloc(GFP_NOIO, 1);
>  	if (!bio) {
>  		dmz_free_mblock(zmd, mblk);
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	spin_lock(&zmd->mblk_lock);
> @@ -542,8 +545,8 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
>  	if (!mblk) {
>  		/* Cache miss: read the block from disk */
>  		mblk = dmz_get_mblock_slow(zmd, mblk_no);
> -		if (!mblk)
> -			return ERR_PTR(-ENOMEM);
> +		if (IS_ERR(mblk))
> +			return mblk;
>  	}
>  
>  	/* Wait for on-going read I/O and check for error */
> @@ -571,16 +574,19 @@ static void dmz_dirty_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk)
>  /*
>   * Issue a metadata block write BIO.
>   */
> -static void dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
> -			     unsigned int set)
> +static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
> +			    unsigned int set)
>  {
>  	sector_t block = zmd->sb[set].block + mblk->no;
>  	struct bio *bio;
>  
> +	if (dmz_bdev_is_dying(zmd->dev))
> +		return -EIO;
> +
>  	bio = bio_alloc(GFP_NOIO, 1);
>  	if (!bio) {
>  		set_bit(DMZ_META_ERROR, &mblk->state);
> -		return;
> +		return -ENOMEM;
>  	}
>  
>  	set_bit(DMZ_META_WRITING, &mblk->state);
> @@ -592,6 +598,8 @@ static void dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
>  	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
>  	submit_bio(bio);
> +
> +	return 0;
>  }
>  
>  /*
> @@ -603,6 +611,9 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  	struct bio *bio;
>  	int ret;
>  
> +	if (dmz_bdev_is_dying(zmd->dev))
> +		return -EIO;
> +
>  	bio = bio_alloc(GFP_NOIO, 1);
>  	if (!bio)
>  		return -ENOMEM;
> @@ -660,22 +671,29 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
>  {
>  	struct dmz_mblock *mblk;
>  	struct blk_plug plug;
> -	int ret = 0;
> +	int ret = 0, nr_mblks_submitted = 0;
>  
>  	/* Issue writes */
>  	blk_start_plug(&plug);
> -	list_for_each_entry(mblk, write_list, link)
> -		dmz_write_mblock(zmd, mblk, set);
> +	list_for_each_entry(mblk, write_list, link) {
> +		ret = dmz_write_mblock(zmd, mblk, set);
> +		if (ret)
> +			break;
> +		nr_mblks_submitted++;
> +	}
>  	blk_finish_plug(&plug);
>  
>  	/* Wait for completion */
>  	list_for_each_entry(mblk, write_list, link) {
> +		if (!nr_mblks_submitted)
> +			break;
>  		wait_on_bit_io(&mblk->state, DMZ_META_WRITING,
>  			       TASK_UNINTERRUPTIBLE);
>  		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  			clear_bit(DMZ_META_ERROR, &mblk->state);
>  			ret = -EIO;
>  		}
> +		nr_mblks_submitted--;
>  	}
>  
>  	/* Flush drive cache (this will also sync data) */
> @@ -737,6 +755,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	 */
>  	dmz_lock_flush(zmd);
>  
> +	if (dmz_bdev_is_dying(zmd->dev)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
>  	/* Get dirty blocks */
>  	spin_lock(&zmd->mblk_lock);
>  	list_splice_init(&zmd->mblk_dirty_list, &write_list);
> @@ -1632,6 +1655,10 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
> +			if (dmz_bdev_is_dying(zmd->dev)) {
> +				dzone = ERR_PTR(-EIO);
> +				goto out;
> +			}
>  			dmz_wait_for_free_zones(zmd);
>  			goto again;
>  		}
> @@ -1729,6 +1756,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
> +		if (dmz_bdev_is_dying(zmd->dev)) {
> +			bzone = ERR_PTR(-EIO);
> +			goto out;
> +		}
>  		dmz_wait_for_free_zones(zmd);
>  		goto again;
>  	}
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 26e34493a2db..d240d7ca8a8a 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -38,7 +38,7 @@ enum {
>  /*
>   * Number of seconds of target BIO inactivity to consider the target idle.
>   */
> -#define DMZ_IDLE_PERIOD		(10UL * HZ)
> +#define DMZ_IDLE_PERIOD			(10UL * HZ)
>  
>  /*
>   * Percentage of unmapped (free) random zones below which reclaim starts
> @@ -135,6 +135,9 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>  
>  	while (block < end_block) {
> +		if (dev->flags & DMZ_BDEV_DYING)
> +			return -EIO;
> +
>  		/* Get a valid region from the source zone */
>  		ret = dmz_first_valid_block(zmd, src_zone, &block);
>  		if (ret <= 0)
> @@ -452,6 +455,9 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	unsigned int p_unmap_rnd;
>  	int ret;
>  
> +	if (dmz_bdev_is_dying(zrc->dev))
> +		return;
> +
>  	if (!dmz_should_reclaim(zrc)) {
>  		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
>  		return;
> @@ -481,8 +487,16 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
>  
>  	ret = dmz_do_reclaim(zrc);
> -	if (ret)
> +	if (ret) {
>  		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
> +		if (ret == -EIO)
> +			/*
> +			 * LLD might be performing some error handling sequence
> +			 * at the underlying device. To not interfere, do not
> +			 * attempt to schedule the next reclaim run immediately.
> +			 */
> +			return;
> +	}
>  
>  	dmz_schedule_reclaim(zrc);
>  }
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index c1992034c099..c40c18f7fd64 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -134,6 +134,8 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
>  
>  	refcount_inc(&bioctx->ref);
>  	generic_make_request(clone);
> +	if (clone->bi_status == BLK_STS_IOERR)
> +		return -EIO;
>  
>  	if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
>  		zone->wp_block += nr_blocks;
> @@ -278,8 +280,8 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  
>  	/* Get the buffer zone. One will be allocated if needed */
>  	bzone = dmz_get_chunk_buffer(zmd, zone);
> -	if (!bzone)
> -		return -ENOSPC;
> +	if (IS_ERR(bzone))
> +		return PTR_ERR(bzone);
>  
>  	if (dmz_is_readonly(bzone))
>  		return -EROFS;
> @@ -390,6 +392,11 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	dmz_lock_metadata(zmd);
>  
> +	if (dmz->dev->flags & DMZ_BDEV_DYING) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
>  	/*
>  	 * Get the data zone mapping the chunk. There may be no
>  	 * mapping for read and discard. If a mapping is obtained,
> @@ -494,6 +501,8 @@ static void dmz_flush_work(struct work_struct *work)
>  
>  	/* Flush dirty metadata blocks */
>  	ret = dmz_flush_metadata(dmz->metadata);
> +	if (ret)
> +		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
>  
>  	/* Process queued flush requests */
>  	while (1) {
> @@ -557,6 +566,37 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  	return ret;
>  }
>  
> +/*
> + * Check the backing device availability. If it's on the way out,
> + * start failing I/O. Reclaim and metadata components also call this
> + * function to cleanly abort operation in the event of such failure.
> + */
> +bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev)
> +{
> +	struct gendisk *disk;
> +	bool dying = dmz_dev->flags & DMZ_BDEV_DYING;
> +
> +	if (!dying) {
> +		disk = dmz_dev->bdev->bd_disk;
> +		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
> +			dmz_dev_warn(dmz_dev, "Backing device queue dying");
> +			dying = true;
> +		} else if (disk->fops->check_events) {
> +			if (disk->fops->check_events(disk, 0) &
> +					DISK_EVENT_MEDIA_CHANGE) {
> +				dmz_dev_warn(dmz_dev, "Backing device offline");
> +				dying = true;
> +			}
> +		}
> +		if (dying) {
> +			dmz_dev->flags |= DMZ_BDEV_DYING;
> +			set_disk_ro(dmz_dev->bdev->bd_disk, 1);
> +		}
> +	}
> +
> +	return dying;
> +}
> +
>  /*
>   * Process a new BIO.
>   */
> @@ -570,6 +610,9 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	sector_t chunk_sector;
>  	int ret;
>  
> +	if (dmz_bdev_is_dying(dmz->dev))
> +		return DM_MAPIO_KILL;
> +
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
>  		      bio_op(bio), (unsigned long long)sector, nr_sectors,
>  		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> @@ -866,6 +909,9 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
>  
> +	if (dmz_bdev_is_dying(dmz->dev))
> +		return -ENODEV;
> +
>  	*bdev = dmz->dev->bdev;
>  
>  	return 0;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 1a3b06de2c00..d8e70b0ade35 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -57,6 +57,8 @@ struct dmz_dev {
>  
>  	unsigned int		nr_zones;
>  
> +	unsigned int		flags;
> +
>  	sector_t		zone_nr_sectors;
>  	unsigned int		zone_nr_sectors_shift;
>  
> @@ -68,6 +70,9 @@ struct dmz_dev {
>  				 (dev)->zone_nr_sectors_shift)
>  #define dmz_chunk_block(dev, b)	((b) & ((dev)->zone_nr_blocks - 1))
>  
> +/* Device flags. */
> +#define DMZ_BDEV_DYING		(1 << 0)
> +
>  /*
>   * Zone descriptor.
>   */
> @@ -246,4 +251,9 @@ void dmz_resume_reclaim(struct dmz_reclaim *zrc);
>  void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc);
>  void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
>  
> +/*
> + * Functions defined in dm-zoned-target.c
> + */
> +bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
> +
>  #endif /* DM_ZONED_H */
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
