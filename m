Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA04150853
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 15:26:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580739988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EV+9DfNHIEIMR6CI4ci3FFQcmT68inR59hWr05xNeC8=;
	b=BaDzTdHrzGXu5iZOmhA1am/PLMO8rmKlEAF/g8djJ1cxyCQ4P9xN8BBqDKfYfHtQYDySst
	MtooHX3hyn1qQWxikqAZvLBvF3m0W4sjuZwBFyqTtmEEoaKWsiGk6wYVMxh3Vqkh/p42mD
	AyHRMbquegN74fy6OZPNIzjN/d7vNNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-DVqEj5vFMEWcbQiUXuzFxA-1; Mon, 03 Feb 2020 09:26:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A764A8048EA;
	Mon,  3 Feb 2020 14:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86C12867F0;
	Mon,  3 Feb 2020 14:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BD708172A;
	Mon,  3 Feb 2020 14:26:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013Clp8l006352 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 07:47:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 372F22166AE4; Mon,  3 Feb 2020 12:47:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31FD72166B3A
	for <dm-devel@redhat.com>; Mon,  3 Feb 2020 12:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33958867440
	for <dm-devel@redhat.com>; Mon,  3 Feb 2020 12:47:49 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-340-gTgmLZ9GM-iem43vTtCEWA-1; Mon, 03 Feb 2020 07:47:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	013Chlqq085654; Mon, 3 Feb 2020 12:47:38 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2xw19q7hgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2020 12:47:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	013CiMiH139378; Mon, 3 Feb 2020 12:45:37 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 2xwjt3xuns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Feb 2020 12:45:37 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 013CjaQ3003775;
	Mon, 3 Feb 2020 12:45:36 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 03 Feb 2020 04:45:36 -0800
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <c4ba178c-f5cf-4dd1-784b-e372d6b09f62@oracle.com>
Date: Mon, 3 Feb 2020 20:45:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-2002030097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9519
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-2002030097
X-MC-Unique: gTgmLZ9GM-iem43vTtCEWA-1
X-MC-Unique: DVqEj5vFMEWcbQiUXuzFxA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 03 Feb 2020 09:25:51 -0500
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH] dm-zoned: extend the way of exposing
 zoned block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/8/20 3:40 PM, Damien Le Moal wrote:
> On 2020/01/08 16:13, Nobody wrote:
>> From: Bob Liu <bob.liu@oracle.com>
>>
>> Motivation:
>> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
>> regular block device by storing metadata and buffering random writes in
>> conventional zones.
>> This way is not very flexible, there must be enough conventional zones and the
>> performance may be constrained.
>> By putting metadata(also buffering random writes) in separated device we can get
>> more flexibility and potential performance improvement e.g by storing metadata
>> in faster device like persistent memory.
>>
>> This patch try to split the metadata of dm-zoned to an extra block
>> device instead of zoned block device itself.
>> (Buffering random writes also in the todo list.)
>>
>> Patch is at the very early stage, just want to receive some feedback about
>> this extension.
>> Another option is to create an new md-zoned device with separated metadata
>> device based on md framework.
> 
> For metadata only, it should not be hard at all to move to another
> conventional zone device. It will however be a little more tricky for
> conventional zones used for data since dm-zoned assumes that this random
> write space is also zoned. Moving this space to a conventional device
> requires implementing a zone emulation (fake zones) for the regular
> drive, using a zone size that matches the size of sequential zones.
> 
> Beyond this, dm-zoned also needs to be changed to accept partial drives
> and the dm core code to accept mixing of regular and zoned disks (that
> is forbidden now).
> 
> Another approach worth exploring is stacking dm-zoned as is on top of a
> modified dm-linear with the ability to emulate conventional zones on top
> of a regular block device (you only need report zones method
> implemented). 

Looks like the only way to do this emulation is in user space tool(dm-zoned-tools).
Write metadata(which contains emulated zone information constructed by dm-zoned-tools)
into regular block device.
It's impossible to add code to every regular block device for emulating conventional zones. 

Thanks,
Bob

