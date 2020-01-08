Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 01408133C66
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jan 2020 08:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578469307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=H/W07IgVzhd3Z6ljnrmvieHp9IxaiMN0GeZLo2M5QMw=;
	b=ZHhv7b/AZRFOsh7YlermdHpGkAoqivS4bjzLNZtPV3maXOByyjJ7RFNbhM5N++TMxpKSf4
	hhi7iYvTzQrxW5YfjGh5KUIHvWu04fQi40e+iVSUF8O+O4rsy0CK7KrOtFchuUYaSKZ6/N
	3aBl4CEeJbK4JAYaFaqYuCKfYshnPss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-BO1vnHm4P0SgknTqgkMXKQ-1; Wed, 08 Jan 2020 02:41:42 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56706800D4C;
	Wed,  8 Jan 2020 07:41:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A55DD10016EB;
	Wed,  8 Jan 2020 07:41:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC06581C8C;
	Wed,  8 Jan 2020 07:41:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0087f3o1005587 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 02:41:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A20ED51DC; Wed,  8 Jan 2020 07:41:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A99FD0B35
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 07:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B24586D709
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 07:41:01 +0000 (UTC)
IronPort-SDR: l3H441SRCyO+7vzFu7Z2sHTvEpnxUc7/dE9UWNho34OtXyBTgG07VuuZvNVNiAPN+Hp5h6qx3D
	bJk5yYOnp+vFhUqC6BCjt3Wf9VZbex5XLQ1WiB6KnG5qnWCS5+c794eOLbIcDQJaaSDjT6yGFS
	bkBjcW4U0E1rF2y4oT5OtVPZsE3XUGCYlGlth7QgFnkBpmi6lNhAg4c+qnkbldxuyFkPOevozu
	55FJsTzRHchBaaEUX2lfA2oHxD6Gk43Hi06etfAsWEuDrEsKpiRJtmeW+YkyFxKdzRwh8GQuDX
	XcQ=
X-IronPort-AV: E=Sophos;i="5.69,409,1571673600"; d="scan'208";a="127673569"
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-gJFf7GKyNqelN3nPe9V5Hw-1; Wed, 08 Jan 2020 02:40:57 -0500
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2020 15:40:56 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5606.namprd04.prod.outlook.com (20.179.58.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.12; Wed, 8 Jan 2020 07:40:54 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2602.016;
	Wed, 8 Jan 2020 07:40:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Nobody <Nobody@nobody.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH] dm-zoned: extend the way of exposing zoned block
	device
