Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9685C1E966B
	for <lists+dm-devel@lfdr.de>; Sun, 31 May 2020 10:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590915515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q6wrT+xZ7xzDEV4NXtI8MRnQkxbHgVKJeladFxIL21s=;
	b=fz9NLUHB3WiUXiiigMxlr+aXmQoxj3ht/F5S99/DgCkRgM0t2lZGfB1Jw75XPhkGF95E4b
	FhCed98GMoRN4UULCTowm/aDL2hDbekPQZdpidlXcHkPwgeGNlL2hbu5Hfa4FYVFIQumHW
	c3kb4vkzV+nfEu50DaAZKb6Tx+FU27s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-MZu8pP3OM0q1HfWtimXlnA-1; Sun, 31 May 2020 04:58:33 -0400
X-MC-Unique: MZu8pP3OM0q1HfWtimXlnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E531D461;
	Sun, 31 May 2020 08:58:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32AC119934;
	Sun, 31 May 2020 08:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F4B41809543;
	Sun, 31 May 2020 08:58:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04V8wJAi030604 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 04:58:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 900E413D6FD; Sun, 31 May 2020 08:58:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 204F113D705
	for <dm-devel@redhat.com>; Sun, 31 May 2020 08:58:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D8791024D00
	for <dm-devel@redhat.com>; Sun, 31 May 2020 08:58:11 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-270-mIIHrql2MJmD6yMBP2_nqw-1; Sun, 31 May 2020 04:58:08 -0400
X-MC-Unique: mIIHrql2MJmD6yMBP2_nqw-1
IronPort-SDR: hgSV4E+YhmZkqEUXVDv0qM8Txyw6kkLQQIw+SVpOfoc9wX+u4TDCvz6CvQ/7egXwnS8Jd2axah
	aFgTr3Mx31JryXfeEBO7P9Tt0z9atshWWq+7ia2gAoLci4OwrCitedP1yh9DloACl0RxStImH9
	cBP+ALMjpt+fdKqA1a2vL41O2eFeYIGrhuG0xRJFkd5A3esRgBZ0Gb0/elX+nD3dqmIDV1lCuc
	JpJEjpTa03RU2/Zc7sI4KeCFJqNVoEKN+7YBjY3gMkpH8DuAUVA9L+Ea9Jk6CMSmWI4SBX6qYO
	QSM=
X-IronPort-AV: E=Sophos;i="5.73,456,1583164800"; d="scan'208";a="140301742"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
	by ob1.hgst.iphmx.com with ESMTP; 31 May 2020 16:58:07 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0871.namprd04.prod.outlook.com (2603:10b6:910:56::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Sun, 31 May 2020 08:58:05 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.022;
	Sun, 31 May 2020 08:58:05 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 06/14] dm-zoned: temporary superblock for tertiary devices
Thread-Index: AQHWNeAWuKyK1D6poUCI+0vguDytUajB520A
Date: Sun, 31 May 2020 08:58:04 +0000
Message-ID: <736581c9a278556850b70a078980361212f155ca.camel@wdc.com>
References: <20200529173907.40529-1-hare@suse.de>
	<20200529173907.40529-7-hare@suse.de>
