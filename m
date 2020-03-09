Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6701217EC3D
	for <lists+dm-devel@lfdr.de>; Mon,  9 Mar 2020 23:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583793887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4Vv2NQlyCFBcRCY0JXbnu02K4mNhPuPoP5OAi/Vz7FY=;
	b=eZmM0ZU1QjIKJyCw4VxtfJVbr6GWP49n1Eg6Ci6ZoGgn937TrIk7wjLtc8koGv3Q812FJ7
	kOIYh3xg2eVl+vfckvSTeXNZTR0RX15xYEsRxMrBnZYpudngPHgVJX++8Ttuvom/j1GrvH
	7L/3x2dhqkVi8mv51BRrBChZAoGzuJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379--shGLEwdMs63hV4wtq9fJA-1; Mon, 09 Mar 2020 18:44:45 -0400
X-MC-Unique: -shGLEwdMs63hV4wtq9fJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A662A0CC1;
	Mon,  9 Mar 2020 22:44:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B265D19C4F;
	Mon,  9 Mar 2020 22:44:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC2E586A04;
	Mon,  9 Mar 2020 22:44:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029MiL2c032588 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 18:44:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C96512026D67; Mon,  9 Mar 2020 22:44:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0322202A940
	for <dm-devel@redhat.com>; Mon,  9 Mar 2020 22:44:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D22358BA51B
	for <dm-devel@redhat.com>; Mon,  9 Mar 2020 22:44:19 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-186-nRtXgKbsNfypmu8Y7DzcQA-1; Mon, 09 Mar 2020 18:44:12 -0400
X-MC-Unique: nRtXgKbsNfypmu8Y7DzcQA-1
IronPort-SDR: YbcJm6MV+ftenDeQNNJKGuNT0bQ5vnAa3dC9qyJrqmI/YgUCBPBbO1IgDvQMZGPxzTz3JVMBkF
	ffKyzBNpYJ5RYbVafG7wvifPOErcXxGmocPFYiDpl6eEBAG88X43wmvNiLyp5n6CP+Z00W9MXA
	8nTQKxhaFuwsAMnIPa4WaMMzrmNLpU+YpUCaEvXyADubXzy3EBAgT35pXOCeyi2W0hhahjkC/l
	1We5z3SOM0drw+/b683RTieq/rq/QvWNT0DSTwcxrAiGP1kDle5ibK1JgtxYW6v36MEpkdtEd0
	b2M=
X-IronPort-AV: E=Sophos;i="5.70,534,1574092800"; d="scan'208";a="136386830"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
	by ob1.hgst.iphmx.com with ESMTP; 10 Mar 2020 06:44:10 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (2603:10b6:a03:10e::16)
	by BYAPR04MB5960.namprd04.prod.outlook.com (2603:10b6:a03:ed::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16;
	Mon, 9 Mar 2020 22:44:08 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::6daf:1b7c:1a61:8cb2%6]) with mapi id 15.20.2793.013;
	Mon, 9 Mar 2020 22:44:08 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "heinzm@redhat.com" <heinzm@redhat.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>
