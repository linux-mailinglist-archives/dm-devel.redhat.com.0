Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0B79EF4161
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 08:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573198247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=nvC6W3SzpGjkQKHpXQVmfpiyiSB87ogCAY0pEpg5ubE=;
	b=JVw7pQsEbeh9ZT8TM+qvIH7Px7sY9C3AoFBaUDonZvRQItaT3EU9FArRH1gRHpdkl475PK
	X7/71swEdwqf+ze/jkaYBktr02NhtUgLAATlI42pPf+l3fzuo8uIy7kjRiUbJPVEP0k2dh
	11SVuyYLNuEFUJL/u6F7rXZcB3hwNWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-0IC9m9-xNyaOucsBs5Wexw-1; Fri, 08 Nov 2019 02:30:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B996107ACC4;
	Fri,  8 Nov 2019 07:30:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA405DA7E;
	Fri,  8 Nov 2019 07:30:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2CEF4BB65;
	Fri,  8 Nov 2019 07:30:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA87SuYL017610 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 02:28:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 46C101001938; Fri,  8 Nov 2019 07:28:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F2981001DC0;
	Fri,  8 Nov 2019 07:28:50 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C2D4308FC23;
	Fri,  8 Nov 2019 07:28:26 +0000 (UTC)
IronPort-SDR: Lk5I/pExm5TYSdyPitSOXqHTvkLvI/OMrCA2Zd39EWIRb6JtCznKCkLRLF3I7gs+Y4UgsYsa04
	8EjsqIqD7jwTEk69FHaLIqNA5ZvOUz1ZGU+pCOHuSFgpuMzqsgItEo3RqNyCSs7DMW4X4PVQYx
	4eRgyxsbbNMnk+KR9DV5N2hWyLtbuqbe8p6sVByRDF0IVSyi3NY8Sxgyf2UZXCFYFpX9pnTZ6Z
	WwwHeEArhcbdTyxC6NWTRU2Os6Bx0/RVHpHyo9/TJKS9IaUeceZbq+cBnWEHhBVlxx+Ihsebl+
	kz8=
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="124065165"
Received: from mail-dm3nam03lp2055.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.55])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 15:28:16 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5206.namprd04.prod.outlook.com (20.178.51.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Fri, 8 Nov 2019 07:28:15 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2430.023;
	Fri, 8 Nov 2019 07:28:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 4/9] block: Remove partition support for zoned block
	devices
Thread-Index: AQHVldfeu12TZig53UG+k8UT5XvAMg==
Date: Fri, 8 Nov 2019 07:28:15 +0000
Message-ID: <BYAPR04MB58161069E47E24E188FC91EEE77B0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
	<20191108015702.233102-5-damien.lemoal@wdc.com>
	<160bfb8f-2793-af74-df2b-5f30ae9383db@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e99cd6f5-594e-440a-aa7a-08d7641d384b