In-Reply-To: <20200529173907.40529-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 998ce4c8-14d7-4a93-c1d0-08d80540bb47
x-ms-traffictypediagnostic: CY4PR04MB0871:
x-microsoft-antispam-prvs: <CY4PR04MB08713B0D57683BF2633111B5E78D0@CY4PR04MB0871.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4SfifYSDo+KAf39yRPJRhhbGamgeQDw/RrszOeaNfLdK+u0cE16OdsjLX2P55jeKay2en/ssJsx1H0bcorBBXP9iUQ0woTJajZNwF8TarRBFg8O8U1F027mwB5Fwp78tsO0pUwePWycfyUZLnF2T3mET2Wtw3gMh5H5KgDSxYj4Jaqf12kn7Orzb0dQlAz/ya+/S4ld7dhU2ZXBRwal1exWkxufXZZH91pjkzdiNfk0JQdRm1sbxeH7g0cuhdpXJiB92U2eNGvYt4qX4fRtxYo7jkgHo0/FgEE1+pZC5UO3WkEuGYQD6E/bh9NA3Kb5XnN00lBQq5RwzJhKUE+d1hA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(186003)(478600001)(316002)(5660300002)(2906002)(83380400001)(6486002)(2616005)(110136005)(8936002)(71200400001)(6512007)(86362001)(36756003)(8676002)(4326008)(26005)(66946007)(66556008)(6506007)(64756008)(66446008)(91956017)(66476007)(76116006);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: DXs140OCTvDVpw9+I0AZ1nkhrO8J/0TvCR1kIovg/tw71zsNpwlVTq6Wt0JTXtySFN+/u7b8VsYDqg5Ranjg9aSy11b8aRHtizgR/+l5f3NG0P/3HixmYhTUJ2yDZiVIX/jPDKrB5J8YdNx90/3wKhfujsRaVFleDtC2ECHI8fOyqxnRRqzQS5RvkFXVol8Py7dgGSKsbcNi+oXlmdjGCKdk0mUlXk6HtRo8kLBQj3eW0cdepW2HAuVNv7L4XrFUZ6MCrs3a9JQpaPQs8Gyoh35baTTEe7uiBFUcM3GC2SbQcIXOlwrMt7sCT/n/2sg2bzby3JbG1ZNE4XEsCDJfLsxiLLiii5HLIC0CfHUginD+VfhnPBRBhzb9soMZtkDyL4ayq26ijMLBWPTIEMGn4iY7fxPXO6hIapDfPxasOAnRe12MTUF1N4SujuOtTbk0n2mq1tmuyRiIbrbcRwX2g68umWYTgXllhPhEgo5HGtiR1djVhSvsclR0vR7vtMz4
x-ms-exchange-transport-forked: True
Content-ID: <5CB640D3D23644448945C395EB7DBB08@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998ce4c8-14d7-4a93-c1d0-08d80540bb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 08:58:04.9633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4KPsspnXdueYCpQ+R+ZVb+Q4HrHQuv1FgE0jXAJHjrmlpPHr7NMvYK0xclWfx9FrzVSAZkoFj+HmTogOijZuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0871
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04V8wJAi030604
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/14] dm-zoned: temporary superblock for
	tertiary devices
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-29 at 19:38 +0200, Hannes Reinecke wrote:
> Checking the tertiary superblock just consists of validating UUIDs,
> crcs, and the generation number; it doesn't have contents which
> would be required during the actual operation.
> So we should be allocating a temporary superblock when checking
> tertiary devices and avoid having to store it together with the
> 'real' superblocks.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 109 +++++++++++++++++++++++------------------
>  1 file changed, 61 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 839f9078806d..d9f3ecc76eff 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -174,7 +174,7 @@ struct dmz_metadata {
>  	/* Zone information array */
>  	struct xarray		zones;
>  
> -	struct dmz_sb		sb[3];
> +	struct dmz_sb		sb[2];
>  	unsigned int		mblk_primary;
>  	unsigned int		sb_version;
>  	u64			sb_gen;
> @@ -1014,10 +1014,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  /*
>   * Check super block.
>   */
> -static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
> +			bool tertiary)
>  {
> -	struct dmz_super *sb = zmd->sb[set].sb;
> -	struct dmz_dev *dev = zmd->sb[set].dev;
> +	struct dmz_super *sb = dsb->sb;
> +	struct dmz_dev *dev = dsb->dev;
>  	unsigned int nr_meta_zones, nr_data_zones;
>  	u32 crc, stored_crc;
>  	u64 gen;
> @@ -1034,7 +1035,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  			    DMZ_META_VER, zmd->sb_version);
>  		return -EINVAL;
>  	}
> -	if ((zmd->sb_version < 1) && (set == 2)) {
> +	if (zmd->sb_version < 2 && tertiary) {
>  		dmz_dev_err(dev, "Tertiary superblocks are not supported");
>  		return -EINVAL;
>  	}
> @@ -1078,7 +1079,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  			return -ENXIO;
>  		}
>  
> -		if (set == 2) {
> +		if (tertiary) {
>  			/*
>  			 * Generation number should be 0, but it doesn't
>  			 * really matter if it isn't.
> @@ -1127,14 +1128,13 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  /*
>   * Read the first or second super block from disk.
>   */
> -static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_read_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
>  {
>  	dmz_zmd_debug(zmd, "read superblock set %d dev %s block %llu",
> -		      set, zmd->sb[set].dev->name,
> -		      zmd->sb[set].block);
> +		      set, sb->dev->name, sb->block);
>  
> -	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
> -			      zmd->sb[set].block, zmd->sb[set].mblk->page);
> +	return dmz_rdwr_block(sb->dev, REQ_OP_READ,
> +			      sb->block, sb->mblk->page);
>  }
>  
>  /*
> @@ -1162,7 +1162,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  	zmd->sb[1].zone = dmz_get(zmd, zone_id + 1);
>  	zmd->sb[1].dev = zmd->sb[0].dev;
>  	for (i = 1; i < zmd->nr_rnd_zones; i++) {
> -		if (dmz_read_sb(zmd, 1) != 0)
> +		if (dmz_read_sb(zmd, &zmd->sb[1], 1) != 0)
>  			break;
>  		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
>  			return 0;
> @@ -1179,9 +1179,9 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  }
>  
>  /*
> - * Read the first or second super block from disk.
> + * Read a super block from disk.
>   */
> -static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_get_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
>  {
>  	struct dmz_mblock *mblk;
>  	int ret;
> @@ -1191,14 +1191,14 @@ static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
>  	if (!mblk)
>  		return -ENOMEM;
>  
> -	zmd->sb[set].mblk = mblk;
> -	zmd->sb[set].sb = mblk->data;
> +	sb->mblk = mblk;
> +	sb->sb = mblk->data;
>  
>  	/* Read super block */
> -	ret = dmz_read_sb(zmd, set);
> +	ret = dmz_read_sb(zmd, sb, set);
>  	if (ret) {
>  		dmz_free_mblock(zmd, mblk);
> -		zmd->sb[set].mblk = NULL;
> +		sb->mblk = NULL;
>  		return ret;
>  	}
>  
> @@ -1272,13 +1272,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	/* Read and check the primary super block */
>  	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
>  	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
> -	ret = dmz_get_sb(zmd, 0);
> +	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
>  	if (ret) {
>  		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, 0);
> +	ret = dmz_check_sb(zmd, &zmd->sb[0], false);
>  
>  	/* Read and check secondary super block */
>  	if (ret == 0) {
> @@ -1291,7 +1291,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		}
>  		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  		zmd->sb[1].dev = zmd->sb[0].dev;
> -		ret = dmz_get_sb(zmd, 1);
> +		ret = dmz_get_sb(zmd, &zmd->sb[1], 1);
>  	} else
>  		ret = dmz_lookup_secondary_sb(zmd);
>  
> @@ -1300,7 +1300,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, 1);
> +	ret = dmz_check_sb(zmd, &zmd->sb[1], false);
>  	if (ret == 0)
>  		sb_good[1] = true;
>  
> @@ -1345,20 +1345,40 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		      "Using super block %u (gen %llu)",
>  		      zmd->mblk_primary, zmd->sb_gen);
>  
> -	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
> -		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
> -		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
> -		ret = dmz_get_sb(zmd, 2);
> -		if (ret) {
> -			dmz_dev_err(zmd->sb[2].dev,
> -				    "Read tertiary super block failed");
> -			return ret;
> +	if (zmd->sb_version > 1) {
> +		int i;
> +		struct dmz_sb *sb;
> +
> +		sb = kzalloc(sizeof(struct dmz_sb), GFP_KERNEL);
> +		if (!sb)
> +			return -ENOMEM;
> +		for (i = 1; i < zmd->nr_devs; i++) {
> +			sb->block = 0;
> +			sb->zone = dmz_get(zmd, zmd->dev[i].zone_offset);
> +			sb->dev = &zmd->dev[i];
> +			if (!dmz_is_meta(sb->zone)) {
> +				dmz_dev_err(sb->dev,
> +					    "Tertiary super block zone %u not marked as metadata zone",
> +					    sb->zone->id);
> +				ret = -EINVAL;
> +				goto out_kfree;
> +			}
> +			ret = dmz_get_sb(zmd, sb, i + 1);
> +			if (ret) {
> +				dmz_dev_err(sb->dev,
> +					    "Read tertiary super block failed");
> +				dmz_free_mblock(zmd, sb->mblk);
> +				goto out_kfree;
> +			}
> +			ret = dmz_check_sb(zmd, sb, true);
> +			dmz_free_mblock(zmd, sb->mblk);
> +			if (ret == -EINVAL)
> +				goto out_kfree;
>  		}
> -		ret = dmz_check_sb(zmd, 2);
> -		if (ret == -EINVAL)
> -			return ret;
> +	out_kfree:
> +		kfree(sb);
>  	}
> -	return 0;
> +	return ret;
>  }
>  
>  /*
> @@ -1415,12 +1435,15 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  				zmd->sb[0].zone = zone;
>  			}
>  		}
> -		if (zmd->nr_devs > 1 && !zmd->sb[2].zone) {
> -			/* Tertiary superblock zone */
> -			zmd->sb[2].zone = zone;
> +		if (zmd->nr_devs > 1 && num == 0) {
> +			/*
> +			 * Tertiary superblock zones are always at the
> +			 * start of the zoned devices, so mark them
> +			 * as metadata zone.
> +			 */
> +			set_bit(DMZ_META, &zone->flags);
>  		}
>  	}
> -
>  	return 0;
>  }
>  
> @@ -2858,16 +2881,6 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  		}
>  		set_bit(DMZ_META, &zone->flags);
>  	}
> -	if (zmd->sb[2].zone) {
> -		zone = dmz_get(zmd, zmd->sb[2].zone->id);
> -		if (!zone) {
> -			dmz_zmd_err(zmd,
> -				    "Tertiary metadata zone not present");
> -			ret = -ENXIO;
> -			goto err;
> -		}
> -		set_bit(DMZ_META, &zone->flags);
> -	}
>  	/* Load mapping table */
>  	ret = dmz_load_mapping(zmd);
>  	if (ret)

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