Thread-Topic: [PATCH v4] dm ebs: new block size emulating target
Thread-Index: AQHV9mHWmcAwS4YlbUWAjHQosdAlzA==
Date: Mon, 9 Mar 2020 22:44:08 +0000
Message-ID: <BYAPR04MB5816244DDF2E4EE2F1FAD3A0E7FE0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <5e49305bc15869c58edea0e6d815a546b9ee2c66.1583792345.git.heinzm@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:9183:2c1d:9c5e:d831]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a2fd8b1-47f8-4dd9-09c3-08d7c47b6115
x-ms-traffictypediagnostic: BYAPR04MB5960:
x-microsoft-antispam-prvs: <BYAPR04MB59607AC53A7B9F497A7BB7AEE7FE0@BYAPR04MB5960.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 0337AFFE9A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(2906002)(110136005)(54906003)(316002)(86362001)(64756008)(7696005)(66476007)(76116006)(66556008)(66446008)(478600001)(5660300002)(66946007)(52536014)(30864003)(9686003)(186003)(55016002)(33656002)(71200400001)(6506007)(53546011)(450100002)(81156014)(81166006)(4326008)(8936002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5960;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l/cRpuAKCk0FV+mjEChFFTHmj2nwwxZrd0QqVZmPP7oIokZOiVyP+0IoW2bsFtPixKfOnr9WLWyPanS88hbkN8ksnWVpm9UN6Cl4XZp7H7oxRk6xJytMEL6k0/iR/7Q/CqJPIK+qQG5OQlTgyEUFnnQ5n8mt6FN8+LLaIF7E+Wll7l9cDHV7HHUVcZUZ890TS7ht8gyuO+Iw7OCMeyje0XhHWMhlYacJeRJdr12jQiSX60IZL3CV8Qy/jLTSEEtCMmQ8g4/16rkDR2UFiBxF/mz+T8drHJ3SqwZ1vLvgm82t1lZzC07lEI1gB9T7GHK0cPnk5CJx2/6Q70LWsuED0XIiHeKugPhnSWB8/qOcdcZQ4lKN5F1nnoyb3y576FC7bZv+c70lkODJYPuax5fSiyuvy2RZonuuwhYUqG8bbmKC3Ix3O7qJuZQIncCh+KtE
x-ms-exchange-antispam-messagedata: S632OeTfcu2WN358NcBrihW3O1uhYrVRK+Ffgu3JYcV8FPpCy+JYDjrykj7jSOdceEaIheR5K843OYqHEcSDvdmpT7TmyJFVf6Ct4niXU/oBzdq6u/Lpe3dsjLNuJbQGMNxdZPuR970/wVUMbUMim7XHfPnym/zpxGbUXtC3YafK3VYnmPYYlBk6g9YnpUVLSq2FOjT5huxh4O0qwXLrGA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2fd8b1-47f8-4dd9-09c3-08d7c47b6115
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2020 22:44:08.3785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TVA/fInfEWGehqDOGTqLY2ILbP2JNv0NQmArOyIScuqwbkSdyEmm93uepSXZmSxTZFaj1RJI5TL3mnJqwn8wKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5960
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029MiL2c032588
X-loop: dm-devel@redhat.com
Cc: "awalsh@redhat.com" <awalsh@redhat.com>,
	"jdorminy@redhat.com" <jdorminy@redhat.com>,
	"corwin@redhat.com" <corwin@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v4] dm ebs: new block size emulating target
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

On 2020/03/10 7:26, heinzm@redhat.com wrote:
> From: Heinz Mauelshagen <heinzm@redhat.com>
> 
> dm ebs: new block size emulating target
> 
> This new target is similar to the linear target except that it emulates
> a smaller logical block size on devices with larger ones.  It's main
> purpose is to emulate 512 byte sectors on 4K native disks (i.e. 512e).
> 
> See Documentation/admin-guide/device-mapper/dm-ebs.rst for details.
> 
> Changes versus version 3 sent on 2/19/2020:
> 
> - document 'struct ebs_c' and rename its blocksize and block shift fields
> - inline functions (e.g. __nr_blocks())
> - adjust __ebs_rw_bvec() function header format
> - access page_address() after bv_page check; typo
> - avoid superfluous check defining bi_status in __ebs_process_bios()
> - correct indentation
> - avoid op_is_flush() causing REQ_FUA bios to be
>   remapped hence not processed by the target
> - call flush_dcache_page() correlated with memcpy() to ensure
>   D-cache aliasing as of cache and TLB flushing guidelines
> - comments

Generally, the change log is not added as part of the commit message and
mentioned after the "---" and all change logs "from v1", "from v2" etc kept so
that everybody can see the progression.