x-ms-traffictypediagnostic: BYAPR04MB5206:
x-microsoft-antispam-prvs: <BYAPR04MB5206934BE7B4CC3B14741168E77B0@BYAPR04MB5206.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(199004)(189003)(478600001)(33656002)(66066001)(2501003)(316002)(25786009)(110136005)(52536014)(3846002)(6116002)(5660300002)(99286004)(14454004)(14444005)(256004)(102836004)(66556008)(64756008)(66446008)(2906002)(81166006)(486006)(91956017)(76116006)(71200400001)(71190400001)(66946007)(8676002)(66476007)(8936002)(9686003)(7416002)(55016002)(74316002)(446003)(305945005)(476003)(7736002)(229853002)(186003)(6246003)(6506007)(53546011)(26005)(6436002)(86362001)(76176011)(7696005)(81156014)(921003)(1121003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5206;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: przTLT6j71kTy6kg6TYhYq7/cVr+hH4MWhqTdsCbcUnADj6hyYr76PAbX7dy9t7ZSFfwPzpj0g6L4mHy3QyEJWW0e+CSUQ3fTSwn31SLnH4iK0XnjNU6n54eapNmypX+YGT8lQA6YoeT40l2bbRxuChFYk0XAcHcPOeQfrW6zLhoKStroHoOZ0pvbR5isondF026kb9FZ+T0SDC/EBxpxBZX+qypYSMVavk6I4OnwMw7dDbWLw+EiWnzVrgld/q2k32PAcgSQ8zTvPUT/0/LwbM+D4ZL31XrPDeZ3+9OHtFv0/aU+EJqIiEzIok6uTccsW8qAly8zwmE3OcVAssicJ918ySoLDgPMYiI85obPS9453zyJ/RM1otHs6a4X3xfQvYZBY+AS7rok2GHDBD5CcPmsyW/CUSj6ZwuJ+sM3oJMu2NwMybkHTFm7/98jV9j
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e99cd6f5-594e-440a-aa7a-08d7641d384b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 07:28:15.6057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DFudmtEauViss3XiZE/rfHREgGgagVqhL4ZRQPo8fVwNDNyRh2dC2jnbR9m0eL8fskDMK9sj6oU+eSCSdQJn2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5206
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Fri, 08 Nov 2019 07:28:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Fri, 08 Nov 2019 07:28:39 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com
	216.71.154.45 esa6.hgst.iphmx.com
	<prvs=208d19533=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA87SuYL017610
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/9] block: Remove partition support for
 zoned block devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 0IC9m9-xNyaOucsBs5Wexw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/11/08 16:17, Hannes Reinecke wrote:
