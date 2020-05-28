Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAEF1E5441
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 04:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590634488;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JjBvCNKaNISATLY2Qq1554AOvsUv9Bp9HbXYAxLa4QM=;
	b=UhbFk8U9klv++i62XopKl15rIlBzrE/YQXVQB5yVsxhuMgH/s4ArjKJ/TSVAT8d7wH/3QZ
	9mmrbxQWjT1rQ/jjczCtTS+HW8magm8R5AAMhWKx3XrgSWkd9qt94Iw1M6u+7rsW9UaREv
	Y2cLiY9ZmRXZ6mYxFrDccqpec1tX3QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-dMe5NpRQPCCo15v_Eddb2Q-1; Wed, 27 May 2020 22:54:46 -0400
X-MC-Unique: dMe5NpRQPCCo15v_Eddb2Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C40F19067E0;
	Thu, 28 May 2020 02:54:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1E51A8EC;
	Thu, 28 May 2020 02:54:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2D051809541;
	Thu, 28 May 2020 02:54:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S2sQN5030757 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 22:54:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54BB12156A22; Thu, 28 May 2020 02:54:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 501072156A2D
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:54:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C20380028B
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:54:23 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-444-pjUIeYGzMyGK6rWlL14A0w-1; Wed, 27 May 2020 22:54:21 -0400
X-MC-Unique: pjUIeYGzMyGK6rWlL14A0w-1
IronPort-SDR: +2/0WBEbIXVvq2ic6v2fgW3UiLQ3z7mQqPF2CkNFpfffJTI5ie/W2EKLjnxgHjj9j+cbdkItIp
	aCX8wnH7IkLWyIfGfQx4Ixsk32lAg1S+w/6eUTGZNhUgn5IFYxR5V8Dc3VwRqLPS5h5U5WVRNh
	ZUExbWRVmuWVWIu+Skju7EXgPiYlPGhrulgHSsCV4fZS147cJx/3VxtlgZfLNzUug8wfJK3mB/
	dxZvye7hxyOAa4PIZePfGGQcXCtewG3ggdCAHyhL2kAUJKVCjnmf8l9YE6HhxHXrbpyCaqjcxx
	RKU=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138995349"
Received: from mail-bn8nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.174])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 10:54:20 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1127.namprd04.prod.outlook.com (2603:10b6:903:bb::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23;
	Thu, 28 May 2020 02:54:17 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 02:54:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 06/15] dm-zoned: temporary superblock for tertiary devices
Thread-Index: AQHWM+89X9h31qE0xEiEVcCiz6nRpw==
Date: Thu, 28 May 2020 02:54:17 +0000
Message-ID: <CY4PR04MB37510485B74E55A17B4106BDE78E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 977462b0-c492-4804-3f50-08d802b26a04
x-ms-traffictypediagnostic: CY4PR04MB1127:
x-microsoft-antispam-prvs: <CY4PR04MB112746ACF47F177615E51FD2E78E0@CY4PR04MB1127.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/bVCV3zA3isRaQMyTm5b/bT71y+9bCXo7ZJmwUzvxzo8f9/DH4AZuGDjgsm4rKl6G2m3TGzD1KwKJyoABGq0VQ/LCDGUFMAhq+OiGz+tzetqQK+72f1Vb4A8+KLHiHM84I+/BZDibVtXbLDoJ1Dw7H+GXuh1ajnpqOtt7evW8/jwvDtE/SGbvQ2+yGq8dhytYWyiIZd36SDj6ZIhP3LB0fsXWPKJgZWQGlhOmgM25FWwEDl4a3H/yx1n2TYaKQTbkudVBEI4amc2ve2VBo7vQqNTFw3NxyaF/n3yA9xsdXlkGyT9g9Jz0aGImIdogW75nNZTjaaMr9pHZDYOuDXNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(91956017)(76116006)(6506007)(66476007)(53546011)(186003)(8676002)(5660300002)(2906002)(64756008)(7696005)(9686003)(52536014)(66946007)(316002)(55016002)(66556008)(26005)(66446008)(83380400001)(71200400001)(110136005)(8936002)(478600001)(33656002)(4326008)(86362001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: QqUADbrFNYsGfcTxUzdqr0EDEhm2Onfz0+ig40KeBmQ68C3MjqRVZNSoZLeYAnukKwlXImto24l8by4x11e6AcVtZwXa1F53LmmJ9Dg7w9NDqOMMFbOVrJKqVXHW3zI2hXGrBX65fwKhspwfLZZdw/IOE5RwcqUm43xBbfBt/LMQYvaNQlV32goqVDtmoQXhPboeS667XTcsFbeGhnnYUkeOUXruyWjqc9LUYnHsAa9xOnUfidGC+CJWepllB/nLdWzJ1CiZQNIZJMhlUa6+d3SPGEVV4/Gueg1wrpWI+M7FTCauQin0tGRUAuWjbRkZUx/z3YaClLRgJImQB8MqAjdUVsCJK833oqL1o0+AfEzN5pZKovpwwJs4tyWiiMoCtPMRZMe5TiCD/Gye+Y7IoLJtyzQdiaQCfGCr8EL8zrNEssaQDfOIgNpomFO+DgfPFIXYMhBcKLLvbTQXpPhD1fhAWI2YHaHAkclFdEnNSGO7ylshMCKCAtj3TfC2uklB
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977462b0-c492-4804-3f50-08d802b26a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 02:54:17.7733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sD8leQsnvtSiPtUTfk4PC8TGi5fXEa8jDYKLbcmf1salCm3G59znhSpn7WdoLZ83sf0cdMqICduTxrpPi0Mxvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1127
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S2sQN5030757
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/15] dm-zoned: temporary superblock for
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

On 2020/05/27 15:22, Hannes Reinecke wrote:
> Checking the tertiary superblock just consists of validating UUIDs,
> crcs, and the generation number; it doesn't have contents which
> would be required during the actual operation.
> So we should be allocating a temporary superblock when checking
> tertiary devices and avoid having to store it together with the
> 'real' superblocks.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 104 ++++++++++++++++++++++-------------------
>  1 file changed, 57 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 839f9078806d..bb9ce72bf18c 100644
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
> +	if ((zmd->sb_version < 1) && tertiary) {

You can remove the parentheses around zmd->sb_version < 1 here.
An shouldn't it be "zmd->sb_version <= 1" here ? That already was in the
previous round of updates and did not detect any problem though. Will check again.

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
> @@ -1345,18 +1345,35 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
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
> +				return -EINVAL;

Mem leaking sb here...

> +			}
> +			ret = dmz_get_sb(zmd, sb, i + 1);
> +			if (ret) {
> +				dmz_dev_err(sb->dev,
> +					    "Read tertiary super block failed");
> +				return ret;

Here too.

> +			}
> +			ret = dmz_check_sb(zmd, sb, true);
> +			dmz_free_mblock(zmd, sb->mblk);
> +			if (ret == -EINVAL)
> +				return ret;

And here.

>  		}
> -		ret = dmz_check_sb(zmd, 2);
> -		if (ret == -EINVAL)
> -			return ret;
> +		kfree(sb);
>  	}
>  	return 0;
>  }
> @@ -1415,12 +1432,15 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
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
> @@ -2858,16 +2878,6 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
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
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