> 
> Reviewed-by: Damien Le Moal <DamienLeMoal@wdc.com>
> Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
> ---
>  .../admin-guide/device-mapper/dm-ebs.rst      |  51 ++
>  drivers/md/Kconfig                            |   8 +
>  drivers/md/Makefile                           |   2 +
>  drivers/md/dm-ebs-target.c                    | 439 ++++++++++++++++++
>  4 files changed, 500 insertions(+)
>  create mode 100644 Documentation/admin-guide/device-mapper/dm-ebs.rst
>  create mode 100644 drivers/md/dm-ebs-target.c
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-ebs.rst b/Documentation/admin-guide/device-mapper/dm-ebs.rst
> new file mode 100644
> index 000000000000..9e7abd3e0ae1
> --- /dev/null
> +++ b/Documentation/admin-guide/device-mapper/dm-ebs.rst
> @@ -0,0 +1,51 @@
> +======
> +dm-ebs
> +======
> +
> +
> +This target is similar to the linear target, except that it emulates
> +a smaller logical block size on devices with larger ones.  Its main
> +purpose is to provide emulation of 512 byte sectors on devices
> +that do not provide this emulation (i.e. 4K native disks).
> +
> +Supported emulated logical block sizes 512, 1024, 2048 and 4096.

Nit: there is no verb in this sentence.

