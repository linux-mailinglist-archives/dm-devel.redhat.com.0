Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D3FA1134F92
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jan 2020 23:46:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578523615;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YeiuEkCTkHdAcvuUOPwQkLHbuZWFrGvakouTope1fF4=;
	b=bkt+Pm5/iSrcG2CXlmr9qGK736CA+BVn98lcKsQHwGrB6WX9MPTsJWtHLobh7C8NcJ1njZ
	3HhMpYJrv1dRzTF9LeXau08dEeZSIl+H1Es4xfTO54tYJng41vD4Iy7iqt17ZnKBkm2zon
	E42MtUu/YYOvzCj4gQNPFosbBw8vkCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-Gg4VkaSnMQqsBMoYYtvGuA-1; Wed, 08 Jan 2020 17:46:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C06800A02;
	Wed,  8 Jan 2020 22:46:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64CA1100194E;
	Wed,  8 Jan 2020 22:46:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA410503A8;
	Wed,  8 Jan 2020 22:46:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 008MkCTO006480 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 17:46:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 807C42026D67; Wed,  8 Jan 2020 22:46:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 782722093CD1
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 22:46:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50688ED1C3
	for <dm-devel@redhat.com>; Wed,  8 Jan 2020 22:46:09 +0000 (UTC)
IronPort-SDR: TsSdJc5giH4txQ751+XVQohxzkGD+m/4brMVfqZ188Y0r6h8fGkgBm99zLLAPKzMideoHzavSE
	NqgnjDT8yUByCY7GVSVrtA9Q6iFplTpvjwzJlgwJ2EtNe4cydozOP1qSd7ONCxaS6L98krS5We
	tM0oD+XNc9xOpxr+DphO8U6Zn3fCdRtuMrqv+E4/ItFwzysfv61gjykzdY7gvMDn3Q2Fk71qyS
	WOHKNuxiCnL9zRVdzy+lilf9EiY2D+xjiKc1FLp9w8ebGBl0TvEx0eT3X1dVzKMQLELUnzNkag
	cho=
X-IronPort-AV: E=Sophos;i="5.69,411,1571673600"; d="scan'208";a="127725040"
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-16-4FrROFdFM_Kjz39SHQDghA-1; Wed, 08 Jan 2020 17:46:08 -0500
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jan 2020 06:46:07 +0800
Received: from BN8PR04MB6433.namprd04.prod.outlook.com (10.255.235.211) by
	BN8PR04MB5761.namprd04.prod.outlook.com (20.179.74.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.12; Wed, 8 Jan 2020 22:46:04 +0000
Received: from BN8PR04MB6433.namprd04.prod.outlook.com
	([fe80::f892:80a0:2042:4ccc]) by
	BN8PR04MB6433.namprd04.prod.outlook.com
	([fe80::f892:80a0:2042:4ccc%5]) with mapi id 15.20.2623.008;
	Wed, 8 Jan 2020 22:46:03 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH] dm-zoned: extend the way of exposing zoned block
	device
