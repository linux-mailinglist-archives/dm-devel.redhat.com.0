Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 609E11A04C1
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586225707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HxAU1I47v4wX9ox1pnu6KodunZCeSm4fYH7Um0phV/E=;
	b=LabkDkoTITSLBPMruDUMRJLLOGVs+CN6yRMhPW6I+uGVYWKJWul6zWeAYf6s//jNS3ioxd
	0pVQuVgEB98OXBxIcGoQ0WuyVxgU1FO4SFcaA8uTJDcqc4CMy3gaCMMoKcJxt6ocUD8JXy
	ma2YZQolmGlZwsPbQqJuPJUdvW0eONc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-8eylkDCyOXmRv7MnSrVtQg-1; Mon, 06 Apr 2020 22:15:04 -0400
X-MC-Unique: 8eylkDCyOXmRv7MnSrVtQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC968017F5;
	Tue,  7 Apr 2020 02:14:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54EF19D379;
	Tue,  7 Apr 2020 02:14:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87C0A93A69;
	Tue,  7 Apr 2020 02:14:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372EhnJ000446 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:14:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3E531C5B5; Tue,  7 Apr 2020 02:14:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE72AD0170
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:14:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877E1185A78F
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:14:41 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-409-8OawJsnzOdaMzeqQDU3wrw-1; Mon, 06 Apr 2020 22:14:37 -0400
X-MC-Unique: 8OawJsnzOdaMzeqQDU3wrw-1
IronPort-SDR: riwDuFIqnIAHIaiP2ThW6d+Gz56aqHrJ/bRDxKZnp6QJwqQOTBVr2GOJHp3d3z2Hs+j+vTxBPR
	gv06zJGRXO2tWZzFtYbeiS28h85FPVXIaMJz5uUHfx7xy+SfvYXPHVQ0siJXX372Ip7oozNPba
	d1/bXUk8SIjhXQZfIBqJUrXxxJC5CSoXf6JAqkk1D3aDREMbmhSxwXzE0Md05TuA/cKBVhgw7G
	VEJraULToEbPvJFtbYA4v3XTcc2u0twtOBj5TLTMnhbt+tYxJe/OwbBqt0XWJJHa1C9mWHzNZA
	LvA=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="237056613"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:14:44 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6834.namprd04.prod.outlook.com (2603:10b6:a03:22d::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19;
	Tue, 7 Apr 2020 02:14:34 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:14:34 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 02/11] dm-zoned: use array for superblock zones
Thread-Index: AQHWDDiOzTcLmX8v/0moHAS030rl1w==
Date: Tue, 7 Apr 2020 02:14:34 +0000
Message-ID: <BY5PR04MB6900D6980B538EDE8AF38139E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05afc8c9-a83f-4cbc-4862-08d7da996a38
x-ms-traffictypediagnostic: BY5PR04MB6834:
x-microsoft-antispam-prvs: <BY5PR04MB6834B51CCED55C90246D5EA0E7C30@BY5PR04MB6834.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(396003)(136003)(366004)(39850400004)(376002)(478600001)(316002)(186003)(2906002)(53546011)(86362001)(110136005)(64756008)(66476007)(54906003)(7696005)(8676002)(9686003)(66446008)(55016002)(26005)(81166006)(76116006)(81156014)(66556008)(4326008)(5660300002)(6506007)(66946007)(33656002)(52536014)(8936002)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TNA4K71y2MpqYDVcUFAQOEfAB6TqvxQ1Xz1THF87CBG8xGAKvsSL9m29gVq0qvvNISW9gi+qw9v+LZZH7Rp2/HWF4A1K/Rgl3VZN7L0Yhu9wWdK8r/laPXQOhg4gs7hnaoUD6n0lPmbNuqtX1oyj5S6N9gKkVXqZ7mhr6+BT8SAtTUEuTcEfoMJv6fb5cBl0AYrQGNlZJf5tDFsxiMyMBX3f0/DpWG3xpdqZzVlmZcLLlz+6MzBiqcrGOASzEw6bSy5ANCZSHJsVdptFxEMdZFxyLL/gHjHurhZpAriBI6Z+UU7Z4BZ8q+yWVW+YYwYdswNSOR+Dtd5KUcRlrpZvX1eLllLz3IQ0VXP3hAJtU0PGPCPISL7oUovr7pMHoVcNUIh9P9nidrsngUXDW3xHCxFX8DRvjHRK6RJkCCx7B1Sw4k/i/Y0Z3HgKOMKgAWoc
x-ms-exchange-antispam-messagedata: pcPrycgXsXWIRwo2H0vcR44jSd71bWabNw5rxzPuMQF/G1stfJtBeMAS7fAqcntqtkVGnXxBlwEI66njdNeTEy/X7jhoA4MqEmCfJi/t+tIp9yAMZNjqOUkFnrGHykEVrzZZmUAiMMsZa32zrp8Z/w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05afc8c9-a83f-4cbc-4862-08d7da996a38
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:14:34.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXbdXF0NmdXii9k9KgJsN4EZbHlp0X/sHn4lGLXamgNbw3B2kWlG4d+pOU4UCAMZV5dT2vhJMvYVPiiPPd53Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6834
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372EhnJ000446
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 02/11] dm-zoned: use array for superblock
	zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:26, Hannes Reinecke wrote:
