Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id A3210198907
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 02:52:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585615924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ftrVXIUTZU970MNjsaRm7GADicx6gXrRiNX0GfLQhS0=;
	b=Hxa0NQUIGC9+p88/brOF77yB9YegjC3CF0h7nXhYwkJCIzZ8grMHnQKgpt9bgLo4x06yOl
	WXmdbmRGk90MyZLylGIyZQzGtN3iwX4Ky/mAmXGBtMSI+uj/L1tmJnaEKag0xto/dje8c/
	7Z8Ase4aQVprQo2rWePYzEk3KNuzWd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-DwXAIXupPPKjjuL9AEKXPg-1; Mon, 30 Mar 2020 20:52:02 -0400
X-MC-Unique: DwXAIXupPPKjjuL9AEKXPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B06800D5B;
	Tue, 31 Mar 2020 00:51:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F238A5C1C5;
	Tue, 31 Mar 2020 00:51:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C74986BE1;
	Tue, 31 Mar 2020 00:51:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0pmhv027890 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:51:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 819912166B30; Tue, 31 Mar 2020 00:51:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7072166B31
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:51:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CFC5101A55D
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:51:46 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-3-5wlSty0oPw6IviSv3Lpnxg-1; Mon, 30 Mar 2020 20:51:42 -0400
X-MC-Unique: 5wlSty0oPw6IviSv3Lpnxg-1
IronPort-SDR: 5+omP4x37R7qvhumGD2QPtqOJNiyVpezQl5Oeg48EUHWGacqy7byeXfcxVNWgpyi+4HxJxYPBQ
	7VXtqRbd3C3C8rerWMh/QBsSMFin5PvmscludhBTEoM31bw1WvGPVd47KjscCEamGG4yTKCUoh
	yOaizLyvwStOuT8zyDu2VKzYRRIOQKEQdHbomGgGI1ffQt0jRgZSq1Oxh+LO82UY8rr6QHU1Nx
	M1bKckA9pW6QIA3LtAVvifcg5qnTf/LawaYW6QHM1d+0C0voqa1xbm7C3Lwfg5CyTQzeNnA+rk
	DRY=
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; d="scan'208";a="133919643"
Received: from mail-co1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.51])
	by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2020 08:51:40 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2133.namprd04.prod.outlook.com (2603:10b6:102:13::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:51:39 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:51:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/4] dm-zoned: use array for superblock zones
Thread-Index: AQHWBAd14N/5/THT2EOTKtHgFe8+1w==
Date: Tue, 31 Mar 2020 00:51:39 +0000
Message-ID: <CO2PR04MB2343B8BEA67E43F4F3E51663E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cb62c25-07d1-4be8-ba8b-08d7d50dac59
x-ms-traffictypediagnostic: CO2PR04MB2133:
x-microsoft-antispam-prvs: <CO2PR04MB2133146AA75328EE7574E660E7C80@CO2PR04MB2133.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(7696005)(6506007)(81166006)(110136005)(33656002)(54906003)(53546011)(71200400001)(8936002)(316002)(81156014)(4326008)(2906002)(9686003)(5660300002)(86362001)(26005)(76116006)(66946007)(186003)(8676002)(55016002)(91956017)(66476007)(66446008)(478600001)(66556008)(52536014)(64756008);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hFcQRxgJAINegD2QdOoqnuZZYaIVTMYVjMkN4UL6J9G6YMePS5TcjXIw31MoTJTHMujJvBFJno/kyVB5RC6mvYJTAxiapkvKWDTsliv/HBUb4QhT+7M7EiLiYO0OLc8AXAvG4/s/gO4VYefpzujBoAmc/4HVoQCa/2BJBFJnqP/eKWjdGO/T2leomqtsHsb7nBQVO0Tn2gLzW8nARZ4npyCJ5EwdpYrkYs924Lu7ghxlZDUJ/CGPF8a0cGzRSzorx7vQmsApCv57CuaYHGkywXLZhly8S9DPGyzNLl+ci2CaE/XdUAqDplkFr/V5WVB+uHqCwUKsxFQAVksr4L92xS/abxqEtoljsJlxE6Yj5hWXO7QWH+GjBsIDc3ZESQD7IfNopHRj0i9pp40rTZwUVuJIxh3h9iK5Z83BgjEs5mPG/jx7K7e6o9apvbk3lWv2
x-ms-exchange-antispam-messagedata: Ouh0pFkhaW9VLg3YcT/9/NGoT/eEp9lq5d74o843s+r1sUZ+vBF8X4p9b6UqVycC/sF/ba/srhZadtlWmhEymbpzkMynB8X75rvLqBhlifylrQRJzGDIDfFF+esPyhFUC8hQPgu4cTYYNXG+tzvoUA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb62c25-07d1-4be8-ba8b-08d7d50dac59
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:51:39.7947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8reOAETlPZoAWIEqwIHgvir3kTYBLc3+cp/EfVnVAbGxEkK5un9Fedol9LGGZoVVjjkjtltL6dIo8aCqjr42dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2133
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0pmhv027890
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/4] dm-zoned: use array for superblock zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/27 16:15, Hannes Reinecke wrote:
> Instead of storing just the first superblock zone and calculate
> the secondary relative to that we should be using an array for
> holding the superblock zones.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index afce594067fb..dc1d17bc3bbb 100644
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
> @@ -937,16 +937,20 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
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
> @@ -990,11 +994,9 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
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
> @@ -1038,8 +1040,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
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
> @@ -1051,8 +1058,9 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
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
> @@ -1147,9 +1155,9 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
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
> @@ -2420,7 +2428,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		goto err;
>  
>  	/* Set metadata zones starting from sb_zone */
> -	zid = dmz_id(zmd, zmd->sb_zone);
> +	zid = dmz_id(zmd, zmd->sb[0].zone);
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zid + i);
>  		if (!dmz_is_rnd(zone))
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