> On 11/8/19 2:56 AM, Damien Le Moal wrote:
>> No known partitioning tool supports zoned block devices, especially the
>> host managed flavor with strong sequential write constraints.
>> Furthermore, there are also no known user nor use cases for partitioned
>> zoned block devices.
>>
>> This patch removes partition device creation for zoned block devices,
>> which allows simplifying the processing of zone commands for zoned
>> block devices. A warning is added if a partition table is found on the
>> device.
>>
>> For report zones operations no zone sector information remapping is
>> necessary anymore, simplifying the code. Of note is that remapping of
>> zone reports for DM targets is still necessary as done by
>> dm_remap_zone_report().
>>
>> Similarly, remaping of a zone reset bio is not necessary anymore.
>> Testing for the applicability of the zone reset all request also becomes
>> simpler and only needs to check that the number of sectors of the
>> requested zone range is equal to the disk capacity.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> ---
>>  block/blk-core.c          |  6 +---
>>  block/blk-zoned.c         | 62 ++++++--------------------------
>>  block/partition-generic.c | 74 +++++----------------------------------
>>  drivers/md/dm.c           |  3 --
>>  4 files changed, 21 insertions(+), 124 deletions(-)
>>
>> diff --git a/block/blk-core.c b/block/blk-core.c
>> index 3306a3c5bed6..df6b70476187 100644
>> --- a/block/blk-core.c
>> +++ b/block/blk-core.c
>> @@ -851,11 +851,7 @@ static inline int blk_partition_remap(struct bio *bio)
>>  	if (unlikely(bio_check_ro(bio, p)))
>>  		goto out;
>>  
>> -	/*
>> -	 * Zone management bios do not have a sector count but they do have
>> -	 * a start sector filled out and need to be remapped.
>> -	 */
>> -	if (bio_sectors(bio) || op_is_zone_mgmt(bio_op(bio))) {
>> +	if (bio_sectors(bio)) {
>>  		if (bio_check_eod(bio, part_nr_sects_read(p)))
>>  			goto out;
>>  		bio->bi_iter.bi_sector += p->start_sect;
>> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
>> index ea4e086ba00e..ae665e490858 100644
>> --- a/block/blk-zoned.c
>> +++ b/block/blk-zoned.c
>> @@ -93,32 +93,10 @@ unsigned int blkdev_nr_zones(struct block_device *bdev)
>>  	if (!blk_queue_is_zoned(q))
>>  		return 0;
>>  
>> -	return __blkdev_nr_zones(q, bdev->bd_part->nr_sects);
>> +	return __blkdev_nr_zones(q, get_capacity(bdev->bd_disk));
>>  }
>>  EXPORT_SYMBOL_GPL(blkdev_nr_zones);
>>  
>> -/*
>> - * Check that a zone report belongs to this partition, and if yes, fix its start
>> - * sector and write pointer and return true. Return false otherwise.
>> - */
>> -static bool blkdev_report_zone(struct block_device *bdev, struct blk_zone *rep)
>> -{
>> -	sector_t offset = get_start_sect(bdev);
>> -
>> -	if (rep->start < offset)
>> -		return false;
>> -
>> -	rep->start -= offset;
>> -	if (rep->start + rep->len > bdev->bd_part->nr_sects)
>> -		return false;
>> -
>> -	if (rep->type == BLK_ZONE_TYPE_CONVENTIONAL)
>> -		rep->wp = rep->start + rep->len;
>> -	else
>> -		rep->wp -= offset;
>> -	return true;
>> -}
>> -
>>  /**
>>   * blkdev_report_zones - Get zones information
>>   * @bdev:	Target block device
>> @@ -140,8 +118,7 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
>>  {
>>  	struct request_queue *q = bdev_get_queue(bdev);
>>  	struct gendisk *disk = bdev->bd_disk;
>> -	unsigned int i, nrz;
>> -	int ret;
>> +	sector_t capacity = get_capacity(disk);
>>  
>>  	if (!blk_queue_is_zoned(q))
>>  		return -EOPNOTSUPP;
>> @@ -154,27 +131,14 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
>>  	if (WARN_ON_ONCE(!disk->fops->report_zones))
>>  		return -EOPNOTSUPP;
>>  
>> -	if (!*nr_zones || sector >= bdev->bd_part->nr_sects) {
>> +	if (!*nr_zones || sector >= capacity) {
>>  		*nr_zones = 0;
>>  		return 0;
>>  	}
>>  
>> -	nrz = min(*nr_zones,
>> -		  __blkdev_nr_zones(q, bdev->bd_part->nr_sects - sector));
>> -	ret = disk->fops->report_zones(disk, get_start_sect(bdev) + sector,
>> -				       zones, &nrz);
>> -	if (ret)
>> -		return ret;
>> +	*nr_zones = min(*nr_zones, __blkdev_nr_zones(q, capacity - sector));
>>  
>> -	for (i = 0; i < nrz; i++) {
>> -		if (!blkdev_report_zone(bdev, zones))
>> -			break;
>> -		zones++;
>> -	}
>> -
>> -	*nr_zones = i;
>> -
>> -	return 0;
>> +	return disk->fops->report_zones(disk, sector, zones, nr_zones);
>>  }
>>  EXPORT_SYMBOL_GPL(blkdev_report_zones);
>>  
>> @@ -185,15 +149,11 @@ static inline bool blkdev_allow_reset_all_zones(struct block_device *bdev,
>>  	if (!blk_queue_zone_resetall(bdev_get_queue(bdev)))
>>  		return false;
>>  
>> -	if (sector || nr_sectors != part_nr_sects_read(bdev->bd_part))
>> -		return false;
>>  	/*
>> -	 * REQ_OP_ZONE_RESET_ALL can be executed only if the block device is
>> -	 * the entire disk, that is, if the blocks device start offset is 0 and
>> -	 * its capacity is the same as the entire disk.
>> +	 * REQ_OP_ZONE_RESET_ALL can be executed only if the number of sectors
>> +	 * of the applicable zone range is the entire disk.
>>  	 */
>> -	return get_start_sect(bdev) == 0 &&
>> -	       part_nr_sects_read(bdev->bd_part) == get_capacity(bdev->bd_disk);
>> +	return !sector && nr_sectors == get_capacity(bdev->bd_disk);
>>  }
>>  
>>  /**
>> @@ -218,6 +178,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
>>  {
>>  	struct request_queue *q = bdev_get_queue(bdev);
>>  	sector_t zone_sectors = blk_queue_zone_sectors(q);
>> +	sector_t capacity = get_capacity(bdev->bd_disk);
>>  	sector_t end_sector = sector + nr_sectors;
>>  	struct bio *bio = NULL;
>>  	int ret;
>> @@ -231,7 +192,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
>>  	if (!op_is_zone_mgmt(op))
>>  		return -EOPNOTSUPP;
>>  
>> -	if (!nr_sectors || end_sector > bdev->bd_part->nr_sects)
>> +	if (!nr_sectors || end_sector > capacity)
>>  		/* Out of range */
>>  		return -EINVAL;
>>  
>> @@ -239,8 +200,7 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
>>  	if (sector & (zone_sectors - 1))
>>  		return -EINVAL;
>>  
>> -	if ((nr_sectors & (zone_sectors - 1)) &&
>> -	    end_sector != bdev->bd_part->nr_sects)
>> +	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
>>  		return -EINVAL;
>>  
>>  	while (sector < end_sector) {
>> diff --git a/block/partition-generic.c b/block/partition-generic.c
>> index aee643ce13d1..31bff3fb28af 100644
>> --- a/block/partition-generic.c
>> +++ b/block/partition-generic.c
>> @@ -459,56 +459,6 @@ static int drop_partitions(struct gendisk *disk, struct block_device *bdev)
>>  	return 0;
>>  }
>>  
>> -static bool part_zone_aligned(struct gendisk *disk,
>> -			      struct block_device *bdev,
>> -			      sector_t from, sector_t size)
>> -{
>> -	unsigned int zone_sectors = bdev_zone_sectors(bdev);
>> -
>> -	/*
>> -	 * If this function is called, then the disk is a zoned block device
>> -	 * (host-aware or host-managed). This can be detected even if the
>> -	 * zoned block device support is disabled (CONFIG_BLK_DEV_ZONED not
>> -	 * set). In this case, however, only host-aware devices will be seen
>> -	 * as a block device is not created for host-managed devices. Without
>> -	 * zoned block device support, host-aware drives can still be used as
>> -	 * regular block devices (no zone operation) and their zone size will
>> -	 * be reported as 0. Allow this case.
>> -	 */
>> -	if (!zone_sectors)
>> -		return true;
>> -
>> -	/*
>> -	 * Check partition start and size alignement. If the drive has a
>> -	 * smaller last runt zone, ignore it and allow the partition to
>> -	 * use it. Check the zone size too: it should be a power of 2 number
>> -	 * of sectors.
>> -	 */
>> -	if (WARN_ON_ONCE(!is_power_of_2(zone_sectors))) {
>> -		u32 rem;
>> -
>> -		div_u64_rem(from, zone_sectors, &rem);
>> -		if (rem)
>> -			return false;
>> -		if ((from + size) < get_capacity(disk)) {
>> -			div_u64_rem(size, zone_sectors, &rem);
>> -			if (rem)
>> -				return false;
>> -		}
>> -
>> -	} else {
>> -
>> -		if (from & (zone_sectors - 1))
>> -			return false;
>> -		if ((from + size) < get_capacity(disk) &&
>> -		    (size & (zone_sectors - 1)))
>> -			return false;
>> -
>> -	}
>> -
>> -	return true;
>> -}
>> -
>>  int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
>>  {
>>  	struct parsed_partitions *state = NULL;
>> @@ -544,6 +494,14 @@ int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
>>  		}
>>  		return -EIO;
>>  	}
>> +
>> +	/* Partitions are not supported on zoned block devices */
>> +	if (bdev_is_zoned(bdev)) {
>> +		pr_warn("%s: ignoring partition table on zoned block device\n",
>> +			disk->disk_name);
>> +		goto out;
>> +	}
>> +
>>  	/*
>>  	 * If any partition code tried to read beyond EOD, try
>>  	 * unlocking native capacity even if partition table is
> 
> While I do applaud removing special cases for zoned devices, we do have
> the GENHD_FL_NO_PART_SCAN for precisely this use case.
> Any particular reason why this isn't being used, nor even set?

If we set the flag, indeed partitions will be ignored, which is exactly
what we want. But that also means that there will be no warning message
whatsoever in the very unlikely case of a user using an SMR disk with
partitions. I fully agree with you that we should set this flag, but I
decided against it initially to have the "partition table ignored"
warning printed for now.

If, as I expect, there are no screams coming from the field/users, we
can then safely add the flag and remove some more code (the test and
pr_warn call in rescan_partitions()).

> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

