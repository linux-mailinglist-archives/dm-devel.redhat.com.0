Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B77B2198912
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 02:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585616069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=s0ZRd2unyw6Wr4C2dPPT+EpivOmCvVKOUDRyX1XL7Mc=;
	b=PaCLH9rVFd82i7DGyHPkLw2OOSbVoIznjPGgZ2NOg4suqK04IeXfAIa8j69Flp2eji2xA/
	BTKB55AGq2wlVFi00RIdllxsm4AG0fZD0MTmpYAuh7625hB8XHgX6awqNyYxaKsNxXTBET
	kc/8o2gz2s/Np1rYwEcM6D9AzxlURSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-9VNjntZTMh-VzMZ786gNhg-1; Mon, 30 Mar 2020 20:54:27 -0400
X-MC-Unique: 9VNjntZTMh-VzMZ786gNhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436C9800D5E;
	Tue, 31 Mar 2020 00:54:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1FE19C58;
	Tue, 31 Mar 2020 00:54:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D428486BE1;
	Tue, 31 Mar 2020 00:54:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0sFbb028011 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:54:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 449322166B30; Tue, 31 Mar 2020 00:54:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FC272166B2F
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:54:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22FB18E3C19
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:54:13 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-2JgLrJCAND-HpawOWn4o8g-1; Mon, 30 Mar 2020 20:54:10 -0400
X-MC-Unique: 2JgLrJCAND-HpawOWn4o8g-1
IronPort-SDR: UlcvK2joDSqLrICKOExbdH1XUoMHEkz13OgwjE+x1xi1A+jkffrldVrTl9vR7ZJxoi448svf7z
	b8pLJ/d1baEZofQ49bJRd3l6p2vwemSTtfPca+UW6iz+/vEpW60b7RCa0OrJB0gOLTRMRLFXtd
	7zztVNZ8+UPNeikjVqSz887GWuYIU/rzWMF9LPXFGpZb2w4kMjeqyzMFmVSYH46afQ1s+bJyKy
	qa4/CPSEsKbaaBYzr44suuOuZcnqrWEythSiTlaz7FE5pPqLuutxJ8DAaQsbErKMfuXC17Qz6M
	QBI=
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; d="scan'208";a="236205375"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
	by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2020 08:54:26 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2134.namprd04.prod.outlook.com (2603:10b6:102:c::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:54:07 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:54:07 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 3/4] dm-zoned: V2 metadata handling
Thread-Index: AQHWBAd2RJyr/50iGE+ALqrV5GTuTQ==
Date: Tue, 31 Mar 2020 00:54:07 +0000
Message-ID: <CO2PR04MB234310E62E20C24686021092E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: becb359c-c29f-433b-7d7f-08d7d50e047a
x-ms-traffictypediagnostic: CO2PR04MB2134:
x-microsoft-antispam-prvs: <CO2PR04MB2134AA5357354934E3788552E7C80@CO2PR04MB2134.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:241;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(316002)(86362001)(478600001)(66946007)(33656002)(71200400001)(76116006)(186003)(66476007)(64756008)(26005)(91956017)(5660300002)(52536014)(81156014)(8936002)(54906003)(66446008)(66556008)(81166006)(4326008)(7696005)(53546011)(6506007)(55016002)(8676002)(9686003)(2906002)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TqbQ0P5nlbfDH0+r1oBJJbDxvpUThKFiO83QaG7NCwLeulIJ1zIsMMFuHBUn9RbkoQ2BzuZ1BES1JnZ0RpvodHI6SAZmBysCgwKth1zbR9iHly0mIVD5lbLZp2P8xV7X6XhEe/QeLKtybPjPv9Lvva9y9H7t9MrzllbaLIWHzuzTvDoNivjw7dn7pc8YV5xrQYKslVxopC/2RrAVbHkO7fUevD2T1OG1b0gwbK7wPUEIt6moNNLFSqVlX8bnMre+jgTDZS8uIpMg26V4dFOUor2UUeiE5j0rDO/ivoPaZYvCZn4iyJWet2td23eigiI2ktxuUNwiXtkMBBVuVsT/krABPXEgWI6K13LAMOYeiVPg7pUGXcSLSVnaGdExBoRJItS3O0YkYd2v70vTthLo0tliP32XJhtt6K/80EUFqQE3pxt/VonbdupaZMNxxxU
x-ms-exchange-antispam-messagedata: p7IpMOlS7eh7Uw/UN48ntfT3iDgBj0VXgcSRM13pIFT35OgUpW2C91wm/n+lC9zYtrA4HiC7jziDFSuwULT6imuikXQkxURo3jpxB+SUsNz5h4gOebqXpaRQXJiDfmsPa42WZCbil6TiKxGbXbPRxw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: becb359c-c29f-433b-7d7f-08d7d50e047a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:54:07.6369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUixhwDg3+LI5ktfmbDLIA2L54qiWY+GGi/1YzoTS/iNK8sqGBHyTLXn6C+1RrmcaCsXvwrhPYfAF8eWD1famw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2134
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0sFbb028011
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
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

