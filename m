Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2EA1A0537
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 05:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586229796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=s2GOaicZWvzX7fST82TEmVkUpM9O6sPIJjPlS8jooEE=;
	b=TRuZOqP4vBdg8Y0Oa4w1as5Ssg+Tt2RszK7K5z8mcCegYs62WRDxzfar+oezI+0w07qcaJ
	f1nTyg1Hgf0dTORyLCdZOKBuPdrogTPkqznw/Y3N0/B1r/3ucNam72CWLw+iR5TsWlpvaM
	rDbsnF+B3PklU5FNn6aYmPZO2J9wjSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-HnXFRZtgMS27CyEt58qm3A-1; Mon, 06 Apr 2020 23:23:14 -0400
X-MC-Unique: HnXFRZtgMS27CyEt58qm3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6FF8017CE;
	Tue,  7 Apr 2020 03:23:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED5EF1001DC0;
	Tue,  7 Apr 2020 03:23:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E80D38A1;
	Tue,  7 Apr 2020 03:22:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0373MlRA004311 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 23:22:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0BEB2028CD2; Tue,  7 Apr 2020 03:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB0302026D69
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 03:22:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 185E48007D4
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 03:22:45 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-sv5t9VohNluJxPuzE5ip4Q-1; Mon, 06 Apr 2020 23:22:42 -0400
X-MC-Unique: sv5t9VohNluJxPuzE5ip4Q-1
IronPort-SDR: fefe3EIr2andIGXUnBfMFAQ9PgWLiB1Zyb3XonWZowvKGv2Vkl1xeutox7og+EOyCTbAVGqbjF
	3dyL6X5aqD4NG5UteLNIVPsgOWL+79KJdr+nigCJipiB1akAT9v+XIDPvQ1PeKb3qYLUomZNNV
	bdw/C/vNnnCFXTpAXhXXSuYaOrviNZvZyQj665ldvm9Qlryoz7MCT9OUr5X0n7dT+dnoLz2JMo
	atv4zEbdrgexrqyp0p3OFrA41XPO5Nmaj7GLPK++12LyfmF3BA3mxnqa9LcXbYOVSqH4Uc0yni
	Cak=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="134737684"
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 11:22:40 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6993.namprd04.prod.outlook.com (2603:10b6:a03:226::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Tue, 7 Apr 2020 03:22:38 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 03:22:38 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 11/11] dm-zoned: metadata version 2
Thread-Index: AQHWDDj1yH6NEu7IFEiycH6KemhU5A==
Date: Tue, 7 Apr 2020 03:22:37 +0000
Message-ID: <BY5PR04MB6900BD9771D1974C0F71E021E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-12-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 761a65b5-70bb-4532-86ef-08d7daa2ec6c
x-ms-traffictypediagnostic: BY5PR04MB6993:
x-microsoft-antispam-prvs: <BY5PR04MB6993035EFCE8E769DFB96231E7C30@BY5PR04MB6993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(186003)(66446008)(7696005)(6506007)(33656002)(53546011)(76116006)(110136005)(5660300002)(66476007)(316002)(26005)(66556008)(54906003)(64756008)(4326008)(66946007)(52536014)(55016002)(9686003)(478600001)(81166006)(2906002)(8936002)(81156014)(86362001)(8676002)(30864003)(71200400001)(579004)(559001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BM+8+lYk8yQZRUHrk7kOgLu+rNaS0QS91fNPjksTHrb4tBAhHz1CyavCr6wSAMal78dh9bNciyYA3YdhCyGu6FOd7zU9qYToE/3B3lh8VI6C3q8h7MVjvovi9+KjGgqN1fAl+LZcgjgz7QSelzS/LHMrblxY/+fMyQzcb0d7S4AETeWFK0/xBt0PPMgWol7YQ32S2iGZ7uCY9q3bmt4kU382pJYjOnKCbExa63P9sBB6HWdDhLMgXFHpxRxNJg1jrQvcm2fdo/CoUMjvlo42ufrDT6BWWeR4EXH2pjkwge3s+Qtoz70idAa6vF1Rv/cbjq1L/kAo1axKKnuArzRackzNIekIxDD+A8DOml+etpN+4czMUCHevtkuz6KausGBjsvcwkNWR7QvM8oO3A2cLtX+LW0ddzd5k9RLxSgSXNfLm00mD5iTlmle57+gqe42
x-ms-exchange-antispam-messagedata: nrB4lXoXOj2MBJWiMSco5+DKRi9xJPjszWjTX+/Ek+n/r6q6OgTc18A90JTLN6RXSGjT+J2dFD1A7M+OdQyJ+4nCyK1iLk9MWdEDMiE3vlbPOuQM1K22DzYW2qFSx9q34BDn2bv7v/3fnz7YSM0toA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 761a65b5-70bb-4532-86ef-08d7daa2ec6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 03:22:38.0325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fA9fVrHMsPPdFqCppRS87ebW2HM0a7eD/byoaw//XIXZVIAubf4ffJGfP0sWySU5t9AXUgC/HIgK9fjoxGEz4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6993
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0373MlRA004311
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/11] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:29, Hannes Reinecke wrote:
> Implement handling for metadata version 2. The new metadata adds
> a label and UUID for the device mapper device, and additional UUID
> for the underlying block devices.
> It also allows for an additional regular drive to be used for
> emulating random access zones. The emulated zones will be placed
> logically in front of the zones from the zoned block device, causing
> the superblocks and metadata to be stored on that device.
> The first zone of the original zoned device will be used to hold
> another, tertiary copy of the metadata. This copy carries a
> generation number of 0 and is never updated; it's just used
> for identification.
> The zones are spaced equidistant, which means that any eventual
> runt zones will be counted, too. They are marked as 'offline' and
> ignored when selecting zones.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 269 +++++++++++++++++++++++++++------
>  drivers/md/dm-zoned-target.c   | 128 +++++++++-------
>  drivers/md/dm-zoned.h          |   7 +-
>  3 files changed, 304 insertions(+), 100 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index e036ba4bfe57..e498e1aee915 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -16,7 +16,7 @@
>  /*
>   * Metadata version.
>   */
> -#define DMZ_META_VER	1
> +#define DMZ_META_VER	2
>  
>  /*
>   * On-disk super block magic.
> @@ -69,8 +69,17 @@ struct dmz_super {
>  	/* Checksum */
>  	__le32		crc;			/*  48 */
>  
> +	/* DM-Zoned label */
> +	u8		dmz_label[32];		/*  80 */
> +
> +	/* DM-Zoned UUID */
> +	u8		dmz_uuid[16];		/*  96 */
> +
> +	/* Device UUID */
> +	u8		dev_uuid[16];		/* 112 */
> +
>  	/* Padding to full 512B sector */
> -	u8		reserved[464];		/* 512 */
> +	u8		reserved[400];		/* 512 */
>  };
>  
>  /*
> @@ -135,6 +144,8 @@ struct dmz_metadata {
>  	struct dmz_dev		*dev;
>  
>  	char			devname[BDEVNAME_SIZE];
> +	char			label[BDEVNAME_SIZE];
> +	uuid_t			uuid;
>  
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
> @@ -161,8 +172,9 @@ struct dmz_metadata {
>  	/* Zone information array */
>  	struct dm_zone		*zones;
>  
> -	struct dmz_sb		sb[2];
> +	struct dmz_sb		sb[3];
>  	unsigned int		mblk_primary;
> +	unsigned int		sb_version;
>  	u64			sb_gen;
>  	unsigned int		min_nr_mblks;
>  	unsigned int		max_nr_mblks;
> @@ -195,16 +207,16 @@ struct dmz_metadata {
>  };
>  
>  #define dmz_zmd_info(zmd, format, args...)	\
> -	DMINFO("(%s): " format, (zmd)->devname, ## args)
> +	DMINFO("(%s): " format, (zmd)->label, ## args)
>  
>  #define dmz_zmd_err(zmd, format, args...)	\
> -	DMERR("(%s): " format, (zmd)->devname, ## args)
> +	DMERR("(%s): " format, (zmd)->label, ## args)
>  
>  #define dmz_zmd_warn(zmd, format, args...)	\
> -	DMWARN("(%s): " format, (zmd)->devname, ## args)
> +	DMWARN("(%s): " format, (zmd)->label, ## args)
>  
>  #define dmz_zmd_debug(zmd, format, args...)	\
> -	DMDEBUG("(%s): " format, (zmd)->devname, ## args)
> +	DMDEBUG("(%s): " format, (zmd)->label, ## args)
>  /*
>   * Various accessors
>   */
> @@ -215,16 +227,41 @@ unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->zone_nr_sectors_shift;
> +	unsigned int zone_id;
> +
> +	if (WARN_ON(!zone))
> +		return 0;
> +
> +	zone_id = zone->id;
> +	if (zmd->dev[0].zone_offset &&
> +	    (zone_id >= zmd->dev[0].zone_offset))
> +		zone_id -= zmd->dev[0].zone_offset;
> +	return (sector_t)zone_id << zmd->zone_nr_sectors_shift;
>  }
>  
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->zone_nr_blocks_shift;
> +	unsigned int zone_id;
> +
> +	if (WARN_ON(!zone))
> +		return 0;
> +
> +	zone_id = zone->id;
> +	if (zmd->dev[0].zone_offset &&
> +	    (zone_id >= zmd->dev[0].zone_offset))
> +		zone_id -= zmd->dev[0].zone_offset;
> +	return (sector_t)zone_id << zmd->zone_nr_blocks_shift;

The zone_id calculation is repeated. May be add a simple helper
dmz_dev_zone_id() for it ?

>  }
>  
>  struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> +	if (WARN_ON(!zone))
> +		return &zmd->dev[0];
> +
> +	if (zmd->dev[0].zone_offset &&
> +	    zone->id < zmd->dev[0].zone_offset)
> +			return &zmd->dev[1];

Isn't that return &zmd->dev[0]; ? if zone->id < zmd->dev[0].zone_offset then you
are within the first dev, no ?

> +
>  	return &zmd->dev[0];

And this would be return &zmd->dev[1];

>  }
>  
> @@ -280,7 +317,7 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>  
>  const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  {
> -	return (const char *)zmd->devname;
> +	return (const char *)zmd->label;
>  }
>  
>  bool dmz_check_dev(struct dmz_metadata *zmd)
> @@ -687,6 +724,9 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
>  	struct bio *bio;
>  	int ret;
>  
> +	if (WARN_ON(!dev))
> +		return -EIO;
> +
>  	if (dmz_bdev_is_dying(dev))
>  		return -EIO;
>  
> @@ -711,7 +751,8 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
>   */
>  static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  {
> -	sector_t block = zmd->sb[set].block;
> +	unsigned int sb_zid = dmz_id(zmd, zmd->sb[set].zone);
> +	sector_t sb_block = sb_zid << zmd->zone_nr_blocks_shift;
>  	struct dmz_mblock *mblk = zmd->sb[set].mblk;
>  	struct dmz_super *sb = zmd->sb[set].sb;
>  	struct dmz_dev *dev = zmd->sb[set].dev;
> @@ -719,11 +760,17 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  	int ret;
>  
>  	sb->magic = cpu_to_le32(DMZ_MAGIC);
> -	sb->version = cpu_to_le32(DMZ_META_VER);
> +
> +	sb->version = cpu_to_le32(zmd->sb_version);
> +	if (zmd->sb_version > 1) {
> +		uuid_copy((uuid_t *)sb->dmz_uuid, &zmd->uuid);
> +		memcpy(sb->dmz_label, zmd->label, BDEVNAME_SIZE);
> +		uuid_copy((uuid_t *)sb->dev_uuid, &dev->uuid);
> +	}
>  
>  	sb->gen = cpu_to_le64(sb_gen);
>  
> -	sb->sb_block = cpu_to_le64(block);
> +	sb->sb_block = cpu_to_le64(sb_block);
>  	sb->nr_meta_blocks = cpu_to_le32(zmd->nr_meta_blocks);
>  	sb->nr_reserved_seq = cpu_to_le32(zmd->nr_reserved_seq);
>  	sb->nr_chunks = cpu_to_le32(zmd->nr_chunks);
> @@ -734,7 +781,8 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  	sb->crc = 0;
>  	sb->crc = cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb, DMZ_BLOCK_SIZE));
>  
> -	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, block, mblk->page);
> +	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block,
> +			     mblk->page);
>  	if (ret == 0)
>  		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
>  
> @@ -915,6 +963,23 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  	u32 crc, stored_crc;
>  	u64 gen;
>  
> +	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
> +		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
> +			    DMZ_MAGIC, le32_to_cpu(sb->magic));
> +		return -ENXIO;
> +	}
> +
> +	zmd->sb_version = le32_to_cpu(sb->version);
> +	if (zmd->sb_version > DMZ_META_VER) {
> +		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
> +			    DMZ_META_VER, zmd->sb_version);
> +		return -EINVAL;
> +	}
> +	if ((zmd->sb_version < 1) && (set == 2)) {
> +		dmz_dev_err(dev, "Tertiary superblocks are not supported");
> +		return -EINVAL;
> +	}
> +
>  	gen = le64_to_cpu(sb->gen);
>  	stored_crc = le32_to_cpu(sb->crc);
>  	sb->crc = 0;
> @@ -925,18 +990,41 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  		return -ENXIO;
>  	}
>  
> -	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
> -		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
> -			    DMZ_MAGIC, le32_to_cpu(sb->magic));
> -		return -ENXIO;
> -	}
> +	if (zmd->sb_version > 1) {
> +		if (uuid_is_null((uuid_t *)sb->dmz_uuid)) {
> +			dmz_dev_err(dev, "sb%d: NULL DM-Zoned uuid", set);
> +			return -ENXIO;
> +		} else if (uuid_is_null(&zmd->uuid)) {
> +			uuid_copy(&zmd->uuid, (uuid_t *)sb->dmz_uuid);
> +		} else if (!uuid_equal(&zmd->uuid, (uuid_t *)sb->dmz_uuid)) {
> +			dmz_dev_err(dev, "sb%d: mismatching DM-Zoned uuid, "
> +				    "is %pUl expected %pUl", set,
> +				    (uuid_t *)sb->dmz_uuid, &zmd->uuid);
> +			return -ENXIO;
> +		}
> +		if (!strlen(zmd->label))
> +			memcpy(zmd->label, sb->dmz_label, BDEVNAME_SIZE);

We should probably ensure that label is always 0 terminated here. If the
metadata label uses all BDEVNAME_SIZE characters, zmd->label will too since it
is a BDEVNAME_SIZE long string. Make it BDEVNAME_SIZE + 1 long ?

> +		else if (memcmp(zmd->label, sb->dmz_label, BDEVNAME_SIZE)) {
> +			dmz_dev_err(dev, "sb%d: mismatching DM-Zoned label, "
> +				    "is %s expected %s",
> +				    set, sb->dmz_label, zmd->label);
> +			return -ENXIO;
> +		}
> +		if (uuid_is_null((uuid_t *)sb->dev_uuid)) {
> +			dmz_dev_err(dev, "sb%d: NULL device uuid", set);
> +			return -ENXIO;
> +		}
> +		uuid_copy(&dev->uuid, (uuid_t *)sb->dev_uuid);
>  
> -	if (le32_to_cpu(sb->version) != DMZ_META_VER) {
> -		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
> -			    DMZ_META_VER, le32_to_cpu(sb->version));
> -		return -ENXIO;
> +		if (set == 2) {
> +			if (gen != 0) {
> +				dmz_dev_err(dev, "sb%d: Invalid generation %llu",
> +					    set, gen);
> +				return -ENXIO;
> +			}
> +			return 0;
> +		}
>  	}
> -
>  	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
>  		>> zmd->zone_nr_blocks_shift;
>  	if (!nr_meta_zones ||
> @@ -1185,21 +1273,37 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		      "Using super block %u (gen %llu)",
>  		      zmd->mblk_primary, zmd->sb_gen);
>  
> +	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
> +		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
> +		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
> +		ret = dmz_get_sb(zmd, 2);
> +		if (ret) {
> +			dmz_dev_err(zmd->sb[2].dev,
> +				    "Read tertiary super block failed");
> +			return ret;
> +		}
> +		ret = dmz_check_sb(zmd, 2);
> +		if (ret == -EINVAL)
> +			return ret;
> +	}
>  	return 0;
>  }
>  
>  /*
>   * Initialize a zone descriptor.
>   */
> -static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
> +static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  {
>  	struct dmz_metadata *zmd = data;
> +	int idx = num + zmd->dev[0].zone_offset;
>  	struct dm_zone *zone = &zmd->zones[idx];
> -	struct dmz_dev *dev = zmd->dev;
>  
> -	/* Ignore the eventual last runt (smaller) zone */
>  	if (blkz->len != zmd->zone_nr_sectors) {
> -		if (blkz->start + blkz->len == dev->capacity)
> +		if (zmd->sb_version > 1) {
> +			/* Ignore the eventual runt (smaller) zone */
> +			set_bit(DMZ_OFFLINE, &zone->flags);
> +			return 0;
> +		} else if (blkz->start + blkz->len == dev->capacity)
>  			return 0;
>  		return -ENXIO;
>  	}
> @@ -1235,10 +1339,14 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  		if (dmz_is_rnd(zone)) {
>  			zmd->nr_rnd_zones++;
>  			if (!zmd->sb[0].zone) {
> -				/* Super block zone */
> +				/* Primary super block zone */
>  				zmd->sb[0].zone = zone;
>  			}
>  		}
> +		if (zmd->dev[1].bdev && !zmd->sb[2].zone) {
> +			/* Tertiary superblock zone */
> +			zmd->sb[2].zone = zone;
> +		}
>  	}
>  
>  	return 0;
> @@ -1259,11 +1367,10 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
>   */
>  static int dmz_init_zones(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = &zmd->dev[0];
>  	int ret;
>  
>  	/* Init */
> -	zmd->zone_nr_sectors = dev->zone_nr_sectors;
> +	zmd->zone_nr_sectors = zmd->dev[0].zone_nr_sectors;
>  	zmd->zone_nr_sectors_shift = ilog2(zmd->zone_nr_sectors);
>  	zmd->zone_nr_blocks = dmz_sect2blk(zmd->zone_nr_sectors);
>  	zmd->zone_nr_blocks_shift = ilog2(zmd->zone_nr_blocks);
> @@ -1274,7 +1381,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  					DMZ_BLOCK_SIZE_BITS);
>  
>  	/* Allocate zone array */
> -	zmd->nr_zones = dev->nr_zones;
> +	zmd->nr_zones = zmd->dev[0].nr_zones;
> +	if (zmd->dev[1].bdev)
> +		zmd->nr_zones += zmd->dev[1].nr_zones;
> +
> +	if (!zmd->nr_zones) {
> +		DMERR("(%s): No zones found", zmd->devname);
> +		return -ENXIO;
> +	}
>  	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
>  	if (!zmd->zones)
>  		return -ENOMEM;
> @@ -1282,13 +1396,43 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  	DMINFO("(%s): Using %zu B for zone information",
>  	       zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
>  
> +	if (zmd->dev[1].bdev) {
> +		int idx;
> +		sector_t zone_offset = 0;
> +
> +		for(idx = 0; idx < zmd->dev[1].nr_zones; idx++) {
> +			struct dm_zone *zone = &zmd->zones[idx];
> +
> +			INIT_LIST_HEAD(&zone->link);
> +			atomic_set(&zone->refcount, 0);
> +			zone->id = idx;
> +			zone->chunk = DMZ_MAP_UNMAPPED;
> +			set_bit(DMZ_RND, &zone->flags);
> +			zone->wp_block = 0;
> +			zmd->nr_rnd_zones++;
> +			zmd->nr_useable_zones++;
> +			if (zmd->dev[1].capacity - zone_offset <
> +			    zmd->zone_nr_sectors) {
> +				/* Disable runt zone */
> +				set_bit(DMZ_OFFLINE, &zone->flags);
> +				break;
> +			}
> +			zone_offset += zmd->zone_nr_sectors;
> +			if (!zmd->sb[0].zone) {
> +				/* Primary superblock zone */
> +				zmd->sb[0].zone = zone;
> +			}
> +		}
> +		zmd->dev[0].zone_offset = zmd->dev[1].nr_zones;

This is assuming that dev[1] always is a regular device. What if this is a zoned
device ? E.g. do we want to prevent the case: zoned device with rnd zoned +
zoned device with no rnd zones ? I do not think it is an interesting use case,
but I do not see any reason for preventing it either as I do not think this will
change anything to the code beside the init zones. Thoughts ?

> +	}
> +
>  	/*
>  	 * Get zone information and initialize zone descriptors.  At the same
>  	 * time, determine where the super block should be: first block of the
>  	 * first randomly writable zone.
>  	 */
> -	ret = blkdev_report_zones(dev->bdev, 0, BLK_ALL_ZONES, dmz_init_zone,
> -				  zmd);
> +	ret = blkdev_report_zones(zmd->dev[0].bdev, 0, BLK_ALL_ZONES,
> +				  dmz_init_zone, zmd);
>  	if (ret < 0) {
>  		dmz_drop_zones(zmd);
>  		return ret;
> @@ -1325,6 +1469,9 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	unsigned int noio_flag;
>  	int ret;
>  
> +	if (dev->flags & DMZ_BDEV_REGULAR)
> +		return 0;
> +
>  	/*
>  	 * Get zone information from disk. Since blkdev_report_zones() uses
>  	 * GFP_KERNEL by default for memory allocations, set the per-task
> @@ -1741,7 +1888,8 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
> -			if (dmz_bdev_is_dying(zmd->dev)) {
> +			if (dmz_bdev_is_dying(&zmd->dev[0]) ||
> +			    dmz_bdev_is_dying(&zmd->dev[1])) {
>  				dzone = ERR_PTR(-EIO);
>  				goto out;
>  			}
> @@ -1842,7 +1990,8 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
> -		if (dmz_bdev_is_dying(zmd->dev)) {
> +		if (dmz_bdev_is_dying(&zmd->dev[0]) ||
> +		    dmz_bdev_is_dying(&zmd->dev[1])) {
>  			bzone = ERR_PTR(-EIO);
>  			goto out;
>  		}
> @@ -2480,18 +2629,34 @@ void dmz_print_dev(struct dmz_metadata *zmd, int num)
>  {
>  	struct dmz_dev *dev = &zmd->dev[num];
>  
> -	dmz_dev_info(dev, "Host-%s zoned block device",
> -		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
> -		     "aware" : "managed");
> -	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
> -		     (u64)dev->capacity);
> -	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> -		     dev->nr_zones, (u64)zmd->zone_nr_sectors);
> +	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE)
> +		dmz_dev_info(dev, "Regular block device");
> +	else
> +		dmz_dev_info(dev, "Host-%s zoned block device",
> +			     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
> +			     "aware" : "managed");
> +	if (zmd->sb_version > 1) {
> +		sector_t sector_offset =
> +			dev->zone_offset << zmd->zone_nr_sectors_shift;
> +
> +		dmz_dev_info(dev, "  uuid %pUl", &dev->uuid);
> +		dmz_dev_info(dev, "  %llu 512-byte logical sectors (offset %llu)",
> +			     (u64)dev->capacity, (u64)sector_offset);
> +		dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors (offset %llu)",
> +			     dev->nr_zones, (u64)zmd->zone_nr_sectors,
> +			     (u64)dev->zone_offset);
> +	} else {
> +		dmz_dev_info(dev, "  %llu 512-byte logical sectors",
> +			     (u64)dev->capacity);
> +		dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> +			     dev->nr_zones, (u64)zmd->zone_nr_sectors);
> +	}
>  }
>  /*
>   * Initialize the zoned metadata.
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
> +int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
> +		     struct dmz_metadata **metadata,
>  		     const char *devname)
>  {
>  	struct dmz_metadata *zmd;
> @@ -2544,7 +2709,13 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
>  			goto err;
>  		set_bit(DMZ_META, &zone->flags);
>  	}
> -
> +	if (zmd->sb[2].zone) {
> +		zid = dmz_id(zmd, zmd->sb[2].zone);
> +		zone = dmz_get(zmd, zid);
> +		if (!zone)
> +			goto err;
> +		set_bit(DMZ_META, &zone->flags);
> +	}
>  	/* Load mapping table */
>  	ret = dmz_load_mapping(zmd);
>  	if (ret)
> @@ -2569,8 +2740,14 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
>  		goto err;
>  	}
>  
> -	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", DMZ_META_VER);
> +	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
> +	if (zmd->sb_version > 1) {
> +		dmz_zmd_info(zmd, "DM UUID %pUl", &zmd->uuid);
> +		dmz_zmd_info(zmd, "DM Label %s", zmd->label);
> +	}
>  	dmz_print_dev(zmd, 0);
> +	if (zmd->dev[1].bdev)
> +		dmz_print_dev(zmd, 1);
>  
>  	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
>  		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index ccf90608f434..4cfb34b38659 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -38,7 +38,7 @@ struct dm_chunk_work {
>   * Target descriptor.
>   */
>  struct dmz_target {
> -	struct dm_dev		*ddev;
> +	struct dm_dev		*ddev[2];

Form the code above, ddev[1] is the regular device and ddev[0] the zoned device.
I would really prefer to have that reversed as the ddev array index would
increase together with target sector/zone id instead of being reversed. That
would be far less confusing I think.

>  
>  	unsigned long		flags;
>  
> @@ -223,6 +223,9 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dmz_dev *dev,
>  		}
>  
>  		if (nr_blocks) {
> +			if (rzone != zone)
> +				dev = dmz_zone_to_dev(zmd, rzone);
> +
>  			/* Valid blocks found: read them */
>  			nr_blocks = min_t(unsigned int, nr_blocks, end_block - chunk_block);
>  			ret = dmz_submit_bio(dmz, dev, rzone, bio,
> @@ -298,6 +301,7 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  		return -EROFS;
>  
>  	/* Submit write */
> +	dev = dmz_zone_to_dev(zmd, bzone);
>  	ret = dmz_submit_bio(dmz, dev, bzone, bio, chunk_block, nr_blocks);
>  	if (ret)
>  		return ret;
> @@ -591,6 +595,10 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>   */
>  bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev)
>  {
> +	/* Device not configured, no error */
> +	if (!dmz_dev->bdev)
> +		return false;
> +
>  	if (dmz_dev->flags & DMZ_BDEV_DYING)
>  		return true;
>  
> @@ -698,60 +706,47 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  /*
>   * Get zoned device information.
>   */
> -static int dmz_get_zoned_device(struct dm_target *ti, char *path)
> +static int dmz_get_zoned_device(struct dm_target *ti, char *path,
> +				struct dmz_dev *dev, int num)
>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct request_queue *q;
> -	struct dmz_dev *dev;
> -	sector_t aligned_capacity;
>  	int ret;
>  
>  	/* Get the target device */
> -	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table), &dmz->ddev);
> +	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table),
> +			    &dmz->ddev[num]);
>  	if (ret) {
>  		ti->error = "Get target device failed";
> -		dmz->ddev = NULL;
> +		dmz->ddev[num] = NULL;
>  		return ret;
>  	}
>  
> -	dev = kzalloc(sizeof(struct dmz_dev), GFP_KERNEL);
> -	if (!dev) {
> -		ret = -ENOMEM;
> -		goto err;
> -	}
> -
> -	dev->bdev = dmz->ddev->bdev;
> +	dev->bdev = dmz->ddev[num]->bdev;
>  	(void)bdevname(dev->bdev, dev->name);
>  
> -	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
> -		ti->error = "Not a zoned block device";
> -		ret = -EINVAL;
> -		goto err;
> -	}
> +	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE)
> +		dev->flags = DMZ_BDEV_REGULAR;

