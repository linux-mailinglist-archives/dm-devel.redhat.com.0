Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F01E51679A5
	for <lists+dm-devel@lfdr.de>; Fri, 21 Feb 2020 10:45:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582278318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uuFzV/JyvZxyaMZhreFnq1uKlLGxBcdxSR99INIVXzU=;
	b=g2oC9HinDuXU2zla3Hb3BJ8uV+Gvoaj9fq1aWZ/UmB/ZB5+7slwIn8HTvab8s+Z+9m0pGc
	CjLfqetaMDW3TtFaDY3qodlwZOrrfXsaSDzXu6oTctEi5UTtxPNb3kQYak78xEhgPhAlYI
	BemLrNPCbAgysOX1eeQFjV1qFIx1Gmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-FNibMIzuP6akt4moVZyULQ-1; Fri, 21 Feb 2020 04:45:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F26D8017DF;
	Fri, 21 Feb 2020 09:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B41BE9076D;
	Fri, 21 Feb 2020 09:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3349182B00E;
	Fri, 21 Feb 2020 09:44:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01L9iXxL018959 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 04:44:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A18862166B2B; Fri, 21 Feb 2020 09:44:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B70D2166B2E
	for <dm-devel@redhat.com>; Fri, 21 Feb 2020 09:44:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 049E6185A78F
	for <dm-devel@redhat.com>; Fri, 21 Feb 2020 09:44:31 +0000 (UTC)
IronPort-SDR: dIaozfLZNlkmNgfWXPNjvujhnb2JXcBp5DC5mvtsWr/jtT1vbL2wxK/ND2pIf5md1GsuoLVSMf
	LQonngUz27jawQ2q5GuMLaSw5Vdy4YPS0cw0DLZKxyQ41jir7RXqICE7MKJQKecW/DUM1LwsYx
	kTtBcBqhy5wPVrelbHCcbV1MRfFCOw0VnS+qFzzWeGle3akDXmCmgKo2YoahZR1MfqB8kkV3Ql
	8WnEuyrI1MKNv0hAaQ/kcbCDcmC+c/fuVZsqvB7dR5HW2gSXDxC775jbaEA6rIHjMxHLlNGYYN
	2gI=
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="232247862"
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-wKTbb9HSMU-j5DMkwoLLyQ-1; Fri, 21 Feb 2020 04:44:27 -0500
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
	by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2020 17:44:43 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5303.namprd04.prod.outlook.com (20.178.48.91) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2729.29; Fri, 21 Feb 2020 09:44:23 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2%6]) with mapi id 15.20.2729.033;
	Fri, 21 Feb 2020 09:44:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "heinzm@redhat.com" <heinzm@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>
