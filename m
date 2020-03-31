Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7E33E19BC97
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 09:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585812053;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l/w3EzSqVKKu1QZ6jOHYgPEAW/M8IXoY04CtVxKVQyA=;
	b=MzuNi8VBdaudGDyhYDQ9r/QFYkYB58XyiPvvM9z5KOHWnykMVx3JHJPE/qdlNpWqdkZosW
	DWQsdN4MkbM5M7L2kKHX7RVjP8tdFbnQkLfiIlvNzCJBe3viYFJ5JDunmBkjtsJlve8Eez
	N6H6xXtx2/ZAQJbCDGog3P/Ho56tudE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Y0gSgkEnN1SOWe26rOzTNA-1; Thu, 02 Apr 2020 03:20:51 -0400
X-MC-Unique: Y0gSgkEnN1SOWe26rOzTNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95D8A18A6EC4;
	Thu,  2 Apr 2020 07:20:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6630D19C69;
	Thu,  2 Apr 2020 07:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E810718089CF;
	Thu,  2 Apr 2020 07:20:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V9BEr7024046 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 05:11:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FCB92093CC8; Tue, 31 Mar 2020 09:11:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B99220267F2
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 09:11:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E69185A794
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 09:11:12 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-LQ3I3T17O_iSDapJRwgZJw-1; Tue, 31 Mar 2020 05:11:10 -0400
X-MC-Unique: LQ3I3T17O_iSDapJRwgZJw-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02V9B05k177366; Tue, 31 Mar 2020 09:11:08 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2120.oracle.com with ESMTP id 303aqhewwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2020 09:11:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	02V98Hvf003864; Tue, 31 Mar 2020 09:11:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 302g4r8s1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2020 09:11:07 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02V9B68O008227;
	Tue, 31 Mar 2020 09:11:06 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 31 Mar 2020 02:11:05 -0700
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-3-hare@suse.de>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <bf9d0c94-9eee-4463-4fcd-a56cf97e8039@oracle.com>
Date: Tue, 31 Mar 2020 17:10:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20200327071459.67796-3-hare@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	bulkscore=0 suspectscore=2
	mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003310082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	phishscore=0 clxscore=1015
	malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
	priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=2
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2003310082
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Apr 2020 03:20:12 -0400
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/27/20 3:14 PM, Hannes Reinecke wrote:
> Instead of storing just the first superblock zone and calculate
> the secondary relative to that we should be using an array for
> holding the superblock zones.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Reviewed-by: Bob Liu <bob.liu@oracle.com>

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
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

