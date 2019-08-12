Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCE8A675
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 20:44:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23C233093435;
	Mon, 12 Aug 2019 18:44:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED22C4142;
	Mon, 12 Aug 2019 18:44:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A78A2551C;
	Mon, 12 Aug 2019 18:44:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CIi1ja000671 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 14:44:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB0E57D4D4; Mon, 12 Aug 2019 18:44:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 743634142;
	Mon, 12 Aug 2019 18:43:57 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15C20811BF;
	Mon, 12 Aug 2019 18:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565635425; x=1597171425;
	h=from:to:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=sgf9vWfSHhLUcMDrgAj19qNI8qFM0sF+YE0pRQboMEQ=;
	b=InyzXWeXVEpMQbPew47aj2zmxaWmTtfU0/Mqio3iJ1/cgjqrcnubMJ/i
	7gLI9b3aVNGMdEvYe6+dpaPjn1wCkdokwPDAcgxaJdDjA5nKCAsq+TB5L
	eS06MvGsU5+DPJ/0dnEsG1vpvycjV+PwdXU4WsNlt6Rbx45frfmpJFjcw
	fRhLD8euT4olFp9hA3Fl799gK3D/5CD2lysDPccvV8MPen90wNJdCuPSY
	rnDUeVN9bGYtbyxIHu2nBE4ujp2Ss6TdQ4HDzDyPaxyxdBTX3NSjkDrac
	9itXidYLtnDXDM6bWHbFzx3C5uyMgPC8sjeQrErHQai0SHKaxw87HPM19 Q==;
IronPort-SDR: ZDSEgs8eYvpIEPH+lKRKg3xGnLCHFW8IQ73S37ntfSbMBtPn5V4ySlRDkzX1PMPWzuDLV5lF+t
	DUGteAqCyKX/F/qiGZo8Ecjif5+v+ePuKu2szNdVGn4H0HOyeRqXpmUE5L2F50RhGcf9jk/k07
	rBNIVmz4YTavTgGetvPDvkSd4r4IbLl8d7Qe4+/VTgz1QiU1zPsBK29sPFCxWF7ncRvRzsUy/J
	ZJPOBtWP4hN2aSgCmOFjEqhiT0a/BzONIsMCLTpK6l4rqNgMW4DhGKvvBYVJmCiAz87cnximqw
	m4c=
X-IronPort-AV: E=Sophos;i="5.64,378,1559491200"; d="scan'208";a="115667415"
Received: from mail-bn3nam01lp2050.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.50])
	by ob1.hgst.iphmx.com with ESMTP; 13 Aug 2019 02:43:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=kLWw7jlNxRLzf8ubr8ac6Cic2Lp6NnklEv+GFptrkF2Db3hbAtB2NZ1m5CbaErjLSELIL+P+iCavFE3H6hCO2oA0vsm/1Iv8WUDKD1Lj2msWolubNV9/EWZ3OVhJs+2E2DRkkMpkonei7tN75nbwjZTC1P2B/LKaomun3V/c6I8YXXGXUhOJBAY4uijU12qzq73CKWTxmFQh2MPXXTGtpvJqeuNY//g0BzgVhzPzV+4sP+7GIdgkygKzuxqJBQSiG8VultDHijJqcq34AfjPjiLeITosdHEDDivEKiOITGe5uec/Dwf6WdNT3GuyXt4KNBkAXYNu09/AwcX2rMszNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hjm1Y2xA32Wra36aduc7gG2hZR5jxWkXhynIvOwJ2l4=;
	b=Jmox1hgvDyBRolVBfdzCdINOSoUTpzwkN8iyBtpXOYKto+blvkeAYwSxthCK495p12YdFqe63DXlW02ETfAYlUCP8J+foCOBSdpfOCk3WpSKE7S6SmlWqhzRbCnDnOJtSJVu1vb0M0sNY1VaxOUsYkAotSCQ96y3yq3zTprFL+x6b857J5QS5PmSm9IxuGOX4N6D/gJNVChSS4vG4ws8nqjp2f01Hi5TH6Y8+pGNX2JkjFSaOIDBBm1lwl/o5GwK++JMbpv+qn6tz1aypHQ022bi+nYXAUc3XH7XdmYnyag95AfSxB2FEZgmrDhFaTxjsJiGwFGL9AB+CH1mtWMHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hjm1Y2xA32Wra36aduc7gG2hZR5jxWkXhynIvOwJ2l4=;
	b=U3ylfjs0fcKa5S5j8kmCj+nO+KeqdMd7U/o5AmtlN5+Fc0rPm1+xMJF6svH2Wl1FxTviCXHK5FLd49ti6TR1+1iQMsBIAo1LRyHKs0fNEKam0dbl5x6ueccS5GnmFs1JKCDZGr8iXo7h7qx+utVE6Otc7wdRtD4ZdRTqKNQuSuM=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
	BYAPR04MB4230.namprd04.prod.outlook.com (20.176.250.155) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.15; Mon, 12 Aug 2019 18:43:21 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::a538:afd0:d62a:55bc]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::a538:afd0:d62a:55bc%7]) with mapi id 15.20.2157.020;
	Mon, 12 Aug 2019 18:43:21 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH v2 3/3] dm-zoned: properly handle backing device failure