Thread-Topic: [dm-devel] [PATCH v3] dm ebs: new block size emulating target
Thread-Index: AQHV53GgMJDkLGKe3k69278YlqmghA==
Date: Fri, 21 Feb 2020 09:44:22 +0000
Message-ID: <BYAPR04MB5816D3DC50B6ACAC8E8DEA86E7120@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <9cbb6827dbf3ff7cfdfbd0238c164cf5ee6d63e8.1582149828.git.heinzm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aee1e3cd-e73c-45c6-00ad-08d7b6b2a192
x-ms-traffictypediagnostic: BYAPR04MB5303:
x-microsoft-antispam-prvs: <BYAPR04MB5303A1F2C59D2916BB994806E7120@BYAPR04MB5303.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(110136005)(54906003)(8936002)(316002)(86362001)(33656002)(66946007)(52536014)(8676002)(76116006)(81156014)(66556008)(66446008)(66476007)(478600001)(81166006)(64756008)(9686003)(55016002)(6506007)(53546011)(7696005)(26005)(186003)(5660300002)(71200400001)(4326008)(450100002)(30864003)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5303;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sPGJ0jdxo5IDk2y9dfNtcbQ5+zhCXRkYW8YtqXGIdelInc20mHviMqRWAJuH8cBvrZdg12MjIQnjSw5TEsulxD/Y96w5K88q8J6gBAQqEUioqtF3Lot4Hvbh8+GqSohrKam79qsKvqyJ+oClVP8uLUy6/PGh8QAYz0JORELjCnelfiqJEgtXTr9zV0B/ysDeDQlFghaCzz6vDWIdjCvzf5WwVslPMmu16FoYcUpqQcyN+pXMGDbX5qPxVlPgPFpUfyODKpHskJXTlpFy9TqK9O9K64YjpL2qQYlg8WweBddeFT0LbeOYEkKbkcZuySkiy62wkutCDy+7WF5AEectJgOmdiq0uwNnY6rNuQt7ejsG5TFeFyQctkP+1cP1rNRWGyKn89fKrWNO2tlgxGVGr9xyaWUkqqQOKc4hoZZpt+ni7nc/ODsxxd5GR7KJ5STs
x-ms-exchange-antispam-messagedata: +1azWYsp0YTam8dukv84KYhAGz0ZD4cUgZ52sQBlo7muNiuSsbR37XUx1ttbyJ6Fu0US1r4uodrh/oCVgPd86q3vElaqy2HPBYVFvwFVs56hnFduRPr9h1U09jbR0533pqy/2ON+81mVtlP+qUAwyA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee1e3cd-e73c-45c6-00ad-08d7b6b2a192
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 09:44:22.6169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bC1xL/kWZokPPZCc3Sm/aR7eKQKyxCCULi7BXkKcGrS2z91iOS7kzEYwqVxot/bZFaaI1O8HWI7Bz5jD0oaPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5303
X-MC-Unique: wKTbb9HSMU-j5DMkwoLLyQ-1
X-MC-Unique: FNibMIzuP6akt4moVZyULQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01L9iXxL018959
X-loop: dm-devel@redhat.com
Cc: "awalsh@redhat.com" <awalsh@redhat.com>,
	"jdorminy@redhat.com" <jdorminy@redhat.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"corwin@redhat.com" <corwin@redhat.com>
Subject: Re: [dm-devel] [PATCH v3] dm ebs: new block size emulating target
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

On 2020/02/20 7:12, heinzm@redhat.com wrote:
> From: Heinz Mauelshagen <heinzm@redhat.com>
> 
> This new target is similar to the linear target except that it emulates
> a smaller logical block size on devices with larger ones.  It's main
> purpose is to emulate 512 byte sectors on 4K native disks (i.e. 512e).

512e drives have a 512B LBA, so no emulation is needed (the drive does that
itself). Did you mean to say 4Kn here ? Or is the intent to bypass the
drive level 512B emulation and do all 4K aligned read-modify-write accesses
on the host ?

> 
> See Documentation/admin-guide/device-mapper/dm-ebs.rst for details.
> 
> Changes versus version 2 sent on 2/13/2020:
> - fix __nr_blocks() to return the correct number of blocks
> - fix __ebs_forget_bio() to process the last block of a bio
> - fix __ebs_process_bios() to avoid prefetching the same block twice
> - use op_is_flush() in the map function
> - comments
> 
> Reviewed-by: John Dorminy <jdorminy@redhat.com>
> Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
> ---
>  .../admin-guide/device-mapper/dm-ebs.rst      |  49 ++
>  drivers/md/Kconfig                            |   8 +
>  drivers/md/Makefile                           |   2 +
>  drivers/md/dm-ebs-target.c                    | 429 ++++++++++++++++++
>  4 files changed, 488 insertions(+)
>  create mode 100644 Documentation/admin-guide/device-mapper/dm-ebs.rst
>  create mode 100644 drivers/md/dm-ebs-target.c
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-ebs.rst b/Documentation/admin-guide/device-mapper/dm-ebs.rst
> new file mode 100644
> index 000000000000..530771dbb352
> --- /dev/null
> +++ b/Documentation/admin-guide/device-mapper/dm-ebs.rst
> @@ -0,0 +1,49 @@
> +======
> +dm-ebs
> +======
> +
> +This target is similar to the linear target except that it emulates
> +smaller logical block size on devices with larger ones.   It's main
> +purpose is to emulate 512 byte sectors on 4K native disks (i.e 512e).

Same comment as above. Clarifying this would help users.

> +
> +Supported emulated logical block sizes 512, 1024, 2048 and 4096.
> +
> +Underlying block size can be set to > 4K to test buffering larger units.

If I understand this correctly, your target can also emulate physical
sector sizes larger than 4K ? Is this correct ?

All this description should I think clarify the combinations of
logical/physical sector size that the target can take and change into some
other combination.