> +
> +Underlying block size can be set to > 4K to test buffering larger units.
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
> index 000000000000..023354210dd2
> --- /dev/null
> +++ b/drivers/md/dm-ebs-target.c
> @@ -0,0 +1,439 @@
> +/*
> + * Copyright (C) 2020 Red Hat GmbH
> + *
> + * This file is released under the GPL.

Please us a SPDX header on top of the file instead of this sentence.
E.g.

// SPDX-License-Identifier: GPL-2.0

as the file first line.

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
> +	struct dm_dev *dev;		/* Underlying device to emulate block size on. */
> +	struct dm_bufio_client *bufio;	/* Use dm-bufio for read and read-modify-write processing. */
> +	struct workqueue_struct *wq;	/* Workqueue for ^ processing of bios. */
> +	struct work_struct ws;		/* Work item used for ^. */
> +	struct bio_list bios_in;	/* Worker bios input list. */
> +	spinlock_t lock;		/* Guard bios input list above. */
> +	sector_t start;			/* <start> table line argument, see ebs_ctr below. */
> +	unsigned int e_bs;		/* Emulated block size in sectors exposed to upper layer. */
> +	unsigned int u_bs;		/* Underlying block size in sectors retrievd from/set on lower layer device. */
> +	unsigned char block_shift;	/* bitshift sectors -> blocks used in dm-bufio API. */
> +	bool u_bs_set:1;		/* Flag to indicate underlying block size is set on table line. */
> +};
> +
> +static inline sector_t __sector_to_block(struct ebs_c *ec, sector_t sector)
> +{
> +	return sector >> ec->block_shift;
> +}
> +
> +static inline sector_t __block_mod(sector_t sector, unsigned int bs)
> +{
> +	return sector & (bs - 1);
> +}
> +
> +/* Return number of blocks for a bio accounting for misalignement of start and end sectors. */
> +static inline unsigned int __nr_blocks(struct ebs_c *ec, struct bio *bio)
> +{
> +	sector_t end_sector = __block_mod(bio->bi_iter.bi_sector, ec->u_bs) + bio_sectors(bio);
> +
> +	return __sector_to_block(ec, end_sector) + (__block_mod(end_sector, ec->u_bs) ? 1 : 0);
> +}
> +
> +static inline bool __ebs_check_bs(unsigned int bs)
> +{
> +	return bs && is_power_of_2(bs);
> +}
> +
> +/*
> + * READ/WRITE:
> + *
> + * copy blocks between bufio blocks and bio vector's (partial/overlapping) pages.
> + */
> +static int __ebs_rw_bvec(struct ebs_c *ec, int rw, struct bio_vec *bv, struct bvec_iter *iter)
> +{
> +	int r = 0;
> +	unsigned char *ba, *pa;
> +	unsigned int cur_len;
> +	unsigned int bv_len = bv->bv_len;
> +	unsigned int buf_off = to_bytes(__block_mod(iter->bi_sector, ec->u_bs));
> +	sector_t block = __sector_to_block(ec, iter->bi_sector);
> +	struct dm_buffer *b;
> +
> +	if (unlikely(!bv->bv_page || !bv_len))
> +		return -EIO;
> +
> +	pa = page_address(bv->bv_page) + bv->bv_offset;
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
> +			if (rw == READ) {
> +				memcpy(pa, ba, cur_len);
> +				flush_dcache_page(bv->bv_page);
> +			} else {
> +				flush_dcache_page(bv->bv_page);
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
> +	for (; blocks--; sector += ec->u_bs)
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
> +			if (__block_mod(bio->bi_iter.bi_sector, ec->u_bs))
> +				dm_bufio_prefetch(ec->bufio, block1, 1);
> +			if (__block_mod(bio_end_sector(bio), ec->u_bs) && block2 != block1)
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
> +		bio->bi_status = r;
> +	}
> +
> +	/*
> +	 * We write dirty buffers after processing I/O on them
> +	 * but before we endio thus addressing REQ_FUA/REQ_SYNC.
> +	 */
> +	r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;
> +
> +	while ((bio = bio_list_pop(&bios))) {
> +		/* Any other request is endioed. */
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
> + * 	    optional, if not supplied, retrieve logical block size from underlying device
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
> +	    tmp != (sector_t)tmp ||
> +	    (sector_t)tmp >= ti->len) {
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
> +	ec->e_bs = tmp1;
> +
> +	if (argc > 3) {
> +		if (sscanf(argv[3], "%hu%c", &tmp1, &dummy) != 1 || !__ebs_check_bs(tmp1)) {
> +			ti->error = "Invalid underlying block size";
> +			goto bad;
> +		}
> +		ec->u_bs = tmp1;
> +		ec->u_bs_set = true;
> +	} else
> +		ec->u_bs_set = false;
> +
> +	r = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &ec->dev);
> +	if (r) {
> +		ti->error = "Device lookup failed";
> +		ec->dev = NULL;
> +		goto bad;
> +	}
> +
> +	r = -EINVAL;
> +	if (!ec->u_bs_set) {
> +		ec->u_bs = to_sector(bdev_logical_block_size(ec->dev->bdev));
> +		if (!__ebs_check_bs(ec->u_bs)) {
> +			ti->error = "Invalid retrieved underlying block size";
> +			goto bad;
> +		}
> +	}
> +
> +	if (!ec->u_bs_set && ec->e_bs == ec->u_bs)
> +		DMINFO("Emulation superfluous: emulated equal to underlying block size");
> +
> +	if (__block_mod(ec->start, ec->u_bs)) {
> +		ti->error = "Device offset must be multiple of underlying block size";
> +		goto bad;
> +	}
> +
> +	ec->bufio = dm_bufio_client_create(ec->dev->bdev, to_bytes(ec->u_bs), 1, 0, NULL, NULL);
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
> +	ec->block_shift = __ffs(ec->u_bs);
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
> +	if (unlikely(bio->bi_opf & REQ_OP_FLUSH))
> +		return DM_MAPIO_REMAPPED;
> +	/*
> +	 * Only queue for bufio processing in case of partial or overlapping buffers
> +	 * -or-
> +	 * emulation with ebs == ubs aiming for tests of dm-bufio overhead.
> +	 */
> +	if (likely(__block_mod(bio->bi_iter.bi_sector, ec->u_bs) ||
> +		   __block_mod(bio_end_sector(bio), ec->u_bs) ||
> +		   ec->e_bs == ec->u_bs)) {
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
> +		snprintf(result, maxlen, ec->u_bs_set ? "%s %llu %u %u" : "%s %llu %u",
> +			 ec->dev->name, (unsigned long long) ec->start, ec->e_bs, ec->u_bs);
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
> +	limits->logical_block_size = to_bytes(ec->e_bs);
> +	limits->physical_block_size = to_bytes(ec->u_bs);
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