Thread-Index: AQHVT8SeiPvdC0qIP0SKLA7MrFcKjQ==
Date: Mon, 12 Aug 2019 18:43:21 +0000
Message-ID: <BYAPR04MB581640DAF32127B3E13690B3E7D30@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
	<20190810214311.9503-4-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53c16327-53d7-4e49-6ee2-08d71f54f369
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4230; 
x-ms-traffictypediagnostic: BYAPR04MB4230:
x-microsoft-antispam-prvs: <BYAPR04MB4230592A1386D5D18AEE85A9E7D30@BYAPR04MB4230.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(55016002)(486006)(102836004)(71190400001)(81156014)(229853002)(6436002)(2501003)(76116006)(8676002)(53546011)(256004)(66476007)(64756008)(71200400001)(66556008)(6506007)(3846002)(66446008)(66066001)(66946007)(186003)(26005)(478600001)(6246003)(14444005)(81166006)(52536014)(5660300002)(76176011)(476003)(99286004)(8936002)(2906002)(25786009)(305945005)(446003)(7736002)(33656002)(450100002)(7696005)(6116002)(14454004)(9686003)(30864003)(110136005)(316002)(74316002)(86362001)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4230;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LZT+lZDriVke9DaAcIwDjRQTEpiyh6gg7ErnsG+XWNM96pAyF3VivxNiN0uCML0wn63h3f6mSWzoJbLDAzt8zBjOBwfm4wolED4X0F6i9KYD/KZFAbmoroQPwxq3UPgVhGMKqjT6OQ4WqYcgmRj0dxb7vJVn5sD6F+omBt/YlynR90WJtBRp+mu2YbfDSi4xy7CyOo2tWYsKQ39d0T4Uo+71wxtWhuMfh4Lyl/6qCTvIMeXGD1LvIeqnuANr6fBdlKACK16sbGlyqYmkfr0B1t4N/SAxoMQ9ZAKstJ7Fe/Zy9wrjL0n4vf0te9bExDNOvTeLHSnje7LvjFe9ZBzKuXj4DRjwMVS4IyGMzVSVcIz67qSguEw2O6PER1Sgh+1JfxDWi/l71y6M7ekK+jjtwsV1fPbZTDjp+K1wKZf7Zr8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c16327-53d7-4e49-6ee2-08d71f54f369
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 18:43:21.7101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZBw4E037Yhanf6ZyYED5WFkit2hOxlj/LtKjZiutYQKlVLpGtpTf4AWtWGF/ByLVwOpX745Ztj7fSGplAPzZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4230
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 12 Aug 2019 18:43:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 12 Aug 2019 18:43:45 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com
	216.71.154.42 esa4.hgst.iphmx.com
	<prvs=12020dc89=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7CIi1ja000671
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 3/3] dm-zoned: properly handle backing
	device failure
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 12 Aug 2019 18:44:29 +0000 (UTC)

On 2019/08/10 14:43, Dmitry Fomichev wrote:
> dm-zoned is observed to lock up or livelock in case of hardware
> failure or some misconfiguration of the backing zoned device.
> 
> This patch adds a new dm-zoned target function that checks the status of
> the backing device. If the request queue of the backing device is found
> to be in dying state or the SCSI backing device enters offline state,
> the health check code sets a dm-zoned target flag prompting all further
> incoming I/O to be rejected. In order to detect backing device failures
> timely, this new function is called in the request mapping path, at the
> beginning of every reclaim run and before performing any metadata I/O.
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
>  drivers/md/dm-zoned-target.c   | 45 ++++++++++++++++++++++++++++--
>  drivers/md/dm-zoned.h          | 10 +++++++
>  4 files changed, 110 insertions(+), 14 deletions(-)
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
> index c1992034c099..31478fef6032 100644
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
> @@ -557,6 +566,32 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
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
> +
> +	if (!(dmz_dev->flags & DMZ_BDEV_DYING)) {
> +		disk = dmz_dev->bdev->bd_disk;
> +		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
> +			dmz_dev_warn(dmz_dev, "Backing device queue dying");
> +			dmz_dev->flags |= DMZ_BDEV_DYING;
> +		} else if (disk->fops->check_events) {
> +			if (disk->fops->check_events(disk, 0) &
> +					DISK_EVENT_MEDIA_CHANGE) {
> +				dmz_dev_warn(dmz_dev, "Backing device offline");
> +				dmz_dev->flags |= DMZ_BDEV_DYING;
> +			}
> +		}
> +	}
> +
> +	return dmz_dev->flags & DMZ_BDEV_DYING;
> +}
> +
>  /*
>   * Process a new BIO.
>   */
> @@ -570,6 +605,9 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	sector_t chunk_sector;
>  	int ret;
>  
> +	if (dmz_bdev_is_dying(dmz->dev))
> +		return DM_MAPIO_KILL;
> +
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
>  		      bio_op(bio), (unsigned long long)sector, nr_sectors,
>  		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> @@ -866,6 +904,9 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
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

Looks good. For this patch and the entire series:

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