> +
> +
> +Table parameters
> +----------------
> +  <dev path> <offset> <emulated sectors> [<underlying sectors>]
> +
> +Mandatory parameters:
> +
> +    <dev path>:
> +        Full pathname to the underlying block-device,
> +        or a "major:minor" device-number.
> +    <offset>:
> +        Starting sector within the device;
> +        has to be a multiple of <emulated sectors>.
> +    <emulated sectors>:
> +        Number of sectors defining the logical block size to be emulated;
> +        1, 2, 4, 8 sectors of 512 bytes supported.
> +
> +Optional parameter:
> +
> +    <underyling sectors>:
> +        Number of sectors defining the logical block size of <dev path>.
> +        2^N supported, e.g. 8 = emulate 8 sectors of 512 bytes = 4KiB.
> +        If not provided, the logical block size of <dev path> will be used.
> +
> +
> +Examples:
> +
> +Emulate 1 sector = 512 bytes logical block size on /dev/sda starting at
> +offset 1024 sectors with underlying devices block size automatically set:
> +
> +ebs /dev/sda 1024 1
> +
> +Emulate 2 sector = 1KiB logical block size on /dev/sda starting at
> +offset 128 sectors, enforce 2KiB underlying device block size.
> +This presumes 2KiB logical blocksize on /dev/sda or less to work:
> +
> +ebs /dev/sda 128 2 4
> diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> index d6d5ab23c088..392974a2999d 100644
> --- a/drivers/md/Kconfig
> +++ b/drivers/md/Kconfig
> @@ -336,6 +336,14 @@ config DM_WRITECACHE
>  	   The writecache target doesn't cache reads because reads are supposed
>  	   to be cached in standard RAM.
>  
> +config DM_EBS
> +       tristate "Emulated block size target (EXPERIMENTAL)"
> +       depends on BLK_DEV_DM
> +       default n
> +       ---help---
> +	 dm-ebs emulates smaller logical block size on backing devices
> +	 with larger ones (e.g. 512 byte sectors on 4K native disks).
> +
>  config DM_ERA
>         tristate "Era target (EXPERIMENTAL)"
>         depends on BLK_DEV_DM
> diff --git a/drivers/md/Makefile b/drivers/md/Makefile
> index d91a7edcd2ab..9a2d673f94bc 100644
> --- a/drivers/md/Makefile
> +++ b/drivers/md/Makefile
> @@ -17,6 +17,7 @@ dm-thin-pool-y	+= dm-thin.o dm-thin-metadata.o
>  dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
>  		    dm-cache-background-tracker.o
>  dm-cache-smq-y   += dm-cache-policy-smq.o
> +dm-ebs-y	+= dm-ebs-target.o
>  dm-era-y	+= dm-era-target.o
>  dm-clone-y	+= dm-clone-target.o dm-clone-metadata.o
>  dm-verity-y	+= dm-verity-target.o
> @@ -65,6 +66,7 @@ obj-$(CONFIG_DM_THIN_PROVISIONING)	+= dm-thin-pool.o
>  obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
>  obj-$(CONFIG_DM_CACHE)		+= dm-cache.o
>  obj-$(CONFIG_DM_CACHE_SMQ)	+= dm-cache-smq.o
> +obj-$(CONFIG_DM_EBS)		+= dm-ebs.o
>  obj-$(CONFIG_DM_ERA)		+= dm-era.o
>  obj-$(CONFIG_DM_CLONE)		+= dm-clone.o
>  obj-$(CONFIG_DM_LOG_WRITES)	+= dm-log-writes.o
> diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
> new file mode 100644
> index 000000000000..a241af82543a
> --- /dev/null
> +++ b/drivers/md/dm-ebs-target.c
> @@ -0,0 +1,429 @@
> +/*
> + * Copyright (C) 2020 Red Hat GmbH
> + *
> + * This file is released under the GPL.
> + *
> + * Device-mapper target to emulate smaller logical block
> + * size on backing devices exposing (natively) larger ones.
> + *
> + * E.g. 512 byte sector emulation on 4K native disks.
> + */
> +
> +#include "dm.h"
> +#include <linux/module.h>
> +#include <linux/workqueue.h>
> +#include <linux/dm-bufio.h>
> +
> +#define DM_MSG_PREFIX "ebs"
> +
> +static void ebs_dtr(struct dm_target *ti);
> +
> +/* Emulated block size context. */
> +struct ebs_c {
> +	struct dm_dev *dev;
> +	struct dm_bufio_client *bufio;
> +	struct work_struct ws;
> +	struct workqueue_struct *wq;
> +	struct bio_list bios_in;
> +	spinlock_t lock; /* Guard bios_in list above */
> +	sector_t start;
> +	unsigned int ebs;
> +	unsigned int ubs;

These two should have better name to help clarifying the code.
May be:
ebs -> elblocksz
ubs -> epblocksz

And add comments to describe the struct fields.

> +	unsigned char shift;
> +	unsigned short ubs_set:1;
> +};
> +
> +static sector_t __sector_to_block(struct ebs_c *ec, sector_t sector)
> +{
> +	return sector >> ec->shift;
> +}