On 2020/03/27 16:15, Hannes Reinecke wrote:
> Add 'V2' metadata which includes UUIDs for the dmz set and for
> the device itself.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 80 +++++++++++++++++++++++++++++++++---------
>  drivers/md/dm-zoned-target.c   |  2 +-
>  2 files changed, 64 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index dc1d17bc3bbb..026f285fba33 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -16,7 +16,8 @@
>  /*
>   * Metadata version.
>   */
> -#define DMZ_META_VER	1
> +#define DMZ_META_COMPAT_VER 1
> +#define DMZ_META_VER	2
>  
>  /*
>   * On-disk super block magic.
> @@ -69,8 +70,17 @@ struct dmz_super {
>  	/* Checksum */
>  	__le32		crc;			/*  48 */
>  
> -	/* Padding to full 512B sector */
> -	u8		reserved[464];		/* 512 */
> +	/* DM-Zoned label */
> +	u8		dmz_label[32];		/*  80 */
> +
> +	/* DM-Zoned UUID */
> +	u8		dmz_uuid[16];		/*  96 */
> +
> +	/* Device UUID */
> +	u8		dev_uuid[16];		/* 112 */
> +
> +	/* Padding to full 512B - CRC sector */
> +	u8		reserved[400];		/* 512 */
>  };
>  
>  /*
> @@ -133,6 +143,10 @@ struct dmz_sb {
>  struct dmz_metadata {
>  	struct dmz_dev		*dev;
>  
> +	char			dmz_label[BDEVNAME_SIZE];
> +	uuid_t			dmz_uuid;
> +	uuid_t			dev_uuid;
> +
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
>  	unsigned int		zone_bits_per_mblk;
> @@ -659,7 +673,14 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  	int ret;
>  
>  	sb->magic = cpu_to_le32(DMZ_MAGIC);
> -	sb->version = cpu_to_le32(DMZ_META_VER);
> +
> +	if (!uuid_is_null(&zmd->dmz_uuid)) {
> +		sb->version = cpu_to_le32(DMZ_META_VER);
> +		uuid_copy((uuid_t *)sb->dmz_uuid, &zmd->dmz_uuid);
> +		memcpy(sb->dmz_label, zmd->dmz_label, BDEVNAME_SIZE);
> +		uuid_copy((uuid_t *)sb->dev_uuid, &zmd->dev_uuid);
> +	} else
> +		sb->version = cpu_to_le32(DMZ_META_COMPAT_VER);
>  
>  	sb->gen = cpu_to_le64(sb_gen);
>  
> @@ -848,28 +869,29 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
>  {
>  	unsigned int nr_meta_zones, nr_data_zones;
>  	struct dmz_dev *dev = zmd->dev;
> -	u32 crc, stored_crc;
> +	u32 crc, stored_crc, dmz_version;
>  	u64 gen;
>  
> -	gen = le64_to_cpu(sb->gen);
> -	stored_crc = le32_to_cpu(sb->crc);
> -	sb->crc = 0;
> -	crc = crc32_le(gen, (unsigned char *)sb, DMZ_BLOCK_SIZE);
> -	if (crc != stored_crc) {
> -		dmz_dev_err(dev, "Invalid checksum (needed 0x%08x, got 0x%08x)",
> -			    crc, stored_crc);
> -		return -ENXIO;
> -	}
> -
>  	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
>  		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
>  			    DMZ_MAGIC, le32_to_cpu(sb->magic));
>  		return -ENXIO;
>  	}
>  
> -	if (le32_to_cpu(sb->version) != DMZ_META_VER) {
> +	dmz_version = le32_to_cpu(sb->version);
> +	if (dmz_version > DMZ_META_VER) {
>  		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
> -			    DMZ_META_VER, le32_to_cpu(sb->version));
> +			    DMZ_META_VER, dmz_version);
> +		return -ENXIO;
> +	}
> +
> +	gen = le64_to_cpu(sb->gen);
> +	stored_crc = le32_to_cpu(sb->crc);
> +	sb->crc = 0;
> +	crc = crc32_le(gen, (unsigned char *)sb, DMZ_BLOCK_SIZE);
> +	if (crc != stored_crc) {
> +		dmz_dev_err(dev, "Invalid checksum (needed 0x%08x, got 0x%08x)",
> +			    crc, stored_crc);
>  		return -ENXIO;
>  	}
>  
> @@ -895,6 +917,21 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
>  		return -ENXIO;
>  	}
>  
> +	if (dmz_version == DMZ_META_VER) {
> +		if (uuid_is_null((uuid_t *)sb->dmz_uuid)) {
> +			dmz_dev_err(dev, "NULL DM-Zoned uuid");
> +			return -ENXIO;
> +		}
> +		uuid_copy(&zmd->dmz_uuid, (uuid_t *)sb->dmz_uuid);
> +		memcpy(zmd->dmz_label, sb->dmz_label, BDEVNAME_SIZE);
> +		if (uuid_is_null((uuid_t *)sb->dev_uuid)) {
> +			dmz_dev_err(dev, "NULL device uuid");
> +			return -ENXIO;
> +		}
> +		uuid_copy(&zmd->dev_uuid, (uuid_t *)sb->dev_uuid);
> +
> +	}
> +
>  	/* OK */
>  	zmd->nr_meta_blocks = le32_to_cpu(sb->nr_meta_blocks);
>  	zmd->nr_reserved_seq = le32_to_cpu(sb->nr_reserved_seq);
> @@ -2460,9 +2497,18 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		goto err;
>  	}
>  
> +	dmz_dev_info(dev, "DM-Zoned version %d",
> +		     uuid_is_null(&zmd->dmz_uuid) ?
> +		     DMZ_META_COMPAT_VER : DMZ_META_VER);
> +	if (!uuid_is_null(&zmd->dmz_uuid))
> +		dmz_dev_info(dev, "DM UUID %pUl", &zmd->dmz_uuid);
> +	if (strlen(zmd->dmz_label))
> +		dmz_dev_info(dev, "DM Label %s", zmd->dmz_label);
>  	dmz_dev_info(dev, "Host-%s zoned block device",
>  		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
>  		     "aware" : "managed");
> +	if (!uuid_is_null(&zmd->dev_uuid))
> +		dmz_dev_info(dev, "  uuid %pUl", &zmd->dev_uuid);
>  	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
>  		     (u64)dev->capacity);
>  	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 44e30a7de8b9..7ec9dde24516 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1008,7 +1008,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
> -	.version	 = {1, 1, 0},
> +	.version	 = {1, 2, 0},
>  	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>  	.module		 = THIS_MODULE,
>  	.ctr		 = dmz_ctr,
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