> Instead of storing just the first superblock zone and calculate
> the secondary relative to that we should be using an array for
> holding the superblock zones.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 41 +++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index afce594067fb..b37d3faec518 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -124,6 +124,7 @@ struct dmz_sb {
>  	sector_t		block;
>  	struct dmz_mblock	*mblk;
>  	struct dmz_super	*sb;
> +	struct dm_zone		*zone;
>  };
>  
>  /*
> @@ -150,7 +151,6 @@ struct dmz_metadata {
>  	/* Zone information array */
>  	struct dm_zone		*zones;
>  
> -	struct dm_zone		*sb_zone;
>  	struct dmz_sb		sb[2];
>  	unsigned int		mblk_primary;
>  	u64			sb_gen;
> @@ -844,8 +844,9 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  /*
>   * Check super block.
>   */
> -static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
> +static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  {
> +	struct dmz_super *sb = zmd->sb[set].sb;
>  	unsigned int nr_meta_zones, nr_data_zones;
>  	struct dmz_dev *dev = zmd->dev;
>  	u32 crc, stored_crc;
> @@ -937,16 +938,20 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  
>  	/* Bad first super block: search for the second one */
>  	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
> +	zmd->sb[1].zone = zmd->sb[0].zone + 1;
>  	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
>  		if (dmz_read_sb(zmd, 1) != 0)
>  			break;
> -		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
> +		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC) {
> +			zmd->sb[1].zone += i;
>  			return 0;
> +		}
>  		zmd->sb[1].block += zone_nr_blocks;
>  	}
>  
>  	dmz_free_mblock(zmd, mblk);
>  	zmd->sb[1].mblk = NULL;
> +	zmd->sb[1].zone = NULL;
>  
>  	return -EIO;
>  }
> @@ -990,11 +995,9 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
>  	dmz_dev_warn(zmd->dev, "Metadata set %u invalid: recovering", dst_set);
>  
>  	if (dst_set == 0)
> -		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
> -	else {
> -		zmd->sb[1].block = zmd->sb[0].block +
> -			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
> -	}
> +		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
> +	else
> +		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  
>  	page = alloc_page(GFP_NOIO);
>  	if (!page)
> @@ -1038,21 +1041,27 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	u64 sb_gen[2] = {0, 0};
>  	int ret;
>  
> +	if (!zmd->sb[0].zone) {
> +		dmz_dev_err(zmd->dev, "Primary super block zone not set");
> +		return -ENXIO;
> +	}
> +
>  	/* Read and check the primary super block */
> -	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
> +	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
>  	ret = dmz_get_sb(zmd, 0);
>  	if (ret) {
>  		dmz_dev_err(zmd->dev, "Read primary super block failed");
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, zmd->sb[0].sb);
> +	ret = dmz_check_sb(zmd, 0);
>  
>  	/* Read and check secondary super block */
>  	if (ret == 0) {
>  		sb_good[0] = true;
> -		zmd->sb[1].block = zmd->sb[0].block +
> -			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
> +		if (!zmd->sb[1].zone)
> +			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
> +		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  		ret = dmz_get_sb(zmd, 1);
>  	} else
>  		ret = dmz_lookup_secondary_sb(zmd);
> @@ -1062,7 +1071,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, zmd->sb[1].sb);
> +	ret = dmz_check_sb(zmd, 1);
>  	if (ret == 0)
>  		sb_good[1] = true;
>  
> @@ -1147,9 +1156,9 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  		zmd->nr_useable_zones++;
>  		if (dmz_is_rnd(zone)) {
>  			zmd->nr_rnd_zones++;
> -			if (!zmd->sb_zone) {
> +			if (!zmd->sb[0].zone) {
>  				/* Super block zone */
> -				zmd->sb_zone = zone;
> +				zmd->sb[0].zone = zone;
>  			}
>  		}
>  	}
> @@ -2420,7 +2429,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		goto err;
>  
>  	/* Set metadata zones starting from sb_zone */
> -	zid = dmz_id(zmd, zmd->sb_zone);
> +	zid = dmz_id(zmd, zmd->sb[0].zone);
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zid + i);
>  		if (!dmz_is_rnd(zone))
> 

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