> That is much easier to do. We actually hacked something
> like that last month to see the performance change and saw a jump from
> 56 MB/s to 250 MB/s for write intensive workloads (file creation on
> ext4). I am not so warm in this approach though as it modifies dm-linear
> and we want to keep it very lean and simple. Modifying dm-zoned to allow
> support for a device pair is a better approach I think.
> 
>>
>> Signed-off-by: Bob Liu <bob.liu@oracle.com>
>> ---
>>  drivers/md/dm-zoned-metadata.c |  6 +++---
>>  drivers/md/dm-zoned-target.c   | 15 +++++++++++++--
>>  drivers/md/dm-zoned.h          |  1 +
>>  3 files changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>> index 22b3cb0..89cd554 100644
>> --- a/drivers/md/dm-zoned-metadata.c
>> +++ b/drivers/md/dm-zoned-metadata.c
>> @@ -439,7 +439,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>>  
>>  	/* Submit read BIO */
>>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
>> -	bio_set_dev(bio, zmd->dev->bdev);
>> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>>  	bio->bi_private = mblk;
>>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>>  	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
>> @@ -593,7 +593,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>>  	set_bit(DMZ_META_WRITING, &mblk->state);
>>  
>>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
>> -	bio_set_dev(bio, zmd->dev->bdev);
>> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>>  	bio->bi_private = mblk;
>>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
>> @@ -620,7 +620,7 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>>  		return -ENOMEM;
>>  
>>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
>> -	bio_set_dev(bio, zmd->dev->bdev);
>> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>>  	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
>>  	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
>>  	ret = submit_bio_wait(bio);
>> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
>> index 70a1063..55c64fe 100644
>> --- a/drivers/md/dm-zoned-target.c
>> +++ b/drivers/md/dm-zoned-target.c
>> @@ -39,6 +39,7 @@ struct dm_chunk_work {
>>   */
>>  struct dmz_target {
>>  	struct dm_dev		*ddev;
>> +	struct dm_dev           *metadata_dev;
> 
> This naming would be confusing as it implies metadata only. If you also
> want to move the random write zones to a regular device, then I would
> suggest names like:
> 
> ddev -> zoned_bdev (the zoned device, e.g. SMR disk)
> metadata_dev -> reg_bdev (regular block device, e.g. an SSD)
> 
> The metadata+random write (fake) zones space can use the regular block
> device, and all sequential zones are assumed to be on the zoned device.
> Care must be taken to handle the case of a zoned device that has
> conventional zones: these could be used as is, not needing any reclaim,
> so potentially contributing to further optimization.
> 
>>  
>>  	unsigned long		flags;
>>  
>> @@ -701,6 +702,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>>  		goto err;
>>  	}
>>  
>> +	dev->meta_bdev = dmz->metadata_dev->bdev;
>>  	dev->bdev = dmz->ddev->bdev;
>>  	(void)bdevname(dev->bdev, dev->name);
>>  
>> @@ -761,7 +763,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>>  	int ret;
>>  
>>  	/* Check arguments */
>> -	if (argc != 1) {
>> +	if (argc != 2) {
>>  		ti->error = "Invalid argument count";
>>  		return -EINVAL;
>>  	}
>> @@ -774,8 +776,16 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>>  	}
>>  	ti->private = dmz;
>>  
>> +	/* Get the metadata block device */
>> +	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table),
>> +			&dmz->metadata_dev);
>> +	if (ret) {
>> +		dmz->metadata_dev = NULL;
>> +		goto err;
>> +	}
>> +
>>  	/* Get the target zoned block device */
>> -	ret = dmz_get_zoned_device(ti, argv[0]);
>> +	ret = dmz_get_zoned_device(ti, argv[1]);
>>  	if (ret) {
>>  		dmz->ddev = NULL;
>>  		goto err;
>> @@ -856,6 +866,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>>  err_dev:
>>  	dmz_put_zoned_device(ti);
>>  err:
>> +	dm_put_device(ti, dmz->metadata_dev);
>>  	kfree(dmz);
>>  
>>  	return ret;
>> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
>> index 5b5e493..e789ff5 100644
>> --- a/drivers/md/dm-zoned.h
>> +++ b/drivers/md/dm-zoned.h
>> @@ -50,6 +50,7 @@
>>   */
>>  struct dmz_dev {
>>  	struct block_device	*bdev;
>> +	struct block_device     *meta_bdev;
>>  
>>  	char			name[BDEVNAME_SIZE];
>>  
>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