Thread-Index: AQHVxfMPtnSx9ygQV0yw4PguyV00/g==
Date: Wed, 8 Jan 2020 07:40:54 +0000
Message-ID: <BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: be7ae671-b883-423f-df73-08d7940e178e
x-ms-traffictypediagnostic: BYAPR04MB5606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5606703132E96C00DAF80EE2E73E0@BYAPR04MB5606.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(189003)(199004)(110136005)(2906002)(5660300002)(86362001)(33656002)(54906003)(316002)(26005)(66946007)(6506007)(7696005)(53546011)(186003)(8676002)(9686003)(66556008)(81166006)(64756008)(91956017)(55016002)(71200400001)(8936002)(76116006)(66446008)(52536014)(66476007)(81156014)(4326008)(478600001)(16250700002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5606;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OeZKUAnuQsEQ7Mx+OrvGChhRiZbBMYeZU1nmC4Y0VTihA5Rr8xYMBMB5/lhJS+mq7YeGIDf6Sn4ECPXbe/1o7Ca3rJMIOoIyjQBuONEQhX13wIQ+m+pruHdbTr32X+pL62wTgNZQWsnxmucF+/jlvpYI4NuM+UNi6DRAttAhCacyrl2rlaSlthmUMUd8RtasB7JF0ghhHeYENtb7lc9i2wqfiVJGc5BCD9LgA80VjexNawmDfqJ8BEa/LgcacM92KeTZagLETq+S/RGDxdOkyitTBf0blq8dxWljPubyhwqUWjm4JJipls0e/Uh3nVNaT8VZqvqFHl6cNh85nghU9HH4Xd14xzVARZi07/y2cPV6qGpJPDK9j9n45Zj+omPfWbfIUaeJeAyZ6XOqcXLZj9ChxwMZ0a7Amkvy2pGk7PFKD1L6dXT/tT/6oj9tGD4/mEwC6nNj1ZL1wtGzI8Hc2i6/2EItmmKJDfcp6RearBsR6x+CnaUKB68a4XF/e8OO
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7ae671-b883-423f-df73-08d7940e178e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 07:40:54.0457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XwbuCkcDGGXdl75MXzhNby5YtLzdBBZaNNkCuW7VwCOXGE2VIceTcYuH49F9beHn7ZMKRNX832mA5/E0z+z1eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5606
X-MC-Unique: gJFf7GKyNqelN3nPe9V5Hw-1
X-MC-Unique: BO1vnHm4P0SgknTqgkMXKQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0087f3o1005587
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Bob Liu <bob.liu@oracle.com>,
	"shirley.ma@oracle.com" <shirley.ma@oracle.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/01/08 16:13, Nobody wrote:
> From: Bob Liu <bob.liu@oracle.com>
> 
> Motivation:
> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
> regular block device by storing metadata and buffering random writes in
> conventional zones.
> This way is not very flexible, there must be enough conventional zones and the
> performance may be constrained.
> By putting metadata(also buffering random writes) in separated device we can get
> more flexibility and potential performance improvement e.g by storing metadata
> in faster device like persistent memory.
> 
> This patch try to split the metadata of dm-zoned to an extra block
> device instead of zoned block device itself.
> (Buffering random writes also in the todo list.)
> 
> Patch is at the very early stage, just want to receive some feedback about
> this extension.
> Another option is to create an new md-zoned device with separated metadata
> device based on md framework.

For metadata only, it should not be hard at all to move to another
conventional zone device. It will however be a little more tricky for
conventional zones used for data since dm-zoned assumes that this random
write space is also zoned. Moving this space to a conventional device
requires implementing a zone emulation (fake zones) for the regular
drive, using a zone size that matches the size of sequential zones.

Beyond this, dm-zoned also needs to be changed to accept partial drives
and the dm core code to accept mixing of regular and zoned disks (that
is forbidden now).

Another approach worth exploring is stacking dm-zoned as is on top of a
modified dm-linear with the ability to emulate conventional zones on top
of a regular block device (you only need report zones method
implemented). That is much easier to do. We actually hacked something
like that last month to see the performance change and saw a jump from
56 MB/s to 250 MB/s for write intensive workloads (file creation on
ext4). I am not so warm in this approach though as it modifies dm-linear
and we want to keep it very lean and simple. Modifying dm-zoned to allow
support for a device pair is a better approach I think.

> 
> Signed-off-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c |  6 +++---
>  drivers/md/dm-zoned-target.c   | 15 +++++++++++++--
>  drivers/md/dm-zoned.h          |  1 +
>  3 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 22b3cb0..89cd554 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -439,7 +439,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  
>  	/* Submit read BIO */
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
> @@ -593,7 +593,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  	set_bit(DMZ_META_WRITING, &mblk->state);
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
> @@ -620,7 +620,7 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  		return -ENOMEM;
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->dev->meta_bdev);
>  	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
>  	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
>  	ret = submit_bio_wait(bio);
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 70a1063..55c64fe 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -39,6 +39,7 @@ struct dm_chunk_work {
>   */
>  struct dmz_target {
>  	struct dm_dev		*ddev;
> +	struct dm_dev           *metadata_dev;

This naming would be confusing as it implies metadata only. If you also
want to move the random write zones to a regular device, then I would
suggest names like:

ddev -> zoned_bdev (the zoned device, e.g. SMR disk)
metadata_dev -> reg_bdev (regular block device, e.g. an SSD)

The metadata+random write (fake) zones space can use the regular block
device, and all sequential zones are assumed to be on the zoned device.
Care must be taken to handle the case of a zoned device that has
conventional zones: these could be used as is, not needing any reclaim,
so potentially contributing to further optimization.

>  
>  	unsigned long		flags;
>  
> @@ -701,6 +702,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  		goto err;
>  	}
>  
> +	dev->meta_bdev = dmz->metadata_dev->bdev;
>  	dev->bdev = dmz->ddev->bdev;
>  	(void)bdevname(dev->bdev, dev->name);
>  
> @@ -761,7 +763,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	int ret;
>  
>  	/* Check arguments */
> -	if (argc != 1) {
> +	if (argc != 2) {
>  		ti->error = "Invalid argument count";
>  		return -EINVAL;
>  	}
> @@ -774,8 +776,16 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	}
>  	ti->private = dmz;
>  
> +	/* Get the metadata block device */
> +	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table),
> +			&dmz->metadata_dev);
> +	if (ret) {
> +		dmz->metadata_dev = NULL;
> +		goto err;
> +	}
> +
>  	/* Get the target zoned block device */
> -	ret = dmz_get_zoned_device(ti, argv[0]);
> +	ret = dmz_get_zoned_device(ti, argv[1]);
>  	if (ret) {
>  		dmz->ddev = NULL;
>  		goto err;
> @@ -856,6 +866,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  err_dev:
>  	dmz_put_zoned_device(ti);
>  err:
> +	dm_put_device(ti, dmz->metadata_dev);
>  	kfree(dmz);
>  
>  	return ret;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 5b5e493..e789ff5 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -50,6 +50,7 @@
>   */
>  struct dmz_dev {
>  	struct block_device	*bdev;
> +	struct block_device     *meta_bdev;
>  
>  	char			name[BDEVNAME_SIZE];
>  
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