Do we want to disallow regular block dev for num == 1 (second device) ?
Or we actually do not care about the order in which devices are obtained from
the ctr arguments ?

>  
>  	q = bdev_get_queue(dev->bdev);
>  	dev->capacity = i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
> -	aligned_capacity = dev->capacity &
> -				~((sector_t)blk_queue_zone_sectors(q) - 1);
> -	if (ti->begin ||
> -	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
> -		ti->error = "Partial mapping not supported";
> -		ret = -EINVAL;
> -		goto err;
> +	if (ti->begin) {
> +		ti->error = "Partial mapping is not supported";
> +		dm_put_device(ti, dmz->ddev[num]);
> +		dmz->ddev[num] = NULL;
> +		return -EINVAL;
>  	}
>  
> -	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> -
> -	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
> -
> -	dmz->dev = dev;
> -
> +	if (num == 1) {
> +		dev->zone_nr_sectors = dmz->dev[0].zone_nr_sectors;
> +		dev->nr_zones = dev->capacity / dev->zone_nr_sectors;
> +		if (dev->capacity % dev->nr_zones)
> +			dev->nr_zones++;
> +	} else {
> +		dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> +		dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
> +	}
>  	return 0;
> -err:
> -	dm_put_device(ti, dmz->ddev);
> -	kfree(dev);
> -
> -	return ret;
>  }
>  
>  /*
> @@ -761,9 +756,12 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
>  
> -	dm_put_device(ti, dmz->ddev);
> -	kfree(dmz->dev);
> -	dmz->dev = NULL;
> +	if (dmz->ddev[1]) {
> +		dm_put_device(ti, dmz->ddev[1]);
> +		dmz->ddev[1] = NULL;
> +	}
> +	dm_put_device(ti, dmz->ddev[0]);
> +	dmz->ddev[0] = NULL;
>  }
>  
>  /*
> @@ -772,11 +770,10 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>  static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  {
>  	struct dmz_target *dmz;
> -	struct dmz_dev *dev;
>  	int ret;
>  
>  	/* Check arguments */
> -	if (argc != 1) {
> +	if (argc < 1 || argc > 2) {
>  		ti->error = "Invalid argument count";
>  		return -EINVAL;
>  	}
> @@ -787,18 +784,29 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		ti->error = "Unable to allocate the zoned target descriptor";
>  		return -ENOMEM;
>  	}
> +	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
> +	if (!dmz->dev) {
> +		ti->error = "Unable to allocate the zoned device descriptors";
> +		kfree(dmz);
> +		return -ENOMEM;
> +	}
>  	ti->private = dmz;
>  
>  	/* Get the target zoned block device */
> -	ret = dmz_get_zoned_device(ti, argv[0]);
> -	if (ret) {
> -		dmz->ddev = NULL;
> +	ret = dmz_get_zoned_device(ti, argv[0], &dmz->dev[0], 0);
> +	if (ret)
>  		goto err;
> +
> +	if (argc == 2) {
> +		ret = dmz_get_zoned_device(ti, argv[1], &dmz->dev[1], 1);
> +		if (ret) {
> +			dmz_put_zoned_device(ti);
> +			goto err;
> +		}
>  	}
>  
>  	/* Initialize metadata */
> -	dev = dmz->dev;
> -	ret = dmz_ctr_metadata(dev, &dmz->metadata,
> +	ret = dmz_ctr_metadata(dmz->dev, argc, &dmz->metadata,
>  			       dm_table_device_name(ti->table));
>  	if (ret) {
>  		ti->error = "Metadata initialization failed";
> @@ -875,6 +883,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  err_dev:
>  	dmz_put_zoned_device(ti);
>  err:
> +	kfree(dmz->dev);
>  	kfree(dmz);
>  
>  	return ret;
> @@ -905,6 +914,7 @@ static void dmz_dtr(struct dm_target *ti)
>  
>  	mutex_destroy(&dmz->chunk_lock);
>  
> +	kfree(dmz->dev);
>  	kfree(dmz);
>  }
>  
> @@ -979,10 +989,17 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  			       iterate_devices_callout_fn fn, void *data)
>  {
>  	struct dmz_target *dmz = ti->private;
> -	struct dmz_dev *dev = dmz->dev;
> -	sector_t capacity = dev->capacity & ~(dmz_zone_nr_sectors(dmz->metadata) - 1);
> -
> -	return fn(ti, dmz->ddev, 0, capacity, data);
> +	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
> +	sector_t capacity;
> +	int r;
> +
> +	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
> +	r = fn(ti, dmz->ddev[0], 0, capacity, data);
> +	if (!r && dmz->ddev[1]) {
> +		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
> +		r = fn(ti, dmz->ddev[1], 0, capacity, data);
> +	}
> +	return r;
>  }
>  
>  static void dmz_status(struct dm_target *ti, status_type_t type,
> @@ -992,6 +1009,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  	struct dmz_target *dmz = ti->private;
>  	ssize_t sz = 0;
>  	char buf[BDEVNAME_SIZE];
> +	struct dmz_dev *dev;
>  
>  	switch (type) {
>  	case STATUSTYPE_INFO:
> @@ -1005,8 +1023,14 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  		       dmz_nr_seq_zones(dmz->metadata));
>  		break;
>  	case STATUSTYPE_TABLE:
> -		format_dev_t(buf, dmz->dev->bdev->bd_dev);
> +		dev = &dmz->dev[0];
> +		format_dev_t(buf, dev->bdev->bd_dev);
>  		DMEMIT("%s ", buf);
> +		if (dmz->dev[1].bdev) {
> +			dev = &dmz->dev[1];
> +			format_dev_t(buf, dev->bdev->bd_dev);
> +			DMEMIT("%s ", buf);
> +		}
>  		break;
>  	}
>  	return;
> @@ -1028,7 +1052,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
> -	.version	 = {1, 1, 0},
> +	.version	 = {1, 2, 0},
>  	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>  	.module		 = THIS_MODULE,
>  	.ctr		 = dmz_ctr,
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 808ffbef0da3..6eb37b639f24 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -52,10 +52,12 @@ struct dmz_dev {
>  	struct block_device	*bdev;
>  
>  	char			name[BDEVNAME_SIZE];
> +	uuid_t			uuid;
>  
>  	sector_t		capacity;
>  
>  	unsigned int		nr_zones;
> +	unsigned int		zone_offset;
>  
>  	unsigned int		flags;
>  
> @@ -69,6 +71,7 @@ struct dmz_dev {
>  /* Device flags. */
>  #define DMZ_BDEV_DYING		(1 << 0)
>  #define DMZ_CHECK_BDEV		(2 << 0)
> +#define DMZ_BDEV_REGULAR	(4 << 0)
>  
>  /*
>   * Zone descriptor.
> @@ -163,8 +166,8 @@ struct dmz_reclaim;
>  /*
>   * Functions defined in dm-zoned-metadata.c
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd,
> -		     const char *devname);
> +int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
> +		     struct dmz_metadata **zmd, const char *devname);
>  void dmz_dtr_metadata(struct dmz_metadata *zmd);
>  int dmz_resume_metadata(struct dmz_metadata *zmd);
>  
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