static inline sector_t ?

> +
> +static sector_t __block_mod(sector_t sector, unsigned int bs)
> +{
> +	return sector & (bs - 1);
> +}

inline for this one too ?

> +
> +/* Return number of blocks for a bio accounting for misalignement of start and end sectors. */
> +static unsigned int __nr_blocks(struct ebs_c *ec, struct bio *bio)
> +{
> +	sector_t end_sector = __block_mod(bio->bi_iter.bi_sector, ec->ubs) + bio_sectors(bio);
> +
> +	return __sector_to_block(ec, end_sector) + (__block_mod(end_sector, ec->ubs) ? 1 : 0);
> +}
> +
> +static bool __ebs_check_bs(unsigned int bs)
> +{
> +	return bs && is_power_of_2(bs);
> +}
> +
> +/* READ/WRITE bio vector: copy blocks between bufio blocks and bio vector's (partial/overlapping) pages. */

May be use the regular comment block for functions here:

/*
 * READ/WRITE...
 */

Same for other functions below.

> +static int __ebs_rw_bvec(struct ebs_c *ec, int rw, struct bio_vec *bv, struct bvec_iter *iter)
> +{
> +	int r = 0;
> +	unsigned char *ba, *pa = page_address(bv->bv_page) + bv->bv_offset;
> +	unsigned int cur_len;
> +	unsigned int bv_len = bv->bv_len;
> +	unsigned int buf_off = to_bytes(__block_mod(iter->bi_sector, ec->ubs));
> +	sector_t block = __sector_to_block(ec, iter->bi_sector);
> +	struct dm_buffer *b;
> +
> +	if (!bv->bv_page || !bv_len)
> +		return -EIO;
> +
> +	/* Handle overlapping page <-> blocks */
> +	while (bv_len) {
> +		cur_len = min(dm_bufio_get_block_size(ec->bufio) - buf_off, bv_len);
> +
> +		/* Avoid reading for writes in case bio vector's page overwrites block completely. */
> +		if (rw == READ || buf_off || bv_len < dm_bufio_get_block_size(ec->bufio))
> +			ba = dm_bufio_read(ec->bufio, block, &b);
> +		else
> +			ba = dm_bufio_new(ec->bufio, block, &b);
> +
> +		if (unlikely(IS_ERR(ba)))
> +			r = PTR_ERR(ba); /* Carry on with next buffer if any to I/O all possible data but return error. */
> +		else {
> +			/* Copy data to/from bio to buffer if read/new was successful above. */
> +			ba += buf_off;
> +			if (rw == READ)
> +				memcpy(pa, ba, cur_len);
> +			else {
> +				memcpy(ba, pa, cur_len);
> +				dm_bufio_mark_partial_buffer_dirty(b, buf_off, buf_off + cur_len);
> +			}
> +
> +			dm_bufio_release(b);
> +		}
> +
> +		pa += cur_len;
> +		bv_len -= cur_len;
> +		buf_off = 0;
> +		block++;
> +	}
> +
> +	return r;
> +}
> +
> +/* READ/WRITE: iterate bio vector's copying between (partial) pages and bufio blocks. */
> +static int __ebs_rw_bio(struct ebs_c *ec, int rw, struct bio *bio)
> +{
> +	int r = 0, rr;
> +	struct bio_vec bv;
> +	struct bvec_iter iter;
> +
> +	bio_for_each_bvec(bv, bio, iter) {
> +		rr = __ebs_rw_bvec(ec, rw, &bv, &iter);
> +		if (rr)
> +			r = rr;
> +	}
> +
> +	return r;
> +}
> +
> +/* 'Discard' blocks, i.e. release them from the bufio cache. */
> +static int __ebs_forget_bio(struct ebs_c *ec, struct bio *bio)
> +{
> +	sector_t blocks, sector = bio->bi_iter.bi_sector;;
> +
> +	blocks = __nr_blocks(ec, bio);
> +	for (; blocks--; sector += ec->ubs)
> +		dm_bufio_forget(ec->bufio, __sector_to_block(ec, sector));
> +
> +	return 0;
> +}
> +
> +/* Worker funtion to process incoming bios. */
> +static void __ebs_process_bios(struct work_struct *ws)
> +{
> +	int r;
> +	bool write = false;
> +	sector_t block1, block2;
> +	struct ebs_c *ec = container_of(ws, struct ebs_c, ws);
> +	struct bio *bio;
> +	struct bio_list bios;
> +
> +	bio_list_init(&bios);
> +
> +	spin_lock_irq(&ec->lock);
> +	bios = ec->bios_in;
> +	bio_list_init(&ec->bios_in);
> +	spin_unlock_irq(&ec->lock);
> +
> +	/* Prefetch all read and any mis-aligned write buffers */
> +	bio_list_for_each(bio, &bios) {
> +		block1 = __sector_to_block(ec, bio->bi_iter.bi_sector);
> +		if (bio_op(bio) == REQ_OP_READ)
> +			dm_bufio_prefetch(ec->bufio, block1, __nr_blocks(ec, bio));
> +		else if (bio_op(bio) == REQ_OP_WRITE && !(bio->bi_opf & REQ_PREFLUSH)) {
> +			block2 = __sector_to_block(ec, bio_end_sector(bio));
> +			if (__block_mod(bio->bi_iter.bi_sector, ec->ubs))
> +				dm_bufio_prefetch(ec->bufio, block1, 1);
> +			if (__block_mod(bio_end_sector(bio), ec->ubs) && block2 != block1)
> +				dm_bufio_prefetch(ec->bufio, block2, 1);
> +		}
> +	}
> +
> +	bio_list_for_each(bio, &bios) {
> +		r = -EIO;
> +
> +		if (bio_op(bio) == REQ_OP_READ)
> +			r = __ebs_rw_bio(ec, READ, bio);
> +		else if (bio_op(bio) == REQ_OP_WRITE) {
> +			write = true;
> +			r = __ebs_rw_bio(ec, WRITE, bio);
> +		} else if (bio_op(bio) == REQ_OP_DISCARD)
> +			/* FIXME: (optionally) call dm_bufio_discard_buffers() once upstream. */
> +			r = __ebs_forget_bio(ec, bio);
> +
> +		if (r)
> +			bio->bi_status = BLK_STS_IOERR;
> +	}
> +
> +	r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;
> +
> +	while ((bio = bio_list_pop(&bios))) {
> +		/* FIXME: any other request is just endioed for now. */

Then please fix it...

> +		if (unlikely(r && bio_op(bio) == REQ_OP_WRITE))
> +			bio_io_error(bio);
> +		else
> +			bio_endio(bio);
> +	}
> +}
> +
> +/*
> + * Construct an emulated block size mapping: <dev_path> <offset> <ebs> [<ubs>]
> + *
> + * <dev_path>: path of the underlying device
> + * <offset>: offset in 512 bytes sectors into <dev_path>
> + * <ebs>: emulated block size in units of 512 bytes exposed to the upper layer
> + * [<ubs>]: underlying block size in units of 512 bytes imposed on the lower layer;
> + * 	     optional, if not supplied, retrieve logical block size from underlying device
> + */
> +static int ebs_ctr(struct dm_target *ti, unsigned int argc, char **argv)
> +{
> +	int r;
> +	unsigned short tmp1;
> +	unsigned long long tmp;
> +	char dummy;
> +	struct ebs_c *ec;
> +
> +	if (argc < 3 || argc > 4) {
> +		ti->error = "Invalid argument count";
> +		return -EINVAL;
> +	}
> +
> +	ec = ti->private = kzalloc(sizeof(*ec), GFP_KERNEL);
> +	if (!ec) {
> +		ti->error = "Cannot allocate ebs context";
> +		return -ENOMEM;
> +	}
> +
> +	r = -EINVAL;
> +	if (sscanf(argv[1], "%llu%c", &tmp, &dummy) != 1 ||
> +		   tmp != (sector_t)tmp ||
> +		   (sector_t)tmp >= ti->len) {

please indent to the "if (", not "sscanf("

> +		ti->error = "Invalid device offset sector";
> +		goto bad;
> +	}
> +	ec->start = tmp;
> +
> +	if (sscanf(argv[2], "%hu%c", &tmp1, &dummy) != 1 ||
> +	    !__ebs_check_bs(tmp1) ||
> +	    to_bytes(tmp1) > PAGE_SIZE) {
> +		ti->error = "Invalid emulated block size";
> +		goto bad;
> +	}
> +	ec->ebs = tmp1;
> +
> +	if (argc > 3) {
> +		if (sscanf(argv[3], "%hu%c", &tmp1, &dummy) != 1 || !__ebs_check_bs(tmp1)) {
> +			ti->error = "Invalid underlying block size";
> +			goto bad;
> +		}
> +		ec->ubs = tmp1;
> +		ec->ubs_set = true;
> +	} else
> +		ec->ubs_set = false;
> +
> +	r = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &ec->dev);
> +	if (r) {
> +		ti->error = "Device lookup failed";
> +		ec->dev = NULL;
> +		goto bad;
> +	}
> +
> +	r = -EINVAL;
> +	if (!ec->ubs_set) {
> +		ec->ubs = to_sector(bdev_logical_block_size(ec->dev->bdev));
> +		if (!__ebs_check_bs(ec->ubs)) {
> +			ti->error = "Invalid retrieved underlying block size";

The message is confusing here. The device LBA size is certainly fine, but
the parameters passed cannot accomodate it right ? So stricktly speaking,
it is not the backend device LBA size that is invalid. No ?

> +			goto bad;
> +		}
> +	}
> +
> +	if (!ec->ubs_set && ec->ebs == ec->ubs)
> +		DMERR("Emulation superfluous: emulated equal to underlying block size");