Thread-Index: AQHVxfMNnQoMCHRmi0W7OlJyEMQ1p6fgyCQAgACN5cA=
Date: Wed, 8 Jan 2020 22:46:03 +0000
Message-ID: <BN8PR04MB6433B93DE0B03DC0EC30DD44E13E0@BN8PR04MB6433.namprd04.prod.outlook.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<9e7d2f84-6efa-7c44-2313-860d5e8ed067@oracle.com>
In-Reply-To: <9e7d2f84-6efa-7c44-2313-860d5e8ed067@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08c7c6c2-97fa-4125-48de-08d7948c8aac
x-ms-traffictypediagnostic: BN8PR04MB5761:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR04MB576199D505B067ACFBDBBC4CE13E0@BN8PR04MB5761.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(13464003)(199004)(189003)(86362001)(478600001)(186003)(110136005)(66476007)(54906003)(66556008)(52536014)(8936002)(26005)(7696005)(33656002)(316002)(76116006)(66946007)(2906002)(64756008)(66446008)(5660300002)(6506007)(53546011)(9686003)(55016002)(81156014)(4326008)(8676002)(81166006)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR04MB5761;
	H:BN8PR04MB6433.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C5QdpkkZMNeqfLvR1JBsjHRMK2/4L3Ah7lcjZ3lViaa2K6g2NUiNYYyV3GD9Wht5//TP409153Gm1B3Jsh2JyTKarMbRF2f7595wPaIOkGcSIkoe34vEaWVlAAiSfIKkrQ5r0xTzjNMskNG/zYAJW6VXOm+wTXov8RvOM7j0eKAj6/wtPa3mIrwppLWgqH4bKWElWr0h78ie25STIFoIzp3b6RNlpxvAYtoi0OJKISRJ0j9fgep1PZFkiZys/C54u7ZxFj8TwFmSAlgVC92qxWGa4FtnI1GVZRzYidb4yJWHnEfv+nba/fCjFC9PggRnD/EB30oylbSZLHZbmZRTohsvLQWP4o5n67mZNbrOK8GGB63m1+yXN2oE2kpZ6nzXCkmzL6diPrubijx3KEn3udemVPxcCWFgGMmE0ZhoGnemx1xB3F9x46qOjqAWkWrLz9L4Tw1rqDFac7x6L5bZkvBFM4f3BvYIp3Ih7Pm2ejhP3ayR4DFKjz2VdePVk8bi
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c7c6c2-97fa-4125-48de-08d7948c8aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 22:46:03.7122 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BR9KfcsbDGMXf+TUyg5ow3MBAUsvIjNJewtgl4r/HFQfy3bi/GmzlFeyH42+HjE4L8ujkIASvhK3F5104ED+Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5761
X-MC-Unique: 4FrROFdFM_Kjz39SHQDghA-1
X-MC-Unique: Gg4VkaSnMQqsBMoYYtvGuA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 008MkCTO006480
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"shirley.ma@oracle.com" <shirley.ma@oracle.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: linux-block-owner@vger.kernel.org <linux-block-
> owner@vger.kernel.org> On Behalf Of Bob Liu
> Sent: Wednesday, January 8, 2020 8:46 AM
> To: Damien Le Moal <Damien.LeMoal@wdc.com>; dm-devel@redhat.com
> Cc: linux-block@vger.kernel.org; snitzer@redhat.com; Dmitry Fomichev
> <Dmitry.Fomichev@wdc.com>; martin.petersen@oracle.com;
> shirley.ma@oracle.com
> Subject: Re: [RFC PATCH] dm-zoned: extend the way of exposing zoned
> block device
> 
> On 1/8/20 3:40 PM, Damien Le Moal wrote:
> > On 2020/01/08 16:13, Nobody wrote:
> >> From: Bob Liu <bob.liu@oracle.com>
> >>
> >> Motivation:
> >> Now the dm-zoned device mapper target exposes a zoned block
> device(ZBC) as a
> >> regular block device by storing metadata and buffering random writes in
> >> conventional zones.
> >> This way is not very flexible, there must be enough conventional zones
> and the
> >> performance may be constrained.
> >> By putting metadata(also buffering random writes) in separated device
> we can get
> >> more flexibility and potential performance improvement e.g by storing
> metadata
> >> in faster device like persistent memory.
> >>
> >> This patch try to split the metadata of dm-zoned to an extra block
> >> device instead of zoned block device itself.
> >> (Buffering random writes also in the todo list.)
> >>
> >> Patch is at the very early stage, just want to receive some feedback about
> >> this extension.
> >> Another option is to create an new md-zoned device with separated
> metadata
> >> device based on md framework.
> >
> > For metadata only, it should not be hard at all to move to another
> > conventional zone device. It will however be a little more tricky for
> > conventional zones used for data since dm-zoned assumes that this
> random
> > write space is also zoned. Moving this space to a conventional device
> > requires implementing a zone emulation (fake zones) for the regular
> > drive, using a zone size that matches the size of sequential zones.
> >
> 
> Indeed.
> I'll try to implement zone emulation next version.
> 
> > Beyond this, dm-zoned also needs to be changed to accept partial drives
> > and the dm core code to accept mixing of regular and zoned disks (that
> > is forbidden now).
> >
> 
> Do you mean the check in device_area_is_invalid()?
> 
>  320         /*
>  321          * If the target is mapped to zoned block device(s), check
>  322          * that the zones are not partially mapped.
>  323          */
>  324         if (bdev_zoned_model(bdev) != BLK_ZONED_NONE) {
> 
> > Another approach worth exploring is stacking dm-zoned as is on top of a
> > modified dm-linear with the ability to emulate conventional zones on top
> > of a regular block device (you only need report zones method
> > implemented). That is much easier to do. We actually hacked something
> > like that last month to see the performance change and saw a jump from
> > 56 MB/s to 250 MB/s for write intensive workloads (file creation on
> > ext4). I am not so warm in this approach though as it modifies dm-linear
> > and we want to keep it very lean and simple. Modifying dm-zoned to allow
> > support for a device pair is a better approach I think.
> >
> >>
> >> Signed-off-by: Bob Liu <bob.liu@oracle.com>
> >> ---
> >>  drivers/md/dm-zoned-metadata.c |  6 +++---
> >>  drivers/md/dm-zoned-target.c   | 15 +++++++++++++--
> >>  drivers/md/dm-zoned.h          |  1 +
> >>  3 files changed, 17 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-
> metadata.c
> >> index 22b3cb0..89cd554 100644
> >> --- a/drivers/md/dm-zoned-metadata.c
> >> +++ b/drivers/md/dm-zoned-metadata.c
> >> @@ -439,7 +439,7 @@ static struct dmz_mblock
> *dmz_get_mblock_slow(struct dmz_metadata *zmd,
> >>
> >>  	/* Submit read BIO */
> >>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> >> -	bio_set_dev(bio, zmd->dev->bdev);
> >> +	bio_set_dev(bio, zmd->dev->meta_bdev);
> >>  	bio->bi_private = mblk;
> >>  	bio->bi_end_io = dmz_mblock_bio_end_io;
> >>  	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
> >> @@ -593,7 +593,7 @@ static int dmz_write_mblock(struct dmz_metadata
> *zmd, struct dmz_mblock *mblk,
> >>  	set_bit(DMZ_META_WRITING, &mblk->state);
> >>
> >>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> >> -	bio_set_dev(bio, zmd->dev->bdev);
> >> +	bio_set_dev(bio, zmd->dev->meta_bdev);
> >>  	bio->bi_private = mblk;
> >>  	bio->bi_end_io = dmz_mblock_bio_end_io;
> >>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
> >> @@ -620,7 +620,7 @@ static int dmz_rdwr_block(struct dmz_metadata
> *zmd, int op, sector_t block,
> >>  		return -ENOMEM;
> >>
> >>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> >> -	bio_set_dev(bio, zmd->dev->bdev);
> >> +	bio_set_dev(bio, zmd->dev->meta_bdev);
> >>  	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
> >>  	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
> >>  	ret = submit_bio_wait(bio);
> >> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-
> target.c
> >> index 70a1063..55c64fe 100644
> >> --- a/drivers/md/dm-zoned-target.c
> >> +++ b/drivers/md/dm-zoned-target.c
> >> @@ -39,6 +39,7 @@ struct dm_chunk_work {
> >>   */
> >>  struct dmz_target {
> >>  	struct dm_dev		*ddev;
> >> +	struct dm_dev           *metadata_dev;
> >
> > This naming would be confusing as it implies metadata only. If you also
> > want to move the random write zones to a regular device, then I would
> > suggest names like:
> >
> > ddev -> zoned_bdev (the zoned device, e.g. SMR disk)
> > metadata_dev -> reg_bdev (regular block device, e.g. an SSD)
> >
> 
> Will update.
> 
> > The metadata+random write (fake) zones space can use the regular block
> > device, and all sequential zones are assumed to be on the zoned device.
> > Care must be taken to handle the case of a zoned device that has
> > conventional zones: these could be used as is, not needing any reclaim,
> 
> Agree, that won't make things too complicate.
> Thank you for all the suggestions.
> 
> Regards,
> Bob
> 
> > so potentially contributing to further optimization.
> >
> >>
> >>  	unsigned long		flags;
> >>
> >> @@ -701,6 +702,7 @@ static int dmz_get_zoned_device(struct dm_target
> *ti, char *path)
> >>  		goto err;
> >>  	}
> >>
> >> +	dev->meta_bdev = dmz->metadata_dev->bdev;
> >>  	dev->bdev = dmz->ddev->bdev;
> >>  	(void)bdevname(dev->bdev, dev->name);
> >>
> >> @@ -761,7 +763,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned
> int argc, char **argv)
> >>  	int ret;
> >>
> >>  	/* Check arguments */
> >> -	if (argc != 1) {
> >> +	if (argc != 2) {
> >>  		ti->error = "Invalid argument count";
> >>  		return -EINVAL;
> >>  	}

I like the idea to have an additional device in dm-zoned as the source of random
zones as opposed to using block range concatenation via dm-linear. But,
shouldn't we retain the possibility to use just the conventional zones that exist
on the drive? This seems necessary for backwards compatibility. In the code
above, if the arg count is one, the processing probably should fall back to the
existing way of using drive's conventional zones.

> >> @@ -774,8 +776,16 @@ static int dmz_ctr(struct dm_target *ti, unsigned
> int argc, char **argv)
> >>  	}
> >>  	ti->private = dmz;
> >>
> >> +	/* Get the metadata block device */
> >> +	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table),
> >> +			&dmz->metadata_dev);
> >> +	if (ret) {
> >> +		dmz->metadata_dev = NULL;
> >> +		goto err;
> >> +	}
> >> +
> >>  	/* Get the target zoned block device */
> >> -	ret = dmz_get_zoned_device(ti, argv[0]);
> >> +	ret = dmz_get_zoned_device(ti, argv[1]);
> >>  	if (ret) {
> >>  		dmz->ddev = NULL;
> >>  		goto err;
> >> @@ -856,6 +866,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned
> int argc, char **argv)
> >>  err_dev:
> >>  	dmz_put_zoned_device(ti);
> >>  err:
> >> +	dm_put_device(ti, dmz->metadata_dev);
> >>  	kfree(dmz);
> >>
> >>  	return ret;
> >> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> >> index 5b5e493..e789ff5 100644
> >> --- a/drivers/md/dm-zoned.h
> >> +++ b/drivers/md/dm-zoned.h
> >> @@ -50,6 +50,7 @@
> >>   */
> >>  struct dmz_dev {
> >>  	struct block_device	*bdev;
> >> +	struct block_device     *meta_bdev;
> >>
> >>  	char			name[BDEVNAME_SIZE];
> >>
> >>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

