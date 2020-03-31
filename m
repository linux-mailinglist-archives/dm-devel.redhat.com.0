Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8B09619BC98
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y+tdHnSPQBeA5BcgNgNRMkGOjy3QesY/gpQbwq+R9rs=;
	b=T74rAEuQKilr6KLrdCioOMHv6fNSIYTOZuIwVxSnaTrUqjHJj2VV+DWfaBDJjrUqzJFczI
	iZ/mDS//MKiFIozroPUYxi7v75J5lLCJPL6v+L6p6TQUCWMkbKVIbeh9s3+TyclTkN6A6W
	/6Ln3TZl7zf9Vf3PHBlb3AFDHf8nXoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-eTzdfyIUP4iMFCNS8OnTEg-1; Thu, 02 Apr 2020 03:20:53 -0400
X-MC-Unique: eTzdfyIUP4iMFCNS8OnTEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B59358018A7;
	Thu,  2 Apr 2020 07:20:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D311C947;
	Thu,  2 Apr 2020 07:20:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08FA3944D1;
	Thu,  2 Apr 2020 07:20:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V9BWRm024063 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 05:11:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98AB3DBF04; Tue, 31 Mar 2020 09:11:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 943E6D9609
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 09:11:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97558800297
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 09:11:30 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-345-ZJda-6mgPeCmqFfUF5II7Q-1; Tue, 31 Mar 2020 05:11:28 -0400
X-MC-Unique: ZJda-6mgPeCmqFfUF5II7Q-1
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02V9BQQH028612; Tue, 31 Mar 2020 09:11:27 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2120.oracle.com with ESMTP id 303yun11g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2020 09:11:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02V98B1x063672; Tue, 31 Mar 2020 09:11:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 302g9ww1su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2020 09:11:25 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02V9BOl3014587;
	Tue, 31 Mar 2020 09:11:24 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 31 Mar 2020 02:11:24 -0700
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-4-hare@suse.de>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <93a26ed9-6f6e-2a4d-38d3-3fb76fa91e70@oracle.com>
Date: Tue, 31 Mar 2020 17:11:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20200327071459.67796-4-hare@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
	phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003310082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
	lowpriorityscore=0
	malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
	bulkscore=0
	suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003310082
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 03:20:12 -0400
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
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

On 3/27/20 3:14 PM, Hannes Reinecke wrote:
> Add 'V2' metadata which includes UUIDs for the dmz set and for
> the device itself.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Bob Liu <bob.liu@oracle.com>

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
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