This is an error message but you do nothing about it. May be change this
into a info level output since that is not a real problem.

> +
> +	if (__block_mod(ec->start, ec->ubs)) {
> +		ti->error = "Device offset must be multiple of underlying block size";
> +		goto bad;
> +	}
> +
> +	ec->bufio = dm_bufio_client_create(ec->dev->bdev, to_bytes(ec->ubs), 1, 0, NULL, NULL);
> +	if (IS_ERR(ec->bufio)) {
> +		ti->error = "Cannot create dm bufio client";
> +		r = PTR_ERR(ec->bufio);
> +		ec->bufio = NULL;
> +		goto bad;
> +	}
> +
> +	ec->wq = alloc_ordered_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM);
> +	if (!ec->wq) {
> +		ti->error = "Cannot create dm-" DM_MSG_PREFIX " workqueue";
> +		r = -ENOMEM;
> +		goto bad;
> +	}
> +
> +	ec->shift = __ffs(ec->ubs);
> +	INIT_WORK(&ec->ws, &__ebs_process_bios);
> +	bio_list_init(&ec->bios_in);
> +	spin_lock_init(&ec->lock);
> +
> +	ti->num_flush_bios = 1;
> +	ti->num_discard_bios = 1;
> +	ti->num_secure_erase_bios = 0;
> +	ti->num_write_same_bios = 0;
> +	ti->num_write_zeroes_bios = 0;
> +	return 0;
> +bad:
> +	ebs_dtr(ti);
> +	return r;
> +}
> +
> +static void ebs_dtr(struct dm_target *ti)
> +{
> +	struct ebs_c *ec = ti->private;
> +
> +	if (ec->wq)
> +		destroy_workqueue(ec->wq);
> +	if (ec->bufio)
> +		dm_bufio_client_destroy(ec->bufio);
> +	if (ec->dev)
> +		dm_put_device(ti, ec->dev);
> +	kfree(ec);
> +}
> +
> +static int ebs_map(struct dm_target *ti, struct bio *bio)
> +{
> +	struct ebs_c *ec = ti->private;
> +
> +	bio_set_dev(bio, ec->dev->bdev);
> +	bio->bi_iter.bi_sector = ec->start + dm_target_offset(ti, bio->bi_iter.bi_sector);
> +
> +	if (unlikely(op_is_flush(bio->bi_opf)))
> +		return DM_MAPIO_REMAPPED;
> +
> +	/*
> +	 * Only queue for bufio processing in case of partial or overlapping buffers
> +	 * -or-
> +	 * emulation with ebs == ubs aiming for tests of dm-bufio overhead.
> +	 */
> +	if (likely(__block_mod(bio->bi_iter.bi_sector, ec->ubs) ||
> +		   __block_mod(bio_end_sector(bio), ec->ubs) ||
> +		   ec->ebs == ec->ubs)) {
> +		spin_lock_irq(&ec->lock);
> +		bio_list_add(&ec->bios_in, bio);
> +		spin_unlock_irq(&ec->lock);
> +
> +		queue_work(ec->wq, &ec->ws);
> +
> +		return DM_MAPIO_SUBMITTED;
> +	}
> +
> +	/* Forget any buffer content relative to this direct backing device I/O. */
> +	__ebs_forget_bio(ec, bio);
> +
> +	return DM_MAPIO_REMAPPED;
> +}
> +
> +static void ebs_status(struct dm_target *ti, status_type_t type,
> +		       unsigned status_flags, char *result, unsigned maxlen)
> +{
> +	struct ebs_c *ec = ti->private;
> +
> +	switch (type) {
> +	case STATUSTYPE_INFO:
> +		*result = '\0';
> +		break;
> +	case STATUSTYPE_TABLE:
> +		snprintf(result, maxlen, ec->ubs_set ? "%s %llu %u %u" : "%s %llu %u",
> +			 ec->dev->name, (unsigned long long) ec->start, ec->ebs, ec->ubs);
> +		break;
> +	}
> +}
> +
> +static int ebs_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
> +{
> +	struct ebs_c *ec = ti->private;
> +	struct dm_dev *dev = ec->dev;
> +
> +	/*
> +	 * Only pass ioctls through if the device sizes match exactly.
> +	 */
> +	*bdev = dev->bdev;
> +	return !!(ec->start || ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT);
> +}
> +
> +static void ebs_io_hints(struct dm_target *ti, struct queue_limits *limits)
> +{
> +	struct ebs_c *ec = ti->private;
> +
> +	limits->logical_block_size = to_bytes(ec->ebs);
> +	limits->physical_block_size = to_bytes(ec->ubs);
> +	limits->alignment_offset = limits->physical_block_size;
> +	blk_limits_io_min(limits, limits->logical_block_size);
> +}
> +
> +static int ebs_iterate_devices(struct dm_target *ti,
> +				  iterate_devices_callout_fn fn, void *data)
> +{
> +	struct ebs_c *ec = ti->private;
> +
> +	return fn(ti, ec->dev, ec->start, ti->len, data);
> +}
> +
> +static struct target_type ebs_target = {
> +	.name		 = "ebs",
> +	.version	 = {1, 0, 0},
> +	.features	 = DM_TARGET_PASSES_INTEGRITY,
> +	.module		 = THIS_MODULE,
> +	.ctr		 = ebs_ctr,
> +	.dtr		 = ebs_dtr,
> +	.map		 = ebs_map,
> +	.status		 = ebs_status,
> +	.io_hints	 = ebs_io_hints,
> +	.prepare_ioctl	 = ebs_prepare_ioctl,
> +	.iterate_devices = ebs_iterate_devices,
> +};
> +
> +int __init dm_ebs_init(void)
> +{
> +	int r = dm_register_target(&ebs_target);
> +
> +	if (r < 0)
> +		DMERR("register failed %d", r);
> +
> +	return r;
> +}
> +
> +void dm_ebs_exit(void)
> +{
> +	dm_unregister_target(&ebs_target);
> +}
> +
> +module_init(dm_ebs_init);
> +module_exit(dm_ebs_exit);
> +
> +MODULE_AUTHOR("Heinz Mauelshagen <dm-devel@redhat.com>");
> +MODULE_DESCRIPTION(DM_NAME " emulated block size target");
> +MODULE_LICENSE("GPL");
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

